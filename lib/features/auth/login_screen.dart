import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/app_button.dart';
import 'auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authRepository = AuthRepository();
  bool _loading = false;
  String? _errorMessage;

  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _loading = true;
      _errorMessage = null;
    });

    try {
      final user = await _authRepository.signInWithGoogle();
      // Kalau user == null, artinya dialog pilih akun dibatalkan —
      // bukan error, jadi tidak perlu tampilkan pesan apa pun.
      if (user == null && mounted) {
        setState(() => _loading = false);
        return;
      }
      // Navigasi ditangani otomatis oleh AuthGate lewat authStateChanges,
      // jadi di sini tidak perlu Navigator.push manual.
    } on AuthFailure catch (e) {
      setState(() => _errorMessage = e.message);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.forestDeep,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.xxl,
          ),
          child: Column(
            children: [
              const Spacer(),
              const Icon(
                Icons.local_florist,
                size: 64,
                color: AppColors.parchment,
              ),
              const SizedBox(height: AppSpacing.lg),
              const Text(
                'SemarField',
                style: TextStyle(
                  fontFamily: AppTypography.display,
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: AppColors.parchment,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Alat bantu pendataan lapangan Nepenthes — tetap jalan tanpa sinyal, sinkron saat online.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.body,
                  fontSize: 13,
                  color: Color(0xFFDCE7D6),
                ),
              ),
              const Spacer(),

              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: Colors.white.withOpacity(0.18)),
                ),
                child: const Text(
                  'Login hanya diperlukan sekali di awal. Setelah itu, buka & isi data kapan saja tanpa internet.',
                  style: TextStyle(
                    fontFamily: AppTypography.body,
                    fontSize: 11.5,
                    color: Color(0xFFE4EEDF),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              if (_errorMessage != null) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.redBg,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(
                      fontFamily: AppTypography.body,
                      fontSize: 12,
                      color: AppColors.redWarn,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
              ],

              AppButton(
                label: 'Masuk dengan Google',
                icon: Icons.login,
                variant: AppButtonVariant.google,
                loading: _loading,
                onPressed: _handleGoogleSignIn,
              ),
              const SizedBox(height: AppSpacing.md),
              const Text(
                'Dengan masuk, akun kamu dipakai untuk menyimpan & menyinkronkan data pendataan secara aman.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppTypography.body,
                  fontSize: 10.5,
                  color: Color(0xFFB9CBB2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
