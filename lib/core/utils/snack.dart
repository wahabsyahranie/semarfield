import 'package:flutter/material.dart';

/// Dipakai di seluruh app menggantikan
/// `ScaffoldMessenger.of(context).showSnackBar(...)` langsung.
///
/// Kenapa perlu ini: SnackBar bawaan Flutter itu ANTRE — kalau user
/// menekan tombol yang sama 3x cepat (misal "Simpan Perubahan"),
/// muncul 3 SnackBar berurutan menumpuk di layar. `clearSnackBars()`
/// membuang antrean lama sebelum menampilkan yang baru, jadi yang
/// terlihat cuma satu — pesan paling akhir/relevan.
void showSnack(BuildContext context, String message, {Color? backgroundColor}) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.clearSnackBars();
  messenger.showSnackBar(
    SnackBar(content: Text(message), backgroundColor: backgroundColor),
  );
}
