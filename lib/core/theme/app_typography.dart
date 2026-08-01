import 'package:flutter/material.dart';
import 'app_colors.dart';

/// PENTING — aplikasi ini offline-first, jadi font TIDAK memakai
/// package `google_fonts` (yang oleh default mengunduh font saat
/// runtime dan butuh internet di pemakaian pertama). Gunakan font
/// lokal yang di-bundle sebagai asset, didaftarkan di pubspec.yaml:
///
/// flutter:
///   fonts:
///     - family: Fraunces
///       fonts:
///         - asset: assets/fonts/Fraunces-Regular.ttf
///         - asset: assets/fonts/Fraunces-Medium.ttf
///           weight: 500
///         - asset: assets/fonts/Fraunces-SemiBold.ttf
///           weight: 600
///     - family: Inter
///       fonts:
///         - asset: assets/fonts/Inter-Regular.ttf
///         - asset: assets/fonts/Inter-Medium.ttf
///           weight: 500
///         - asset: assets/fonts/Inter-SemiBold.ttf
///           weight: 600
///         - asset: assets/fonts/Inter-Bold.ttf
///           weight: 700
///     - family: JetBrainsMono
///       fonts:
///         - asset: assets/fonts/JetBrainsMono-Regular.ttf
///         - asset: assets/fonts/JetBrainsMono-Medium.ttf
///           weight: 500
///
/// Unduh file .ttf dari fonts.google.com, taruh di assets/fonts/.
class AppTypography {
  AppTypography._();

  static const String display = 'Fraunces'; // judul, nama spesies
  static const String body = 'Inter'; // UI, label, tombol
  static const String mono = 'JetBrainsMono'; // koordinat, angka data

  // Display — dipakai untuk judul layar & nama spesies (italic biasanya
  // dipakai khusus untuk nama ilmiah spesies, lihat contoh di widget).
  static const TextStyle h1 = TextStyle(
    fontFamily: display,
    fontWeight: FontWeight.w600,
    fontSize: 26,
    color: AppColors.forestDeep,
    height: 1.2,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: display,
    fontWeight: FontWeight.w600,
    fontSize: 19,
    color: AppColors.ink,
    height: 1.25,
  );

  // Body — UI umum
  static const TextStyle bodyLg = TextStyle(
    fontFamily: body,
    fontWeight: FontWeight.w500,
    fontSize: 14.5,
    color: AppColors.ink,
  );

  static const TextStyle bodyMd = TextStyle(
    fontFamily: body,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: AppColors.ink,
  );

  static const TextStyle bodySm = TextStyle(
    fontFamily: body,
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: AppColors.muted,
  );

  static const TextStyle label = TextStyle(
    fontFamily: body,
    fontWeight: FontWeight.w600,
    fontSize: 11,
    color: AppColors.ink,
  );

  static const TextStyle button = TextStyle(
    fontFamily: body,
    fontWeight: FontWeight.w700,
    fontSize: 12.5,
  );

  // Mono — untuk data terukur: koordinat GPS, pH, cm, mdpl, timestamp
  static const TextStyle dataValue = TextStyle(
    fontFamily: mono,
    fontWeight: FontWeight.w500,
    fontSize: 12.5,
    color: AppColors.ink,
  );

  static const TextStyle dataSmall = TextStyle(
    fontFamily: mono,
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: AppColors.muted,
  );
}
