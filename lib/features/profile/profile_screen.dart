import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/services/photo_storage_service.dart';
import '../../core/services/sync_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_card.dart';
import '../auth/auth_repository.dart';
import '../pendataan/pendataan_repository.dart';
import 'profile_repository.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileRepo = ProfileRepository();
  final _pendataanRepo = PendataanRepository();
  final _authRepo = AuthRepository();
  final _photoService = PhotoStorageService();
  final _syncService = SyncService();
  bool _syncing = false;

  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  String? _avatarPath;
  bool _loading = true;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _loadInitial();
  }

  Future<void> _loadInitial() async {
    final profile = await _profileRepo.getProfileOnce();
    final googleUser = FirebaseAuth.instance.currentUser;

    _nameCtrl.text = profile?.displayName ?? googleUser?.displayName ?? '';
    _phoneCtrl.text = profile?.phoneNumber ?? '';
    _avatarPath = profile?.avatarLocalPath;

    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  Future<void> _changeAvatar() async {
    final source = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppColors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Ambil Foto'),
              onTap: () => Navigator.pop(context, 'camera'),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Pilih dari Galeri'),
              onTap: () => Navigator.pop(context, 'gallery'),
            ),
          ],
        ),
      ),
    );
    if (source == null) return;

    final path = source == 'camera'
        ? await _photoService.pickFromCamera()
        : await _photoService.pickFromGallery();
    if (path == null) return;

    setState(() => _avatarPath = path);
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    await _profileRepo.simpanProfile(
      displayName: _nameCtrl.text.trim().isEmpty ? null : _nameCtrl.text.trim(),
      phoneNumber: _phoneCtrl.text.trim().isEmpty ? null : _phoneCtrl.text.trim(),
      avatarLocalPath: _avatarPath,
    );
    if (!mounted) return;
    setState(() => _saving = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profil tersimpan offline.')),
    );
  }

  Future<void> _handleSyncTap() async {
    setState(() => _syncing = true);
    try {
      final result = await _syncService.syncAll();
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(result.hasFailure ? 'Sinkronisasi Sebagian Berhasil' : 'Sinkronisasi Berhasil'),
          content: Text(
            result.totalProcessed == 0
                ? 'Tidak ada data baru untuk disinkronkan.'
                : '${result.entriesSynced} data berhasil disinkronkan.'
                    '${result.entriesFailed > 0 ? '\n${result.entriesFailed} data gagal — akan dicoba lagi otomatis di sync berikutnya.' : ''}'
                    '${result.profileSynced ? '\nProfil juga berhasil disinkronkan.' : ''}',
          ),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Oke'))],
        ),
      );
    } on SyncFailure catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sinkronisasi gagal. Coba lagi nanti.')),
      );
    } finally {
      if (mounted) setState(() => _syncing = false);
    }
  }

  Future<void> _handleLogout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Keluar Akun?'),
        content: const Text(
          'Data pendataan yang belum tersinkron akan tetap tersimpan di HP ini sampai kamu login kembali dan sync.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Batal')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Keluar')),
        ],
      ),
    );
    if (confirmed == true) {
      await _authRepo.signOut();
      // AuthGate di root sudah otomatis ganti ke LoginScreen lewat
      // authStateChanges(), tapi ProfileScreen ini numpuk di atasnya
      // lewat Navigator.push — jadi perlu di-pop paksa sampai root
      // supaya LoginScreen langsung kelihatan, bukan nunggu back manual.
      if (mounted) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final googleUser = FirebaseAuth.instance.currentUser;

    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
      backgroundColor: AppColors.parchment,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.forestDeep,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            ),
            // SafeArea cuma di sini, bukan di body Scaffold — sama seperti
            // pola di HomeScreen — supaya warna hijau tetap mengalir sampai
            // ke belakang status bar, tapi tombol back tetap didorong turun
            // secukupnya sehingga tidak ketiban status bar / notch.
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.xxl),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: AppColors.parchment),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.wineSoft,
                          backgroundImage: _avatarPath != null
                              ? FileImage(File(_avatarPath!))
                              : (googleUser?.photoURL != null ? NetworkImage(googleUser!.photoURL!) : null) as ImageProvider?,
                          child: (_avatarPath == null && googleUser?.photoURL == null)
                              ? Text(
                                  _nameCtrl.text.isNotEmpty ? _nameCtrl.text[0].toUpperCase() : '?',
                                  style: const TextStyle(color: Colors.white, fontSize: 26, fontFamily: 'Fraunces', fontWeight: FontWeight.w600),
                                )
                              : null,
                        ),
                        Positioned(
                          bottom: 0, right: 0,
                          child: InkWell(
                            onTap: _changeAvatar,
                            child: Container(
                              width: 26, height: 26,
                              decoration: BoxDecoration(
                                color: AppColors.amber,
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.forestDeep, width: 2.5),
                              ),
                              child: const Icon(Icons.edit, size: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      _nameCtrl.text.isEmpty ? 'Tanpa Nama' : _nameCtrl.text,
                      style: const TextStyle(fontFamily: 'Fraunces', fontWeight: FontWeight.w600, fontSize: 17, color: AppColors.parchment),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      googleUser?.email ?? '-',
                      style: const TextStyle(fontFamily: 'JetBrainsMono', fontSize: 10, color: Color(0xFF9FB89A)),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Transform.translate(
            offset: const Offset(0, -26),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                children: [
                  // --- Kartu status sync ---
                  AppCard(
                    child: StreamBuilder<int>(
                      stream: _pendataanRepo.watchPendingCount(),
                      builder: (context, snapshot) {
                        final pending = snapshot.data ?? 0;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('STATUS SINKRONISASI',
                                    style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 11, letterSpacing: 0.4, color: AppColors.forestDeep)),
                                Text('$pending',
                                    style: const TextStyle(fontFamily: 'Fraunces', fontWeight: FontWeight.w700, fontSize: 24, color: AppColors.amber)),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.md),
                            AppButton(
                              label: 'Sinkronkan Sekarang ke Firebase',
                              icon: Icons.sync,
                              variant: AppButtonVariant.wine,
                              loading: _syncing,
                              onPressed: _handleSyncTap,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              pending == 0
                                  ? 'Tidak ada data yang menunggu sinkronisasi.'
                                  : '$pending data menunggu koneksi internet untuk disinkronkan.',
                              style: AppTypography.bodySm,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // --- Form profil ---
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _profileField('Nama Lengkap', _nameCtrl),
                        const Divider(height: AppSpacing.lg),
                        _profileField('Nomor HP', _phoneCtrl, keyboardType: TextInputType.phone),
                        const Divider(height: AppSpacing.lg),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(child: Text('Email', style: AppTypography.label)),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(googleUser?.email ?? '-', style: AppTypography.bodyMd.copyWith(color: AppColors.muted)),
                        Text('(dari Google, tidak bisa diubah)', style: AppTypography.bodySm.copyWith(fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppButton(label: 'Simpan Perubahan', icon: Icons.check, loading: _saving, onPressed: _save),
                  const SizedBox(height: AppSpacing.md),
                  AppButton(label: 'Keluar Akun', variant: AppButtonVariant.danger, onPressed: _handleLogout),
                  const SizedBox(height: AppSpacing.xl),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _profileField(String label, TextEditingController controller, {TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.label),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: AppTypography.bodyMd,
          decoration: const InputDecoration(
            isDense: true,
            filled: false,
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (_) => setState(() {}), // supaya nama di header ikut update
        ),
      ],
    );
  }
}
