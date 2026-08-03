import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Text field standar dengan label di atas. `unit` menampilkan suffix
/// satuan (cm, %, °C, mdpl). `isManual` menampilkan tag kuning "manual"
/// (diisi tangan, bukan sensor). `isAuto` menampilkan tag hijau
/// "otomatis" (terisi sendiri, misal dari GPS, tapi tetap bisa diedit).
/// `useMonoFont` dipakai untuk field angka/data terukur.
///
/// Label + tag pakai Wrap (bukan Row) supaya kalau ruangnya sempit
/// (field setengah lebar dalam Row 2 kolom), tag pindah ke baris baru
/// alih-alih memaksa overflow.
///
/// Contoh:
/// AppTextField(label: 'Panjang Kantong', unit: 'cm', isManual: true,
///   controller: _panjangCtrl, keyboardType: TextInputType.number)
class AppTextField extends StatelessWidget {
  final String label;
  final String? optionalHint;
  final String? unit;
  final bool isManual;
  final bool isAuto;
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
    this.isAuto = false,
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
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 6,
          runSpacing: 2,
          children: [
            Text(label, style: AppTypography.label),
            if (optionalHint != null)
              Text('($optionalHint)',
                  style: AppTypography.bodySm.copyWith(fontStyle: FontStyle.italic)),
            if (isManual) const _FieldTag(text: 'manual', bg: AppColors.amberBg, fg: AppColors.amber),
            if (isAuto) const _FieldTag(text: 'otomatis', bg: AppColors.greenBg, fg: AppColors.greenOk),
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

class _FieldTag extends StatelessWidget {
  final String text;
  final Color bg;
  final Color fg;
  const _FieldTag({required this.text, required this.bg, required this.fg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(color: bg, borderRadius: AppRadius.pillR),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: AppTypography.body,
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: fg,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
