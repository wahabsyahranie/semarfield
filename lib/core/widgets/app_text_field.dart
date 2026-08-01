import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Text field standar dengan label di atas. `unit` menampilkan suffix
/// satuan (cm, %, °C, mdpl). `isManual` menampilkan tag kuning kecil
/// yang menandai field ini diisi tangan, bukan dari sensor otomatis.
/// `useMonoFont` dipakai untuk field angka/data terukur.
///
/// Contoh:
/// AppTextField(label: 'Panjang Kantong', unit: 'cm', isManual: true,
///   controller: _panjangCtrl, keyboardType: TextInputType.number)
class AppTextField extends StatelessWidget {
  final String label;
  final String? optionalHint;
  final String? unit;
  final bool isManual;
  final bool useMonoFont;
  final bool enabled;
  final int maxLines;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;

  const AppTextField({
    super.key,
    required this.label,
    this.optionalHint,
    this.unit,
    this.isManual = false,
    this.useMonoFont = false,
    this.enabled = true,
    this.maxLines = 1,
    this.controller,
    this.hintText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: AppTypography.label),
            if (optionalHint != null) ...[
              const SizedBox(width: 4),
              Text('($optionalHint)',
                  style: AppTypography.bodySm.copyWith(fontStyle: FontStyle.italic)),
            ],
            if (isManual) ...[
              const SizedBox(width: 6),
              _ManualTag(),
            ],
          ],
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          enabled: enabled,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: useMonoFont ? AppTypography.dataValue : AppTypography.bodyMd,
          decoration: InputDecoration(
            hintText: hintText,
            suffixText: unit,
            suffixStyle: AppTypography.bodySm.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _ManualTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.amberBg,
        borderRadius: AppRadius.pillR,
      ),
      child: const Text(
        'manual',
        style: TextStyle(
          fontFamily: AppTypography.body,
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: AppColors.amber,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
