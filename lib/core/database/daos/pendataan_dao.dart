import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'pendataan_dao.g.dart';

@DriftAccessor(tables: [PendataanEntries, PendataanPhotos])
class PendataanDao extends DatabaseAccessor<AppDatabase> with _$PendataanDaoMixin {
  PendataanDao(super.db);

  // --- Entries ---

  /// Stream = otomatis rebuild UI setiap ada perubahan data,
  /// tanpa perlu setState manual. Diurutkan terbaru dulu.
  Stream<List<PendataanEntry>> watchAllEntries() {
    return (select(pendataanEntries)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .watch();
  }

  /// Satu entri, reaktif — dipakai DetailScreen supaya otomatis
  /// ter-update begitu entri diedit, disinkronkan, atau dihapus,
  /// tanpa perlu Navigator.pop lalu buka lagi.
  Stream<PendataanEntry?> watchEntryById(int id) {
    return (select(pendataanEntries)..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  Stream<int> watchTotalCount() {
    final count = pendataanEntries.id.count();
    final query = selectOnly(pendataanEntries)..addColumns([count]);
    return query.map((row) => row.read(count) ?? 0).watchSingle();
  }

  Stream<int> watchCountByStatus(String status) {
    final count = pendataanEntries.id.count();
    final query = selectOnly(pendataanEntries)
      ..addColumns([count])
      ..where(pendataanEntries.syncStatus.equals(status));
    return query.map((row) => row.read(count) ?? 0).watchSingle();
  }

  Future<int> insertEntry(PendataanEntriesCompanion entry) {
    return into(pendataanEntries).insert(entry);
  }

  Future<bool> updateEntry(PendataanEntriesCompanion entry) {
    return update(pendataanEntries).replace(entry);
  }

  Future<void> markAsSynced(int id, String firestoreId) {
    return (update(pendataanEntries)..where((t) => t.id.equals(id))).write(
      PendataanEntriesCompanion(
        syncStatus: const Value('synced'),
        firestoreId: Value(firestoreId),
      ),
    );
  }

  /// Dipakai saat entri diedit (perlu di-sync ulang, firestoreId
  /// dipertahankan supaya overwrite dokumen yang sama).
  Future<void> markAsPending(int id) {
    return (update(pendataanEntries)..where((t) => t.id.equals(id)))
        .write(const PendataanEntriesCompanion(syncStatus: Value('pending')));
  }

  /// Dipanggil setelah entri berhasil dihapus dari Firebase (baris
  /// lokalnya sengaja tetap ada) — beda dari markAsPending karena
  /// firestoreId juga dikosongkan, supaya kalau di-sync lagi nanti
  /// dianggap dokumen baru, bukan overwrite dokumen yang sudah dihapus.
  Future<void> resetSyncStatus(int id) {
    return (update(pendataanEntries)..where((t) => t.id.equals(id))).write(
      const PendataanEntriesCompanion(
        syncStatus: Value('pending'),
        firestoreId: Value(null),
      ),
    );
  }

  Future<int> deleteEntry(int id) {
    return (delete(pendataanEntries)..where((t) => t.id.equals(id))).go();
  }

  /// Semua entry yang masih 'pending' — dipakai Sync Engine untuk tahu
  /// apa saja yang perlu di-push ke Firestore.
  Future<List<PendataanEntry>> getPendingEntries() {
    return (select(pendataanEntries)
          ..where((t) => t.syncStatus.equals('pending')))
        .get();
  }

  /// Entri terbaru di titik pengamatan yang sama — dipakai form untuk
  /// menawarkan "salin kondisi habitat" supaya user tidak isi ulang
  /// pH/kelembapan/suhu/deskripsi kalau masih di titik yang sama.
  Future<PendataanEntry?> getLatestEntryForTitik(String titik) {
    return (select(pendataanEntries)
          ..where((t) => t.titikPengamatan.equals(titik))
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> deleteAllEntries() => delete(pendataanEntries).go();

  // --- Photos ---

  Future<int> insertPhoto(PendataanPhotosCompanion photo) {
    return into(pendataanPhotos).insert(photo);
  }

  Stream<List<PendataanPhoto>> watchPhotosForEntry(int entryId) {
    return (select(pendataanPhotos)..where((t) => t.entryId.equals(entryId)))
        .watch();
  }

  Future<List<PendataanPhoto>> getPhotosForEntry(int entryId) {
    return (select(pendataanPhotos)..where((t) => t.entryId.equals(entryId)))
        .get();
  }

  /// Dipanggil sync engine setelah berhasil upload satu foto ke
  /// Firebase Storage, supaya foto yang sama tidak diupload ulang
  /// kalau sync diulang/gagal di tengah jalan.
  Future<void> updatePhotoUploadedUrl(int photoId, String url) {
    return (update(pendataanPhotos)..where((t) => t.id.equals(photoId)))
        .write(PendataanPhotosCompanion(uploadedUrl: Value(url)));
  }

  Future<int> deletePhoto(int photoId) {
    return (delete(pendataanPhotos)..where((t) => t.id.equals(photoId))).go();
  }
}
