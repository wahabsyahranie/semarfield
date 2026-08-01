import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:semarfield/core/theme/app_theme.dart';
import 'package:semarfield/features/auth/auth_gate.dart';
import 'package:semarfield/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const AuthGate(),
    );
  }
}
