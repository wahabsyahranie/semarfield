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

  Future<int> deleteEntry(int id) {
    return (delete(pendataanEntries)..where((t) => t.id.equals(id))).go();
  }

  /// Semua entry yang masih 'pending' — dipakai Sprint 6 untuk tahu
  /// apa saja yang perlu di-push ke Firestore.
  Future<List<PendataanEntry>> getPendingEntries() {
    return (select(pendataanEntries)
          ..where((t) => t.syncStatus.equals('pending')))
        .get();
  }

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
}
