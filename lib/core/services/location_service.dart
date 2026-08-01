import 'package:geolocator/geolocator.dart';

class LocationFailure implements Exception {
  final String message;
  LocationFailure(this.message);
}

/// Satu-satunya tempat yang bicara ke package geolocator. Menangani
/// 3 kondisi gagal yang paling sering terjadi di lapangan: GPS mati,
/// izin ditolak, dan izin ditolak permanen — masing-masing dengan
/// pesan yang jelas ke user, bukan exception mentah.
class LocationService {
  Future<Position> getCurrentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationFailure('GPS tidak aktif. Aktifkan Lokasi di pengaturan HP terlebih dahulu.');
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationFailure('Izin lokasi ditolak. Aplikasi butuh izin ini untuk mencatat koordinat.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationFailure(
        'Izin lokasi ditolak permanen. Aktifkan lewat Pengaturan HP > Aplikasi > SemarField > Izin.',
      );
    }

    // timeLimit mencegah app menggantung tanpa batas kalau sinyal
    // satelit tidak kunjung didapat (umum terjadi di hutan lebat).
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      timeLimit: const Duration(seconds: 25),
    );
  }
}
