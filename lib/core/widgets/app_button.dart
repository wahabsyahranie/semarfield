import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

enum AppButtonVariant { primary, secondary, wine, danger }

/// Tombol standar aplikasi. Pakai ini di semua tempat — jangan
/// bikin ElevatedButton/OutlinedButton custom baru per layar.
///
/// Contoh:
/// AppButton(label: 'Simpan Data (Offline)', icon: Icons.save_outlined, onPressed: () {})
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final IconData? icon;
  final bool loading;
  final bool fullWidth;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.loading = false,
    this.fullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = _colorsFor(variant);

    final child = loading
        ? SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: colors.fg,
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 16, color: colors.fg),
                const SizedBox(width: AppSpacing.sm),
              ],
              Text(label, style: AppTypography.button.copyWith(color: colors.fg)),
            ],
          );

    final button = variant == AppButtonVariant.secondary
        ? OutlinedButton(
            onPressed: loading ? null : onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: colors.fg,
              side: BorderSide(color: colors.border ?? colors.fg, width: 1.5),
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              shape: RoundedRectangleBorder(borderRadius: AppRadius.mdR),
            ),
            child: child,
          )
        : ElevatedButton(
            onPressed: loading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.bg,
              foregroundColor: colors.fg,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              shape: RoundedRectangleBorder(borderRadius: AppRadius.mdR),
              elevation: 0,
            ),
            child: child,
          );

    return fullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }

  _BtnColors _colorsFor(AppButtonVariant v) {
    switch (v) {
      case AppButtonVariant.primary:
        return _BtnColors(bg: AppColors.forestDeep, fg: AppColors.parchment);
      case AppButtonVariant.wine:
        return _BtnColors(bg: AppColors.wine, fg: Colors.white);
      case AppButtonVariant.secondary:
        return _BtnColors(bg: Colors.white, fg: AppColors.forestDeep, border: AppColors.forestDeep);
      case AppButtonVariant.danger:
        return _BtnColors(bg: Colors.transparent, fg: AppColors.redWarn, border: AppColors.redWarn);
    }
  }
}

class _BtnColors {
  final Color bg;
  final Color fg;
  final Color? border;
  _BtnColors({required this.bg, required this.fg, this.border});
}
