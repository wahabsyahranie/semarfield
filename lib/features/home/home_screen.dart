import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/database/app_database.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/status_badge.dart';
import '../pendataan/add_data_form_screen.dart';
import '../pendataan/pendataan_repository.dart';
import '../profile/profile_screen.dart';
import '../../core/services/connectivity_service.dart';
import '../../core/services/sync_service.dart';

enum _StatusFilter { semua, pending, synced }

/// Home asli — menggantikan HomeScreenPlaceholder dari Sprint 1.
/// Semua angka & list di sini baca langsung dari sqlite lokal lewat
/// PendataanRepository, reaktif (Stream) — tidak ada data dummy
/// hardcode di UI.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _repo = PendataanRepository();
  final _searchCtrl = TextEditingController();
  final _connectivity = ConnectivityService();
  final _syncService = SyncService();
  StreamSubscription<bool>? _connectivitySub;
  _StatusFilter _filter = _StatusFilter.semua;
  String _query = '';

  @override
  void initState() {
    super.initState();
    // Auto-sync diam-diam begitu HP kembali online — user tidak perlu
    // buka Profile & tekan tombol manual tiap kali. Kalau gagal, cukup
    // diabaikan; nanti dicoba lagi di perubahan konektivitas berikutnya
    // atau saat user sync manual dari Profile.
    _connectivitySub = _connectivity.onOnline.listen((isOnline) async {
      if (!isOnline || !mounted) return;
      try {
        final result = await _syncService.syncAll();
        if (result.entriesSynced > 0 && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${result.entriesSynced} data otomatis tersinkron.')),
          );
        }
      } catch (_) {
        // Diam-diam gagal — tidak mengganggu user, akan dicoba lagi nanti.
      }
    });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _connectivitySub?.cancel();
    super.dispose();
  }

  List<PendataanEntry> _applyFilter(List<PendataanEntry> all) {
    return all.where((e) {
      final matchStatus = switch (_filter) {
        _StatusFilter.semua => true,
        _StatusFilter.pending => e.syncStatus == 'pending',
        _StatusFilter.synced => e.syncStatus == 'synced',
      };
      final q = _query.trim().toLowerCase();
      final matchQuery = q.isEmpty ||
          e.titikPengamatan.toLowerCase().contains(q) ||
          (e.spesies?.toLowerCase().contains(q) ?? false);
      return matchStatus && matchQuery;
    }).toList();
  }

  void _openFilterSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Filter Status', style: AppTypography.h2),
                const SizedBox(height: AppSpacing.sm),
                for (final f in _StatusFilter.values)
                  RadioListTile<_StatusFilter>(
                    value: f,
                    groupValue: _filter,
                    activeColor: AppColors.forestDeep,
                    contentPadding: EdgeInsets.zero,
                    title: Text(switch (f) {
                      _StatusFilter.semua => 'Semua',
                      _StatusFilter.pending => 'Pending Sync',
                      _StatusFilter.synced => 'Sudah Sync',
                    }, style: AppTypography.bodyMd),
                    onChanged: (v) {
                      setState(() => _filter = v!);
                      Navigator.pop(context);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openProfilePlaceholder() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const ProfileScreen()),
    );
  }

  void _openAddDataEntry() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AddDataFormScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final initial = (user?.displayName?.trim().isNotEmpty ?? false)
        ? user!.displayName![0].toUpperCase()
        : '?';

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light, // ikon jam/baterai jadi putih, kontras dgn hijau
      child: Scaffold(
      backgroundColor: AppColors.parchment,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.wine,
        onPressed: _openAddDataEntry,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
        children: [
          _buildAppBar(context, initial, user),
          Expanded(
              child: StreamBuilder<List<PendataanEntry>>(
                stream: _repo.watchAllEntries(),
                builder: (context, snapshot) {
                  final all = snapshot.data ?? const [];
                  final filtered = _applyFilter(all);

                  return ListView(
                    padding: const EdgeInsets.fromLTRB(
                        AppSpacing.lg, AppSpacing.lg, AppSpacing.lg, 100),
                    children: [
                      _buildStatRow(),
                      const SizedBox(height: AppSpacing.lg),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('DATA TERBARU',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                letterSpacing: 0.5,
                                color: AppColors.forestDeep,
                              )),
                          Text('${filtered.length} entri', style: AppTypography.bodySm),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      if (!snapshot.hasData)
                        const Padding(
                          padding: EdgeInsets.only(top: AppSpacing.xxl),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      else if (filtered.isEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: AppSpacing.xxl),
                          child: Center(
                            child: Text(
                              all.isEmpty
                                  ? 'Belum ada data pendataan.\nTekan tombol + untuk mulai.'
                                  : 'Tidak ada data yang cocok dengan pencarian/filter.',
                              textAlign: TextAlign.center,
                              style: AppTypography.bodySm,
                            ),
                          ),
                        )
                      else
                        ...filtered.map((e) => _EntryCard(entry: e)),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow() {
    return Row(
      children: [
        Expanded(child: _StatCard(label: 'Total Data', stream: _repo.watchTotalCount(), color: AppColors.forestDeep)),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: _StatCard(label: 'Pending Sync', stream: _repo.watchPendingCount(), color: AppColors.amber)),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: _StatCard(label: 'Sudah Sync', stream: _repo.watchSyncedCount(), color: AppColors.greenOk)),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context, String initial, User? user) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.forestDeep,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      // SafeArea di sini (bukan di body Scaffold) supaya warna hijau
      // tetap mengalir sampai ke belakang status bar, tapi konten
      // (tombol, teks) tetap didorong turun secukupnya agar tidak
      // ketiban status bar / notch.
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.lg),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Beranda',
                      style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                    color: AppColors.parchment,
                  )),
              InkWell(
                onTap: _openProfilePlaceholder,
                borderRadius: AppRadius.pillR,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: AppRadius.pillR,
                    border: Border.all(color: Colors.white.withOpacity(0.15)),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColors.wineSoft,
                        child: Text(initial,
                            style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        user?.displayName?.split(' ').first ?? 'Pengguna',
                        style: const TextStyle(color: AppColors.parchment, fontSize: 11.5, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: AppRadius.mdR,
                    border: Border.all(color: Colors.white.withOpacity(0.18)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, size: 18, color: Color(0xFFA9BEA3)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _searchCtrl,
                          onChanged: (v) => setState(() => _query = v),
                          style: const TextStyle(color: AppColors.parchment, fontSize: 12.5),
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            filled: false,
                            hintText: 'Cari spesies, titik…',
                            hintStyle: TextStyle(color: Color(0xFFA9BEA3), fontSize: 12.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              InkWell(
                onTap: _openFilterSheet,
                borderRadius: AppRadius.mdR,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: AppRadius.mdR,
                    border: Border.all(color: Colors.white.withOpacity(0.18)),
                  ),
                  child: const Icon(Icons.tune, size: 18, color: AppColors.parchment),
                ),
              ),
            ],
          ),
        ],
      ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final Stream<int> stream;
  final Color color;
  const _StatCard({required this.label, required this.stream, required this.color});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: StreamBuilder<int>(
        stream: stream,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${snapshot.data ?? 0}',
                  style: TextStyle(fontFamily: 'Fraunces', fontWeight: FontWeight.w700, fontSize: 22, color: color)),
              const SizedBox(height: 4),
              Text(label.toUpperCase(),
                  style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 9, color: AppColors.muted)),
            ],
          );
        },
      ),
    );
  }
}

class _EntryCard extends StatelessWidget {
  final PendataanEntry entry;
  const _EntryCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final tanggal = entry.tanggalPengamatan;
    final tanggalStr = '${tanggal.day.toString().padLeft(2, '0')}/${tanggal.month.toString().padLeft(2, '0')}/${tanggal.year}';

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: AppCard(
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF5C7A4A), Color(0xFF3E5A32)],
                ),
                borderRadius: AppRadius.mdR,
              ),
              child: const Icon(Icons.eco_outlined, color: Colors.white, size: 22),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          entry.spesies?.isNotEmpty == true ? entry.spesies! : 'Belum teridentifikasi',
                          style: const TextStyle(
                            fontFamily: 'Fraunces',
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                            color: AppColors.ink,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      StatusBadge(
                        status: entry.syncStatus == 'synced' ? SyncStatus.synced : SyncStatus.pending,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 9,
                    children: [
                      Text(entry.titikPengamatan, style: AppTypography.dataSmall),
                      Text(tanggalStr, style: AppTypography.dataSmall),
                      if (entry.ketinggianMdpl != null)
                        Text('${entry.ketinggianMdpl!.toStringAsFixed(0)} mdpl', style: AppTypography.dataSmall),
                      if (entry.koordinatBelumLengkap)
                        const Text('📍 lokasi belum lengkap',
                            style: TextStyle(fontFamily: 'JetBrainsMono', fontSize: 10, color: AppColors.redWarn)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
