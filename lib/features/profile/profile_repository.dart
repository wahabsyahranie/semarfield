import '../../core/database/app_database.dart';

class ProfileRepository {
  final _dao = appDatabase.userProfileDao;

  Stream<UserProfile?> watchProfile() => _dao.watchProfile();

  Future<UserProfile?> getProfileOnce() => _dao.getProfileOnce();

  Future<void> simpanProfile({
    String? displayName,
    String? phoneNumber,
    String? avatarLocalPath,
  }) {
    return _dao.upsertProfile(
      displayName: displayName,
      phoneNumber: phoneNumber,
      avatarLocalPath: avatarLocalPath,
    );
  }

  // --- Dipakai Sync Engine (Sprint 6) ---
  Future<void> markProfileSynced() => _dao.markSynced();

  /// Dipakai saat menarik profil dari Firestore (HP baru/reinstall).
  Future<void> simpanProfileDariCloud({
    String? displayName,
    String? phoneNumber,
    String? avatarRemoteUrl,
  }) {
    return _dao.simpanDariCloud(
      displayName: displayName,
      phoneNumber: phoneNumber,
      avatarRemoteUrl: avatarRemoteUrl,
    );
  }
}
