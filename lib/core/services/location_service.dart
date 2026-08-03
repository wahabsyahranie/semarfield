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

  /// Berbeda dari getCurrentPosition (satu bacaan lalu berhenti), ini
  /// terus mengalirkan bacaan GPS baru selama didengarkan — akurasi
  /// GPS HP memang butuh beberapa detik/menit untuk "mengunci" dan
  /// menyempit, sama seperti lingkaran akurasi di share lokasi WhatsApp.
  /// UI yang mendengarkan stream ini bisa terus menampilkan angka
  /// akurasi terbaru sampai user puas dan menekan "Gunakan Ini".
  Stream<Position> watchPosition() async* {
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

    yield* Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 0, // tetap kirim update walau device diam, supaya akurasi terus membaik
      ),
    );
  }
}
