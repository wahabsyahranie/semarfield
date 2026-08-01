import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_card.dart';
import '../auth/auth_repository.dart';

/// Placeholder sementara — HANYA untuk memverifikasi alur login/logout
/// Sprint 1 berjalan end-to-end. Diganti dengan Home asli di Sprint 3.
class HomeScreenPlaceholder extends StatelessWidget {
  const HomeScreenPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final authRepository = AuthRepository();

    return Scaffold(
      appBar: AppBar(title: const Text('Beranda (sementara)')),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('✅ Sprint 1 berhasil — kamu berhasil login.', style: AppTypography.h2),
            const SizedBox(height: AppSpacing.lg),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user?.displayName ?? '-', style: AppTypography.h2),
                  const SizedBox(height: AppSpacing.xs),
                  Text(user?.email ?? '-', style: AppTypography.bodyMd.copyWith(color: AppColors.muted)),
                  const SizedBox(height: AppSpacing.xs),
                  Text('UID: ${user?.uid ?? '-'}', style: AppTypography.dataSmall),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            const Text(
              'Coba matikan internet / mode pesawat, lalu tutup dan buka lagi app ini — '
              'kamu seharusnya tetap sampai di layar ini, bukan diminta login ulang.',
              style: AppTypography.bodySm,
            ),
            const Spacer(),
            AppButton(
              label: 'Keluar Akun',
              variant: AppButtonVariant.danger,
              onPressed: () => authRepository.signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
