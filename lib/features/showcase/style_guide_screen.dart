import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/status_badge.dart';

/// Layar verifikasi Sprint 0 — bukan bagian dari alur user asli.
/// Tujuannya cuma memastikan semua token (warna, font, radius,
/// spacing) dan komponen (button, text field, card, badge)
/// benar-benar tersambung ke ThemeData sebelum lanjut ke Sprint 1.
/// Hapus / pindahkan ke folder debug setelah Sprint 1 selesai.
class StyleGuideScreen extends StatelessWidget {
  const StyleGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fondasi Desain')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          const Text('Nepenthes spectabilis', style: AppTypography.h1),
          const SizedBox(height: AppSpacing.xs),
          const Text('Judul layar & UI umum', style: AppTypography.h2),
          const SizedBox(height: AppSpacing.sm),
          const Text(
            'Contoh body text — dipakai untuk paragraf, deskripsi habitat, dan label formulir.',
            style: AppTypography.bodyMd,
          ),
          const SizedBox(height: AppSpacing.xs),
          const Text('S 03°14\'28,5" E 98°30\'15,2" — 412 mdpl', style: AppTypography.dataValue),

          const SizedBox(height: AppSpacing.xl),
          Row(children: const [
            StatusBadge(status: SyncStatus.pending),
            SizedBox(width: AppSpacing.sm),
            StatusBadge(status: SyncStatus.synced),
          ]),

          const SizedBox(height: AppSpacing.xl),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Contoh AppCard + AppTextField', style: AppTypography.label),
                const SizedBox(height: AppSpacing.md),
                const AppTextField(
                  label: 'pH Tanah',
                  unit: 'pH',
                  isManual: true,
                  useMonoFont: true,
                  hintText: '5.4',
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.xl),
          AppButton(label: 'Simpan Data (Offline)', icon: Icons.save_outlined, onPressed: () {}),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: 'Simpan Draf',
            variant: AppButtonVariant.secondary,
            onPressed: () {},
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: 'Sinkronkan Sekarang',
            variant: AppButtonVariant.wine,
            icon: Icons.sync,
            onPressed: () {},
          ),

          const SizedBox(height: AppSpacing.xl),
          const Text('Palet Warna', style: AppTypography.label),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              _Swatch('forestDeep', AppColors.forestDeep),
              _Swatch('wine', AppColors.wine),
              _Swatch('amber', AppColors.amber),
              _Swatch('greenOk', AppColors.greenOk),
              _Swatch('parchment', AppColors.parchment),
            ],
          ),
        ],
      ),
    );
  }
}

class _Swatch extends StatelessWidget {
  final String name;
  final Color color;
  const _Swatch(this.name, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.lineSoft),
          ),
        ),
        const SizedBox(height: 4),
        Text(name, style: AppTypography.dataSmall),
      ],
    );
  }
}
