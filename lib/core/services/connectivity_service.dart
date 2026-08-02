import 'package:connectivity_plus/connectivity_plus.dart';

/// Satu-satunya tempat yang bicara ke connectivity_plus. Dipakai untuk
/// dua hal: (1) cek cepat sebelum sync manual supaya gagalnya jelas
/// ("tidak ada internet"), bukan error Firestore yang membingungkan;
/// (2) dengar perubahan koneksi untuk auto-sync begitu HP kembali online.
class ConnectivityService {
  Future<bool> isOnline() async {
    final results = await Connectivity().checkConnectivity();
    return results.any((r) => r != ConnectivityResult.none);
  }

  /// Emit true setiap kali koneksi berubah DARI offline KE online —
  /// dipakai untuk trigger auto-sync tanpa user perlu buka Profile
  /// dan tekan tombol manual.
  Stream<bool> get onOnline {
    return Connectivity().onConnectivityChanged.map(
          (results) => results.any((r) => r != ConnectivityResult.none),
        );
  }
}
