import 'dart:io';
import 'package:flutter/material.dart';
import '../../core/database/app_database.dart';
import '../../core/services/sync_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/utils/snack.dart';
import '../../core/utils/text_format.dart';
import '../../core/widgets/status_badge.dart';
import 'add_data_form_screen.dart';
import 'pendataan_repository.dart';

class DetailScreen extends StatefulWidget {
  final PendataanEntry entry;
  const DetailScreen({super.key, required this.entry});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _repo = PendataanRepository();
  final _syncService = SyncService();
  bool _deletingCloud = false;

  static const _bulanIndonesia = [
    '', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
    'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
  ];

  String _formatWaktu(DateTime dt) {
    final tgl = '${dt.day} ${_bulanIndonesia[dt.month]} ${dt.year}';
    final jam = '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    return '$tgl · $jam';
  }

  Future<void> _handleEdit(PendataanEntry entry) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => AddDataFormScreen(existingEntry: entry)),
    );
    // Tidak perlu setState manual — StreamBuilder di build() otomatis
    // menerima data terbaru dari database begitu form edit menyimpan.
  }

  Future<void> _handleDeleteLocal(PendataanEntry entry) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus dari HP?'),
        content: Text(
          entry.syncStatus == 'synced'
              ? 'Data ini akan dihapus dari HP ini saja. Salinannya di Firebase TIDAK ikut terhapus.'
              : 'Data ini belum pernah disinkronkan — kalau dihapus sekarang, datanya akan hilang permanen.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus', style: TextStyle(color: AppColors.redWarn)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    await _repo.hapusEntry(entry.id);
    if (!mounted) return;
    Navigator.of(context).pop(); // kembali ke Home
    showSnack(context, 'Data dihapus dari HP ini.');
  }

  Future<void> _handleDeleteCloud(PendataanEntry entry) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus dari Firebase?'),
        content: const Text(
          'Ini akan menghapus data DAN semua fotonya dari Firestore + Storage secara permanen. '
          'Tindakan ini tidak bisa dibatalkan dan butuh koneksi internet. Data lokal di HP tidak ikut terhapus.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus Permanen', style: TextStyle(color: AppColors.redWarn)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _deletingCloud = true);
    try {
      await _syncService.deleteEntryFromCloud(entry);
      if (!mounted) return;
      showSnack(context, 'Data berhasil dihapus dari Firebase.');
    } on SyncFailure catch (e) {
      if (!mounted) return;
      showSnack(context, e.message);
    } catch (_) {
      if (!mounted) return;
      showSnack(context, 'Gagal menghapus dari Firebase. Coba lagi.');
    } finally {
      if (mounted) setState(() => _deletingCloud = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.parchment,
      body: StreamBuilder<PendataanEntry?>(
        stream: _repo.watchEntryById(widget.entry.id),
        initialData: widget.entry,
        builder: (context, snapshot) {
          final entry = snapshot.data;
          if (entry == null) {
            // Entri sudah dihapus (dari layar lain) selagi Detail terbuka.
            return const Center(child: Text('Data ini sudah dihapus.'));
          }

          return Column(
            children: [
              AppBar(
                title: const Text('Detail Pendataan'),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildGallery(entry.id),
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  entry.spesies?.isNotEmpty == true ? capitalizeFirst(entry.spesies!) : 'Belum teridentifikasi',
                                  style: const TextStyle(
                                    fontFamily: 'Fraunces', fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600, fontSize: 21, color: AppColors.ink,
                                  ),
                                ),
                              ),
                              StatusBadge(status: entry.syncStatus == 'synced' ? SyncStatus.synced : SyncStatus.pending),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${entry.titikPengamatan} · Ditambahkan ${_formatWaktu(entry.createdAt)}',
                            style: AppTypography.dataSmall,
                          ),
                          const SizedBox(height: AppSpacing.md),

                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                            decoration: BoxDecoration(color: AppColors.amberBg, borderRadius: AppRadius.mdR),
                            child: Row(
                              children: [
                                const Text('🕓', style: TextStyle(fontSize: 18)),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('WAKTU PENGAMATAN',
                                        style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.w700, color: AppColors.amber, letterSpacing: 0.3)),
                                    Text(_formatWaktu(entry.tanggalPengamatan),
                                        style: const TextStyle(fontFamily: 'JetBrainsMono', fontSize: 13.5, fontWeight: FontWeight.w700, color: AppColors.ink)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),

                          _section('Lokasi', [
                            _kv2(
                              'Koordinat',
                              entry.koordinatBelumLengkap || entry.latitude == null
                                  ? null
                                  : '${entry.latitude!.toStringAsFixed(5)}, ${entry.longitude!.toStringAsFixed(5)}'
                                      '${entry.gpsAccuracyMeter != null ? '\n±${entry.gpsAccuracyMeter!.toStringAsFixed(0)} m' : ''}',
                              'Ketinggian',
                              entry.ketinggianMdpl != null ? '${entry.ketinggianMdpl!.toStringAsFixed(0)} mdpl' : null,
                            ),
                            if (entry.koordinatBelumLengkap)
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text('📍 Lokasi belum lengkap — perlu dilengkapi lewat Edit.',
                                    style: AppTypography.bodySm.copyWith(color: AppColors.redWarn)),
                              ),
                          ]),

                          _section('Data Individu', [
                            _kv2('Panjang Kantong', _cm(entry.panjangKantongCm), 'Diameter Kantong', _cm(entry.diameterKantongCm)),
                            const SizedBox(height: AppSpacing.md),
                            _kv2('Tinggi Tanaman', _cm(entry.tinggiTanamanCm), 'Panjang Daun', _cm(entry.panjangDaunCm)),
                            const SizedBox(height: AppSpacing.md),
                            _kv2('Warna Kantong', entry.warnaKantong != null ? capitalizeFirst(entry.warnaKantong!) : null, 'Jumlah Individu', entry.jumlahIndividu?.toString()),
                          ]),

                          _section('Kondisi Habitat', [
                            _kv2('pH Tanah', entry.phTanah?.toString(), 'Kelembapan Tanah', _persen(entry.kelembapanTanahPersen)),
                            const SizedBox(height: AppSpacing.md),
                            _kv2('Kelembapan Udara', _persen(entry.kelembapanUdaraPersen), 'Suhu Udara', entry.suhuUdaraCelsius != null ? '${entry.suhuUdaraCelsius}°C' : null),
                            const SizedBox(height: AppSpacing.md),
                            _kv1('Deskripsi Habitat', entry.deskripsiHabitat != null ? capitalizeFirst(entry.deskripsiHabitat!) : null),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _buildActions(entry),
            ],
          );
        },
      ),
    );
  }

  String? _cm(double? v) => v != null ? '$v cm' : null;
  String? _persen(double? v) => v != null ? '$v%' : null;

  Widget _section(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.card, borderRadius: AppRadius.lgR, border: Border.all(color: AppColors.lineSoft)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(width: 7, height: 7, decoration: const BoxDecoration(color: AppColors.wine, shape: BoxShape.circle)),
            const SizedBox(width: AppSpacing.sm),
            Text(title.toUpperCase(),
                style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 12, letterSpacing: 0.5, color: AppColors.forestDeep)),
          ]),
          const SizedBox(height: AppSpacing.md),
          ...children,
        ],
      ),
    );
  }

  Widget _kv2(String k1, String? v1, String k2, String? v2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _kvSingle(k1, v1)),
        const SizedBox(width: AppSpacing.md),
        Expanded(child: _kvSingle(k2, v2)),
      ],
    );
  }

  Widget _kv1(String k, String? v) => _kvSingle(k, v, prose: true);

  Widget _kvSingle(String k, String? v, {bool prose = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(k.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.muted, letterSpacing: 0.3)),
        const SizedBox(height: 3),
        Text(
          v ?? '—',
          style: v == null
              ? AppTypography.bodySm.copyWith(fontStyle: FontStyle.italic)
              : prose
                  ? AppTypography.bodyMd
                  : AppTypography.dataValue.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildGallery(int entryId) {
    return StreamBuilder<List<PendataanPhoto>>(
      stream: _repo.watchPhotosForEntry(entryId),
      builder: (context, snapshot) {
        final photos = snapshot.data ?? const [];
        if (photos.isEmpty) {
          return Container(
            height: 140,
            color: AppColors.forestDeep,
            alignment: Alignment.center,
            child: const Text('Belum ada foto', style: TextStyle(color: Color(0xFF9FB89A), fontSize: 12)),
          );
        }
        return Container(
          color: AppColors.forestDeep,
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              itemCount: photos.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final photo = photos[i];
                return ClipRRect(
                  borderRadius: AppRadius.lgR,
                  child: Image.file(File(photo.localPath), width: 150, height: 150, fit: BoxFit.cover),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildActions(PendataanEntry entry) {
    final isSynced = entry.syncStatus == 'synced' && entry.firestoreId != null;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.parchment,
        border: Border(top: BorderSide(color: AppColors.lineSoft)),
      ),
      // SafeArea di sini (bukan di body Scaffold) — sebelumnya bar ini
      // tertutup sebagian oleh navigasi gestur di HP dengan bottom
      // inset besar, karena paddingnya cuma angka tetap, tidak
      // menyesuaikan tinggi system nav bar device.
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.md),
          child: Row(
            children: [
              _iconAction(
                icon: Icons.edit_outlined,
                tooltip: 'Edit Data',
                bg: AppColors.forestDeep,
                fg: AppColors.parchment,
                onTap: () => _handleEdit(entry),
              ),
              const SizedBox(width: AppSpacing.sm),
              _iconAction(
                icon: Icons.delete_outline,
                tooltip: 'Hapus dari HP (Lokal)',
                bg: Colors.white,
                fg: AppColors.redWarn,
                border: AppColors.redWarn,
                onTap: () => _handleDeleteLocal(entry),
              ),
              if (isSynced) ...[
                const SizedBox(width: AppSpacing.sm),
                _iconAction(
                  icon: Icons.cloud_off_outlined,
                  tooltip: 'Hapus dari Firebase Juga',
                  bg: Colors.white,
                  fg: AppColors.muted,
                  border: AppColors.line,
                  loading: _deletingCloud,
                  onTap: () => _handleDeleteCloud(entry),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  /// Tombol aksi ikon-saja, isi lebar merata (Expanded). Tooltip
  /// bawaan Flutter otomatis muncul saat ditekan-tahan (long press)
  /// di mobile — jadi tetap ada penjelasan tanpa perlu teks permanen
  /// yang memakan tempat.
  Widget _iconAction({
    required IconData icon,
    required String tooltip,
    required VoidCallback? onTap,
    required Color bg,
    required Color fg,
    Color? border,
    bool loading = false,
  }) {
    return Expanded(
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: loading ? null : onTap,
          borderRadius: AppRadius.mdR,
          child: Container(
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: AppRadius.mdR,
              border: border != null ? Border.all(color: border, width: 1.5) : null,
            ),
            child: loading
                ? SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: fg))
                : Icon(icon, color: fg, size: 22),
          ),
        ),
      ),
    );
  }
}
