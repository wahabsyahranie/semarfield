import 'package:flutter/material.dart';
import 'package:semarfield/core/theme/app_theme.dart';
import 'package:semarfield/features/showcase/style_guide_screen.dart';

void main() {
  runApp(const SemarFieldApp());
}

class SemarFieldApp extends StatelessWidget {
  const SemarFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SemarField',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      // Sementara arahkan ke style guide dulu untuk verifikasi Sprint 0.
      // Nanti di Sprint 1 ini diganti jadi AuthGate().
      home: const StyleGuideScreen(),
    );
  }
}
