import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Satu-satunya tempat yang bicara langsung ke FirebaseAuth & GoogleSignIn.
/// Screen (LoginScreen, ProfileScreen, dll) tidak boleh import
/// firebase_auth/google_sign_in langsung — selalu lewat repository ini.
/// Ini memudahkan kalau nanti perlu ganti provider atau nambah logic.
class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// Stream ini otomatis emit dari cache lokal saat app dibuka —
  /// TIDAK butuh internet untuk tahu "user masih login atau tidak".
  /// Internet hanya dibutuhkan sekali, saat proses sign-in pertama kali.
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Cek instan tanpa nunggu stream — berguna untuk splash/cek awal.
  User? get currentUser => _auth.currentUser;

  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User membatalkan dialog pilih akun.
        return null;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final result = await _auth.signInWithCredential(credential);
      return result.user;
    } on FirebaseAuthException catch (e) {
      throw AuthFailure(_mapFirebaseError(e));
    } catch (e) {
      // Termasuk kasus tidak ada koneksi internet sama sekali.
      throw AuthFailure(
        'Tidak bisa login. Pastikan kamu terhubung ke internet, lalu coba lagi.',
      );
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  String _mapFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'network-request-failed':
        return 'Tidak ada koneksi internet. Login pertama kali butuh internet.';
      case 'account-exists-with-different-credential':
        return 'Akun ini sudah terdaftar dengan metode login lain.';
      default:
        return 'Login gagal (${e.code}). Coba lagi.';
    }
  }
}

class AuthFailure implements Exception {
  final String message;
  AuthFailure(this.message);
}
