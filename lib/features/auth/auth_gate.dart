import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import 'auth_repository.dart';
import 'login_screen.dart';

/// Gerbang utama app. authStateChanges() emit dari cache lokal
/// begitu app dibuka — jadi kalau user sudah pernah login, layar
/// ini langsung tembus ke Home walau HP dalam mode pesawat.
/// Internet cuma dipakai LoginScreen, sekali, di percobaan sign-in.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository();

    return StreamBuilder<User?>(
      stream: authRepository.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;
        if (user == null) {
          return const LoginScreen();
        }

        return const HomeScreen();
      },
    );
  }
}
