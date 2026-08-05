/// Kumpulan helper normalisasi teks — dipakai di seluruh app supaya
/// aturan "simpan lowercase, tampilkan kapital di awal" dan "titik
/// pengamatan selalu berformat TP-xxx" konsisten di satu tempat,
/// bukan diulang-ulang tiap file.

/// Dipakai SEBELUM data disimpan ke database. Menyeragamkan variasi
/// kapitalisasi dari user ("Hijau" / "HIJAU" / "hijau" semua jadi
/// "hijau") supaya pencarian dan pengelompokan data tidak pecah
/// gara-gara beda kapitalisasi saja.
String normalizeForStorage(String input) => input.trim().toLowerCase();

/// Dipakai SAAT MENAMPILKAN teks yang tersimpan lowercase, supaya
/// terbaca natural di UI ("hijau kekuningan" -> "Hijau kekuningan").
/// Sengaja cuma huruf pertama (sentence case), bukan Title Case Tiap
/// Kata — penting khusus untuk nama ilmiah spesies (mis. "nepenthes
/// spectabilis" -> "Nepenthes spectabilis", BUKAN "Nepenthes
/// Spectabilis" yang salah secara konvensi penulisan biologi).
String capitalizeFirst(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}

/// Titik pengamatan disimpan sebagai KODE terstruktur, bukan teks
/// bebas — beda dari field lain yang di-lowercase. User cukup ketik
/// 'a01' atau '1', sistem otomatis menormalisasi jadi 'TP-A01' /
/// 'TP-1', supaya konsisten dipakai sebagai id lokasi saat pemetaan.
/// Idempotent: kalau user (atau data lama) sudah mengetik 'TP-A01'
/// atau 'tp-a01', tidak akan jadi 'TP-TP-A01'.
String normalizeTitik(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return trimmed;
  final upper = trimmed.toUpperCase();
  if (upper.startsWith('TP-')) return upper;
  if (upper.startsWith('TP')) return 'TP-${upper.substring(2).trim().replaceFirst(RegExp(r'^-+'), '')}';
  return 'TP-$upper';
}
