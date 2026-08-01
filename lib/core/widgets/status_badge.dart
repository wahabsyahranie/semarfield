import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';

enum SyncStatus { pending, synced }

/// Badge kecil "Pending" / "Tersinkron" — dipakai di entry card
/// Home dan appbar form. Warna & label terpusat di sini supaya
/// konsisten di semua tempat.
class StatusBadge extends StatelessWidget {
  final SyncStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final isPending = status == SyncStatus.pending;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: isPending ? AppColors.amberBg : AppColors.greenBg,
        borderRadius: AppRadius.pillR,
      ),
      child: Text(
        isPending ? 'Pending' : 'Tersinkron',
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 9,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
          color: isPending ? AppColors.amber : AppColors.greenOk,
        ),
      ),
    );
  }
}
