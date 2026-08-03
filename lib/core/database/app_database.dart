import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'tables.dart';
import 'daos/pendataan_dao.dart';
import 'daos/user_profile_dao.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  // LazyDatabase menunda pembukaan file sampai benar-benar dipakai —
  // aman dipanggil di top-level tanpa perlu async main().
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'semarfield.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(
  tables: [PendataanEntries, PendataanPhotos, UserProfiles],
  daos: [PendataanDao, UserProfileDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Naikkan angka ini + tulis migrasi di `migration` getter setiap kali
  // menambah/mengubah kolom tabel setelah app sudah dipakai di lapangan.
  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          // User yang sudah install versi Sprint 2-4 (schemaVersion 1)
          // cuma perlu ditambah tabel UserProfiles — data pendataan
          // yang sudah ada tidak boleh hilang/ter-reset.
          if (from < 2) {
            await m.createTable(userProfiles);
          }
          if (from < 3) {
            await m.addColumn(userProfiles, userProfiles.avatarRemoteUrl);
          }
        },
      );
}

/// Satu instance database dipakai di seluruh app (bukan bikin baru
/// tiap dibutuhkan) — sqlite tidak suka dibuka banyak koneksi sekaligus
/// dari satu app. Diakses lewat `appDatabase` di mana pun perlu.
final AppDatabase appDatabase = AppDatabase();
