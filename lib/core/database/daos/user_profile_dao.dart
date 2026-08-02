import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables.dart';

part 'user_profile_dao.g.dart';

@DriftAccessor(tables: [UserProfiles])
class UserProfileDao extends DatabaseAccessor<AppDatabase> with _$UserProfileDaoMixin {
  UserProfileDao(super.db);

  Stream<UserProfile?> watchProfile() {
    return (select(userProfiles)..where((t) => t.id.equals(1))).watchSingleOrNull();
  }

  Future<UserProfile?> getProfileOnce() {
    return (select(userProfiles)..where((t) => t.id.equals(1))).getSingleOrNull();
  }

  /// insertOnConflictUpdate = "upsert": bikin baris kalau belum ada,
  /// timpa kalau sudah ada. Karena id selalu 1, ini selalu jadi satu
  /// baris saja — pas untuk data profil tunggal per device.
  Future<void> upsertProfile({
    String? displayName,
    String? phoneNumber,
    String? avatarLocalPath,
  }) {
    return into(userProfiles).insertOnConflictUpdate(
      UserProfilesCompanion(
        id: const Value(1),
        displayName: Value(displayName),
        phoneNumber: Value(phoneNumber),
        avatarLocalPath: Value(avatarLocalPath),
        syncStatus: const Value('pending'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> markSynced() {
    return (update(userProfiles)..where((t) => t.id.equals(1)))
        .write(const UserProfilesCompanion(syncStatus: Value('synced')));
  }
}
