import 'package:drift/drift.dart';
import '../../core/database/app_database.dart';
import '../../core/database/tables.dart';

/// Screen tidak boleh import Drift/DAO langsung — selalu lewat
/// repository ini. Kalau nanti struktur database berubah, cukup
/// ubah di sini, screen tidak perlu tahu.
class PendataanRepository {
  final _dao = appDatabase.pendataanDao;

  Stream<List<PendataanEntry>> watchAllEntries() => _dao.watchAllEntries();

  Stream<int> watchTotalCount() => _dao.watchTotalCount();

  Stream<int> watchPendingCount() => _dao.watchCountByStatus('pending');

  Stream<int> watchSyncedCount() => _dao.watchCountByStatus('synced');

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
}
