// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pendataan_dao.dart';

// ignore_for_file: type=lint
mixin _$PendataanDaoMixin on DatabaseAccessor<AppDatabase> {
  $PendataanEntriesTable get pendataanEntries =>
      attachedDatabase.pendataanEntries;
  $PendataanPhotosTable get pendataanPhotos => attachedDatabase.pendataanPhotos;
  PendataanDaoManager get managers => PendataanDaoManager(this);
}

class PendataanDaoManager {
  final _$PendataanDaoMixin _db;
  PendataanDaoManager(this._db);
  $$PendataanEntriesTableTableManager get pendataanEntries =>
      $$PendataanEntriesTableTableManager(
        _db.attachedDatabase,
        _db.pendataanEntries,
      );
  $$PendataanPhotosTableTableManager get pendataanPhotos =>
      $$PendataanPhotosTableTableManager(
        _db.attachedDatabase,
        _db.pendataanPhotos,
      );
}
