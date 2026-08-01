import 'package:flutter/material.dart';

/// Skala radius konsisten untuk card, tombol, input, badge.
class AppRadius {
  AppRadius._();

  static const double sm = 8;
  static const double md = 11;
  static const double lg = 14;
  static const double xl = 16;
  static const double pill = 999;

  static const BorderRadius smR = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdR = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgR = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xlR = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius pillR = BorderRadius.all(Radius.circular(pill));
}
