/// PENTING SOAL KEAMANAN: API key TIDAK ditulis langsung di sini
/// (kalau ditulis langsung, otomatis ikut ter-commit ke git dan bisa
/// bocor kalau repo public/kebagikan). Dibaca dari --dart-define saat
/// build/run, jadi key-nya cuma ada di mesin kamu, tidak pernah masuk
/// source code.
///
/// Cara pakai:
///   flutter run --dart-define=MAPS_ELEVATION_API_KEY=AIzaSy...xxxxx
///
/// Untuk build release, bisa juga ditaruh di file terpisah yang di-
/// .gitignore (mis. `key.properties` / `.env`) lalu dibaca lewat CI —
/// tapi untuk development sehari-hari, --dart-define sudah cukup.
class ApiKeys {
  ApiKeys._();

  static const String mapsElevation = String.fromEnvironment(
    'MAPS_ELEVATION_API_KEY',
    defaultValue: '',
  );

  static bool get hasMapsElevationKey => mapsElevation.isNotEmpty;
}
