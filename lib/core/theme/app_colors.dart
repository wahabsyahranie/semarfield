import 'package:flutter/material.dart';

/// Palet warna SemarField — terinspirasi hutan hujan tropis
/// dan warna kantong Nepenthes (hijau hutan + merah wine).
class AppColors {
  AppColors._();

  // Primary — hijau hutan
  static const Color forestDeep = Color(0xFF16301F);
  static const Color forestMid = Color(0xFF2C5233);
  static const Color forestSoft = Color(0xFF3E6B47);

  // Accent — merah kantong (wine)
  static const Color wine = Color(0xFF7B2D26);
  static const Color wineSoft = Color(0xFF9A4137);

  // Background & surface
  static const Color parchment = Color(0xFFF3EEDD); // background utama
  static const Color card = Color(0xFFFCFAF1); // surface card

  // Status: pending sync
  static const Color amber = Color(0xFFC1873A);
  static const Color amberBg = Color(0xFFFBF0DE);

  // Status: synced
  static const Color greenOk = Color(0xFF3E6B47);
  static const Color greenBg = Color(0xFFE4EEDF);

  // Status: warning / error
  static const Color redWarn = Color(0xFFB24A3B);
  static const Color redBg = Color(0xFFF6E1DD);

  // Text & lines
  static const Color ink = Color(0xFF1E2A20); // teks utama
  static const Color muted = Color(0xFF71796C); // teks sekunder
  static const Color line = Color(0xFFDED6BC); // border input
  static const Color lineSoft = Color(0xFFEAE4D0); // border card halus
}
