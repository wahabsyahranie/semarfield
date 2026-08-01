import 'package:flutter/material.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/status_badge.dart';
import 'pendataan_repository.dart';

/// Layar verifikasi Sprint 2 — bukan bagian dari alur user asli.
/// Tujuannya: buktikan insert/read/delete ke sqlite lokal jalan,
/// dan stream reaktif (watchAllEntries) update UI otomatis tanpa
/// setState manual. Hapus / pindah ke folder debug setelah
/// Sprint 3 (Home asli) selesai.
class DbTestScreen extends StatelessWidget {
  const DbTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = PendataanRepository();
    int dummyCounter = 1;

    return Scaffold(
      appBar: AppBar(title: const Text('Tes Database Lokal')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Expanded(
                  child: _CountBadge(label: 'Total', stream: repo.watchTotalCount()),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: _CountBadge(label: 'Pending', stream: repo.watchPendingCount()),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: _CountBadge(label: 'Synced', stream: repo.watchSyncedCount()),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: AppButton(
              label: 'Tambah Data Dummy',
              icon: Icons.add,
              onPressed: () {
                repo.tambahEntry(
                  titikPengamatan: 'TP-TEST-${dummyCounter++}',
                  tanggalPengamatan: DateTime.now(),
                  latitude: -3.2412,
                  longitude: 98.5042,
                  gpsAccuracyMeter: 12,
                  ketinggianMdpl: 412,
                  spesies: 'Nepenthes spectabilis',
                  panjangKantongCm: 3.5,
                  phTanah: 5.4,
                  deskripsiHabitat: 'Semak belukar, tanah berhumus (data dummy)',
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const Divider(),
          Expanded(
            child: StreamBuilder(
              stream: repo.watchAllEntries(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final entries = snapshot.data!;
                if (entries.isEmpty) {
                  return const Center(
                    child: Text('Belum ada data. Tekan "Tambah Data Dummy".',
                        style: AppTypography.bodySm),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    final entry = entries[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: AppCard(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(entry.spesies ?? '-', style: AppTypography.h2),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${entry.titikPengamatan} · ${entry.ketinggianMdpl?.toStringAsFixed(0) ?? '-'} mdpl',
                                    style: AppTypography.dataSmall,
                                  ),
                                ],
                              ),
                            ),
                            StatusBadge(
                              status: entry.syncStatus == 'synced'
                                  ? SyncStatus.synced
                                  : SyncStatus.pending,
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline, size: 20),
                              onPressed: () => repo.hapusEntry(entry.id),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CountBadge extends StatelessWidget {
  final String label;
  final Stream<int> stream;
  const _CountBadge({required this.label, required this.stream});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: StreamBuilder<int>(
        stream: stream,
        builder: (context, snapshot) {
          return Column(
            children: [
              Text('${snapshot.data ?? 0}', style: AppTypography.h1),
              Text(label, style: AppTypography.bodySm),
            ],
          );
        },
      ),
    );
  }
}
