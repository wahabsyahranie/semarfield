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
  /// Dipakai saat USER MENGEDIT profil di HP ini — makanya syncStatus
  /// selalu 'pending' (perlu didorong ke Firestore).
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

  /// Dipakai saat menarik profil DARI Firestore (HP baru, akun sama).
  /// syncStatus langsung 'synced' — data ini SUDAH sama dengan cloud,
  /// tidak perlu didorong ulang. avatarLocalPath sengaja tidak diisi
  /// (foto fisiknya belum ada di HP ini), cuma avatarRemoteUrl.
  Future<void> simpanDariCloud({
    String? displayName,
    String? phoneNumber,
    String? avatarRemoteUrl,
  }) {
    return into(userProfiles).insertOnConflictUpdate(
      UserProfilesCompanion(
        id: const Value(1),
        displayName: Value(displayName),
        phoneNumber: Value(phoneNumber),
        avatarRemoteUrl: Value(avatarRemoteUrl),
        syncStatus: const Value('synced'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> markSynced() {
    return (update(userProfiles)..where((t) => t.id.equals(1)))
        .write(const UserProfilesCompanion(syncStatus: Value('synced')));
  }
}
