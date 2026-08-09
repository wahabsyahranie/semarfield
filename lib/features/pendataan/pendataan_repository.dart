import 'package:drift/drift.dart';
import '../../core/database/app_database.dart';
import '../../core/database/tables.dart';
import '../../core/utils/text_format.dart';

/// Screen tidak boleh import Drift/DAO langsung — selalu lewat
/// repository ini. Kalau nanti struktur database berubah, cukup
/// ubah di sini, screen tidak perlu tahu.
class PendataanRepository {
  final _dao = appDatabase.pendataanDao;

  Stream<List<PendataanEntry>> watchAllEntries() => _dao.watchAllEntries();

  Future<List<PendataanEntry>> getAllEntries() => _dao.getAllEntries();

  Stream<int> watchTotalCount() => _dao.watchTotalCount();

  Stream<int> watchPendingCount() => _dao.watchCountByStatus('pending');

  Stream<int> watchSyncedCount() => _dao.watchCountByStatus('synced');

  Stream<PendataanEntry?> watchEntryById(int id) => _dao.watchEntryById(id);

  Future<int> tambahEntry({
    required String titikPengamatan,
    required DateTime tanggalPengamatan,
    double? latitude,
    double? longitude,
    double? gpsAccuracyMeter,
    bool koordinatBelumLengkap = false,
    double? ketinggianMdpl,
    String? spesies,
    double? panjangKantongCm,
    double? diameterKantongCm,
    double? tinggiTanamanCm,
    double? panjangDaunCm,
    String? warnaKantong,
    int? jumlahIndividu,
    double? phTanah,
    double? kelembapanTanahPersen,
    double? kelembapanUdaraPersen,
    double? suhuUdaraCelsius,
    String? deskripsiHabitat,
  }) {
    return _dao.insertEntry(PendataanEntriesCompanion.insert(
      titikPengamatan: titikPengamatan,
      tanggalPengamatan: tanggalPengamatan,
      latitude: Value(latitude),
      longitude: Value(longitude),
      gpsAccuracyMeter: Value(gpsAccuracyMeter),
      koordinatBelumLengkap: Value(koordinatBelumLengkap),
      ketinggianMdpl: Value(ketinggianMdpl),
      spesies: Value(spesies),
      panjangKantongCm: Value(panjangKantongCm),
      diameterKantongCm: Value(diameterKantongCm),
      tinggiTanamanCm: Value(tinggiTanamanCm),
      panjangDaunCm: Value(panjangDaunCm),
      warnaKantong: Value(warnaKantong),
      jumlahIndividu: Value(jumlahIndividu),
      phTanah: Value(phTanah),
      kelembapanTanahPersen: Value(kelembapanTanahPersen),
      kelembapanUdaraPersen: Value(kelembapanUdaraPersen),
      suhuUdaraCelsius: Value(suhuUdaraCelsius),
      deskripsiHabitat: Value(deskripsiHabitat),
    ));
  }

  Future<void> hapusEntry(int id) => _dao.deleteEntry(id);

  /// Update entri yang sudah ada (mode edit). Sengaja reset
  /// syncStatus jadi 'pending' lagi — kalau entri ini sudah pernah
  /// tersinkron sebelumnya, perubahan ini perlu naik ulang ke
  /// Firestore. firestoreId TETAP dipertahankan supaya SyncService
  /// nanti overwrite dokumen yang sama, bukan bikin duplikat.
  Future<void> perbaruiEntry({
    required int id,
    required String titikPengamatan,
    required DateTime tanggalPengamatan,
    double? latitude,
    double? longitude,
    double? gpsAccuracyMeter,
    bool koordinatBelumLengkap = false,
    double? ketinggianMdpl,
    String? spesies,
    double? panjangKantongCm,
    double? diameterKantongCm,
    double? tinggiTanamanCm,
    double? panjangDaunCm,
    String? warnaKantong,
    int? jumlahIndividu,
    double? phTanah,
    double? kelembapanTanahPersen,
    double? kelembapanUdaraPersen,
    double? suhuUdaraCelsius,
    String? deskripsiHabitat,
    // Elevasi dari Google Maps Elevation API TIDAK diinput lewat form —
    // parameter ini murni untuk PRESERVE nilai lama saat field lain
    // diedit (karena updateEntry pakai .replace(), yang butuh SEMUA
    // kolom eksplisit). Pemanggil (form) yang menentukan: kirim ulang
    // nilai lama kalau koordinat tidak berubah, atau null kalau
    // koordinat berubah (karena elevasi lama jadi tidak relevan lagi).
    double? elevasiApiMeter,
  }) {
    return _dao.updateEntry(PendataanEntriesCompanion(
      id: Value(id),
      titikPengamatan: Value(titikPengamatan),
      tanggalPengamatan: Value(tanggalPengamatan),
      latitude: Value(latitude),
      longitude: Value(longitude),
      gpsAccuracyMeter: Value(gpsAccuracyMeter),
      koordinatBelumLengkap: Value(koordinatBelumLengkap),
      ketinggianMdpl: Value(ketinggianMdpl),
      spesies: Value(spesies),
      panjangKantongCm: Value(panjangKantongCm),
      diameterKantongCm: Value(diameterKantongCm),
      tinggiTanamanCm: Value(tinggiTanamanCm),
      panjangDaunCm: Value(panjangDaunCm),
      warnaKantong: Value(warnaKantong),
      jumlahIndividu: Value(jumlahIndividu),
      phTanah: Value(phTanah),
      kelembapanTanahPersen: Value(kelembapanTanahPersen),
      kelembapanUdaraPersen: Value(kelembapanUdaraPersen),
      suhuUdaraCelsius: Value(suhuUdaraCelsius),
      deskripsiHabitat: Value(deskripsiHabitat),
      elevasiApiMeter: Value(elevasiApiMeter),
      syncStatus: const Value('pending'),
    ));
  }

  /// Simpan hasil fetch dari Google Maps Elevation API — dipanggil
  /// dari Detail screen saja, tidak pernah dari form.
  Future<void> updateElevasiApi(int id, double elevasi) =>
      _dao.updateElevasiApi(id, elevasi);

  Future<void> hapusFoto(int photoId) => _dao.deletePhoto(photoId);

  Future<void> markEntryPending(int id) => _dao.markAsPending(id);

  /// Dipakai setelah entri dihapus dari Firebase — beda dari
  /// markEntryPending karena firestoreId juga dikosongkan.
  Future<void> resetSyncStatus(int id) => _dao.resetSyncStatus(id);

  Future<int> tambahFoto({
    required int entryId,
    required String localPath,
    required String jenisFoto, // 'kantong' | 'habitat'
  }) {
    return _dao.insertPhoto(PendataanPhotosCompanion.insert(
      entryId: entryId,
      localPath: localPath,
      jenisFoto: jenisFoto,
    ));
  }

  Stream<List<PendataanPhoto>> watchPhotosForEntry(int entryId) =>
      _dao.watchPhotosForEntry(entryId);

  // --- Dipakai Sync Engine (Sprint 6) ---

  Future<List<PendataanEntry>> getPendingEntries() => _dao.getPendingEntries();

  Future<PendataanEntry?> getLatestEntryForTitik(String titik) =>
      _dao.getLatestEntryForTitik(titik);

  Future<int> hapusSemuaDataLokal() => _dao.deleteAllEntries();

  /// Migrasi data SATU KALI (aman dipanggil berkali-kali, jadi no-op
  /// setelah pertama kali) — menyamakan titikPengamatan entri LAMA yang
  /// dibuat sebelum aturan prefix 'TP-' ditambahkan (Sprint export/KML),
  /// supaya cocok dengan entri BARU yang sudah otomatis dinormalisasi.
  /// Tanpa ini, fitur "salin kondisi habitat" tidak akan menemukan
  /// kecocokan antara entri lama ('A01') dan entri baru ('TP-A01') di
  /// titik yang sebenarnya sama.
  Future<int> normalizeSemuaTitikPengamatanLama() async {
    final all = await _dao.getAllEntriesOnce();
    var fixed = 0;
    for (final e in all) {
      final normalized = normalizeTitik(e.titikPengamatan);
      if (normalized != e.titikPengamatan) {
        await _dao.updateTitikPengamatanOnly(e.id, normalized);
        fixed++;
      }
    }
    return fixed;
  }

  Future<List<PendataanPhoto>> getPhotosForEntry(int entryId) =>
      _dao.getPhotosForEntry(entryId);

  Future<void> markEntrySynced(int id, String firestoreId) =>
      _dao.markAsSynced(id, firestoreId);

  Future<void> updatePhotoUploadedUrl(int photoId, String url) =>
      _dao.updatePhotoUploadedUrl(photoId, url);
}
