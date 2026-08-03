import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../features/pendataan/pendataan_repository.dart';
import '../../features/profile/profile_repository.dart';
import '../database/app_database.dart';
import 'connectivity_service.dart';

class SyncFailure implements Exception {
  final String message;
  SyncFailure(this.message);
}

class SyncResult {
  final int entriesSynced;
  final int entriesFailed;
  final bool profileSynced;
  SyncResult({required this.entriesSynced, required this.entriesFailed, required this.profileSynced});

  bool get hasFailure => entriesFailed > 0;
  int get totalProcessed => entriesSynced + entriesFailed;
}

/// Jantung dari "offline yang bisa disinkronkan". Semua kelas lain
/// (PendataanRepository, ProfileRepository) sama sekali tidak tahu
/// soal Firebase — hanya SyncService ini yang bicara ke Firestore &
/// Storage, jadi kalau suatu saat provider cloud diganti, cukup
/// ubah satu file ini.
class SyncService {
  final _pendataanRepo = PendataanRepository();
  final _profileRepo = ProfileRepository();
  final _connectivity = ConnectivityService();
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<SyncResult> syncAll() async {
    final online = await _connectivity.isOnline();
    if (!online) {
      throw SyncFailure('Tidak ada koneksi internet. Coba lagi saat online.');
    }

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw SyncFailure('Sesi login tidak ditemukan. Silakan login ulang.');
    }

    var synced = 0;
    var failed = 0;

    final pendingEntries = await _pendataanRepo.getPendingEntries();
    for (final entry in pendingEntries) {
      try {
        await _syncOneEntry(uid: uid, entry: entry);
        synced++;
      } catch (_) {
        // Satu entri gagal (mis. koneksi putus di tengah upload foto)
        // TIDAK menghentikan entri lain — entri ini tetap 'pending'
        // dan otomatis dicoba lagi di sesi sync berikutnya.
        failed++;
      }
    }

    final profileSynced = await _syncProfileIfPending(uid: uid);

    return SyncResult(entriesSynced: synced, entriesFailed: failed, profileSynced: profileSynced);
  }

  /// Sync PROFIL SAJA — dipakai Profile screen saat user menekan
  /// "Simpan Perubahan", supaya edit nama/HP/foto langsung naik ke
  /// Firestore saat itu juga (tidak perlu nunggu user buka tombol
  /// sync manual terpisah, dan tidak ikut mendorong semua data
  /// pendataan yang mungkin masih pending — itu tetap urusan
  /// `syncAll()`, bukan tanggung jawab tombol simpan profil).
  ///
  /// Return true kalau berhasil sync ke Firestore. Return false
  /// (bukan throw) kalau offline — supaya pemanggilnya bisa tetap
  /// bilang "tersimpan lokal, nanti disinkronkan otomatis" alih-alih
  /// menampilkan error yang menakutkan untuk kondisi yang sebetulnya
  /// normal (lagi di lapangan tanpa sinyal).
  Future<bool> syncProfileOnly() async {
    final online = await _connectivity.isOnline();
    if (!online) return false;

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw SyncFailure('Sesi login tidak ditemukan. Silakan login ulang.');
    }

    return _syncProfileIfPending(uid: uid);
  }

  Future<void> _syncOneEntry({required String uid, required PendataanEntry entry}) async {
    final photos = await _pendataanRepo.getPhotosForEntry(entry.id);
    final photoData = <Map<String, String>>[];

    for (final photo in photos) {
      var url = photo.uploadedUrl;
      // Kalau foto ini sudah pernah berhasil diupload di percobaan
      // sync sebelumnya (lalu sync gagal di entri lain), jangan upload
      // ulang — ini yang membuat sync aman diulang berkali-kali.
      if (url == null) {
        final file = File(photo.localPath);
        if (!await file.exists()) continue; // foto hilang dari device, lewati
        final ref = _storage.ref('users/$uid/pendataan/${entry.id}/${photo.id}_${photo.jenisFoto}.jpg');
        await ref.putFile(file);
        url = await ref.getDownloadURL();
        await _pendataanRepo.updatePhotoUploadedUrl(photo.id, url);
      }
      photoData.add({'url': url, 'jenis': photo.jenisFoto});
    }

    // Pakai id lokal sebagai document id (bukan .add() yang selalu
    // bikin id baru) — supaya kalau sync diulang, dokumen yang sama
    // di-overwrite, bukan menduplikat data di Firestore.
    final docRef = _firestore
        .collection('users').doc(uid)
        .collection('pendataan').doc('entry_${entry.id}');

    await docRef.set({
      'titikPengamatan': entry.titikPengamatan,
      'tanggalPengamatan': entry.tanggalPengamatan.toIso8601String(),
      'latitude': entry.latitude,
      'longitude': entry.longitude,
      'gpsAccuracyMeter': entry.gpsAccuracyMeter,
      'koordinatBelumLengkap': entry.koordinatBelumLengkap,
      'ketinggianMdpl': entry.ketinggianMdpl,
      'spesies': entry.spesies,
      'panjangKantongCm': entry.panjangKantongCm,
      'diameterKantongCm': entry.diameterKantongCm,
      'tinggiTanamanCm': entry.tinggiTanamanCm,
      'panjangDaunCm': entry.panjangDaunCm,
      'warnaKantong': entry.warnaKantong,
      'jumlahIndividu': entry.jumlahIndividu,
      'phTanah': entry.phTanah,
      'kelembapanTanahPersen': entry.kelembapanTanahPersen,
      'kelembapanUdaraPersen': entry.kelembapanUdaraPersen,
      'suhuUdaraCelsius': entry.suhuUdaraCelsius,
      'deskripsiHabitat': entry.deskripsiHabitat,
      'foto': photoData,
      'dibuatDiDevicePada': entry.createdAt.toIso8601String(),
      'disinkronkanPada': FieldValue.serverTimestamp(),
    });

    await _pendataanRepo.markEntrySynced(entry.id, docRef.id);
  }

  Future<bool> _syncProfileIfPending({required String uid}) async {
    final profile = await _profileRepo.getProfileOnce();
    if (profile == null || profile.syncStatus != 'pending') return false;

    String? avatarUrl;
    if (profile.avatarLocalPath != null) {
      final file = File(profile.avatarLocalPath!);
      if (await file.exists()) {
        final ref = _storage.ref('users/$uid/profile/avatar.jpg');
        await ref.putFile(file);
        avatarUrl = await ref.getDownloadURL();
      }
    }

    await _firestore.collection('users').doc(uid).set({
      'displayName': profile.displayName,
      'phoneNumber': profile.phoneNumber,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    await _profileRepo.markProfileSynced();
    return true;
  }

  /// Tarik profil DARI Firestore ke lokal — dipanggil sekali saat Home
  /// pertama kali dibuka setelah login. HANYA jalan kalau profil lokal
  /// masih benar-benar kosong (belum pernah diisi apa pun di HP ini),
  /// supaya tidak menimpa perubahan yang sedang diketik/tersimpan user
  /// di HP ini dengan data lama dari cloud. Inilah yang membuat pindah
  /// HP dengan akun yang sama tetap menampilkan nama/HP/foto lama.
  Future<void> pullProfileIfNeeded() async {
    final local = await _profileRepo.getProfileOnce();
    final alreadyHasLocalData = local != null &&
        (local.displayName != null || local.phoneNumber != null || local.avatarLocalPath != null);
    if (alreadyHasLocalData) return;

    final online = await _connectivity.isOnline();
    if (!online) return; // diam-diam gagal, dicoba lagi di sesi berikutnya

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (!doc.exists) return;
      final data = doc.data()!;
      await _profileRepo.simpanProfileDariCloud(
        displayName: data['displayName'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        avatarRemoteUrl: data['avatarUrl'] as String?,
      );
    } catch (_) {
      // Diam-diam gagal — bukan aksi yang diminta user secara eksplisit,
      // jadi tidak perlu tampilkan error yang mengganggu.
    }
  }

  /// Hapus SATU entri dari Firestore + semua fotonya dari Storage.
  /// Ini terpisah sengaja dari hapus lokal (PendataanRepository.hapusEntry)
  /// — supaya "hapus dari HP" dan "hapus dari Firebase" adalah dua aksi
  /// yang jelas berbeda, tidak tercampur jadi satu tombol.
  Future<void> deleteEntryFromCloud(PendataanEntry entry) async {
    if (entry.firestoreId == null) {
      throw SyncFailure('Data ini belum pernah disinkronkan, tidak ada yang perlu dihapus di Firebase.');
    }
    final online = await _connectivity.isOnline();
    if (!online) {
      throw SyncFailure('Tidak ada koneksi internet.');
    }
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw SyncFailure('Sesi login tidak ditemukan.');

    // Hapus folder foto di Storage dulu, baru dokumennya di Firestore.
    try {
      final folderRef = _storage.ref('users/$uid/pendataan/${entry.id}');
      final listResult = await folderRef.listAll();
      for (final item in listResult.items) {
        await item.delete();
      }
    } catch (_) {
      // Kalau foto sudah tidak ada / folder kosong, abaikan — yang
      // penting dokumen Firestore-nya tetap dihapus di bawah ini.
    }

    await _firestore
        .collection('users').doc(uid)
        .collection('pendataan').doc(entry.firestoreId)
        .delete();

    // Dokumen cloud-nya sudah hilang — status lokal wajib balik ke
    // 'pending' supaya UI tidak salah bilang "Tersinkron" untuk data
    // yang sebenarnya sudah tidak ada copy-nya di server.
    await _pendataanRepo.markEntryPending(entry.id);
  }
}
