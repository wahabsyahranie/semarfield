import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_keys.dart';

class ElevationFailure implements Exception {
  final String message;
  ElevationFailure(this.message);
}

/// Satu-satunya tempat yang bicara ke Google Maps Elevation API.
/// Dipanggil HANYA dari Detail screen (tombol eksplisit), tidak
/// pernah otomatis — supaya jelas kapan kuota API terpakai, dan
/// karena butuh internet.
class ElevationService {
  Future<double> fetchElevation({required double latitude, required double longitude}) async {
    if (!ApiKeys.hasMapsElevationKey) {
      throw ElevationFailure(
        'API key Google Maps Elevation belum diset. Jalankan app dengan '
        '--dart-define=MAPS_ELEVATION_API_KEY=API_KEY_KAMU',
      );
    }

    final uri = Uri.https('maps.googleapis.com', '/maps/api/elevation/json', {
      'locations': '$latitude,$longitude',
      'key': ApiKeys.mapsElevation,
    });

    late http.Response response;
    try {
      response = await http.get(uri).timeout(const Duration(seconds: 15));
    } catch (_) {
      throw ElevationFailure('Tidak ada koneksi internet atau server tidak merespons.');
    }

    if (response.statusCode != 200) {
      throw ElevationFailure('Gagal menghubungi Google Maps (kode ${response.statusCode}).');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final status = data['status'] as String?;

    if (status != 'OK') {
      throw ElevationFailure(_mapStatusToMessage(status));
    }

    final results = data['results'] as List?;
    if (results == null || results.isEmpty) {
      throw ElevationFailure('Google Maps tidak mengembalikan data elevasi untuk titik ini.');
    }

    final elevation = (results.first as Map<String, dynamic>)['elevation'];
    if (elevation is num) return elevation.toDouble();
    throw ElevationFailure('Format respons elevasi tidak dikenali.');
  }

  String _mapStatusToMessage(String? status) {
    switch (status) {
      case 'REQUEST_DENIED':
        return 'API key ditolak Google — cek apakah Elevation API sudah diaktifkan untuk key ini.';
      case 'OVER_QUERY_LIMIT':
        return 'Kuota harian Google Maps Elevation API habis. Coba lagi besok atau cek billing.';
      case 'INVALID_REQUEST':
        return 'Koordinat tidak valid untuk diminta elevasinya.';
      default:
        return 'Google Maps mengembalikan status: ${status ?? "tidak diketahui"}.';
    }
  }
}
