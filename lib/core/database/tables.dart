import 'package:drift/drift.dart';

/// Satu baris = satu individu Nepenthes yang didata di satu titik.
/// Field yang boleh kosong (nullable) sengaja dibuat nullable karena
/// tidak semua alat ukur selalu dibawa ke lapangan (lihat PDF sumber:
/// pH/kelembapan/suhu semua manual, tidak wajib ada).
class PendataanEntries extends Table {
  IntColumn get id => integer().autoIncrement()();

  // --- Lokasi & waktu ---
  TextColumn get titikPengamatan => text()(); // contoh: "TP-A01"
  DateTimeColumn get tanggalPengamatan => dateTime()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  RealColumn get gpsAccuracyMeter => real().nullable()();
  BoolColumn get koordinatBelumLengkap =>
      boolean().withDefault(const Constant(false))();
  RealColumn get ketinggianMdpl => real().nullable()();

  // --- Data individu ---
  TextColumn get spesies => text().nullable()();
  RealColumn get panjangKantongCm => real().nullable()();
  RealColumn get diameterKantongCm => real().nullable()();
  RealColumn get tinggiTanamanCm => real().nullable()();
  RealColumn get panjangDaunCm => real().nullable()();
  TextColumn get warnaKantong => text().nullable()();
  IntColumn get jumlahIndividu => integer().nullable()();

  // --- Kondisi habitat (manual, tanpa sensor) ---
  RealColumn get phTanah => real().nullable()();
  RealColumn get kelembapanTanahPersen => real().nullable()();
  RealColumn get kelembapanUdaraPersen => real().nullable()();
  RealColumn get suhuUdaraCelsius => real().nullable()();
  TextColumn get deskripsiHabitat => text().nullable()();

  // --- Metadata & status sync ---
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().withDefault(currentDateAndTime)();
  // Nilai: 'pending' atau 'synced'
  TextColumn get syncStatus => text().withDefault(const Constant('pending'))();
  // ID dokumen di Firestore setelah berhasil sync (Sprint 6)
  TextColumn get firestoreId => text().nullable()();
}

/// Foto terkait satu entry — bisa banyak per entry, dan dibedakan
/// jenisnya (foto kantong vs foto area sekitar/habitat).
class PendataanPhotos extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get entryId =>
      integer().references(PendataanEntries, #id, onDelete: KeyAction.cascade)();
  TextColumn get localPath => text()(); // path file di penyimpanan device
  // Nilai: 'kantong' atau 'habitat'
  TextColumn get jenisFoto => text()();
  TextColumn get uploadedUrl => text().nullable()(); // diisi setelah sync
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
