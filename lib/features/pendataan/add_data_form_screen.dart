import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/services/location_service.dart';
import '../../core/services/photo_storage_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_card.dart';
import '../../core/widgets/app_text_field.dart';
import 'pendataan_repository.dart';

class AddDataFormScreen extends StatefulWidget {
  const AddDataFormScreen({super.key});

  @override
  State<AddDataFormScreen> createState() => _AddDataFormScreenState();
}

class _AddDataFormScreenState extends State<AddDataFormScreen> {
  final _repo = PendataanRepository();
  final _locationService = LocationService();
  final _photoService = PhotoStorageService();

  // --- Controllers: lokasi ---
  final _titikCtrl = TextEditingController();
  final _mdplCtrl = TextEditingController();
  final _manualLatCtrl = TextEditingController();
  final _manualLngCtrl = TextEditingController();
  DateTime _tanggal = DateTime.now();

  // --- Controllers: data individu ---
  final _spesiesCtrl = TextEditingController();
  final _panjangKantongCtrl = TextEditingController();
  final _diameterKantongCtrl = TextEditingController();
  final _tinggiTanamanCtrl = TextEditingController();
  final _panjangDaunCtrl = TextEditingController();
  final _warnaKantongCtrl = TextEditingController();
  final _jumlahIndividuCtrl = TextEditingController();

  // --- Controllers: habitat ---
  final _phCtrl = TextEditingController();
  final _kelembapanTanahCtrl = TextEditingController();
  final _kelembapanUdaraCtrl = TextEditingController();
  final _suhuCtrl = TextEditingController();
  final _deskripsiCtrl = TextEditingController();

  // --- State GPS ---
  bool _gpsAcquiring = false;
  Position? _position;
  String? _gpsError;
  bool _manualCoordMode = false;
  bool _deferLocation = false;

  // --- State foto ---
  final List<String> _kantongPhotos = [];
  final List<String> _habitatPhotos = [];

  bool _saving = false;

  @override
  void dispose() {
    for (final c in [
      _titikCtrl, _mdplCtrl, _manualLatCtrl, _manualLngCtrl,
      _spesiesCtrl, _panjangKantongCtrl, _diameterKantongCtrl,
      _tinggiTanamanCtrl, _panjangDaunCtrl, _warnaKantongCtrl,
      _jumlahIndividuCtrl, _phCtrl, _kelembapanTanahCtrl,
      _kelembapanUdaraCtrl, _suhuCtrl, _deskripsiCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  // ================= GPS =================

  Future<void> _startGps() async {
    setState(() {
      _gpsAcquiring = true;
      _gpsError = null;
    });
    try {
      final pos = await _locationService.getCurrentPosition();
      setState(() {
        _position = pos;
        _gpsAcquiring = false;
      });
    } on LocationFailure catch (e) {
      setState(() {
        _gpsAcquiring = false;
        _gpsError = e.message;
      });
    } catch (_) {
      setState(() {
        _gpsAcquiring = false;
        _gpsError = 'Gagal mengambil lokasi. Coba lagi di ruang terbuka.';
      });
    }
  }

  _AccuracyTier get _accuracyTier {
    final acc = _position?.accuracy;
    if (acc == null) return _AccuracyTier.none;
    if (acc <= 10) return _AccuracyTier.good;
    if (acc <= 30) return _AccuracyTier.mid;
    return _AccuracyTier.bad;
  }

  // ================= Foto =================

  Future<void> _addPhoto({required bool isKantong}) async {
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

    setState(() {
      if (isKantong) {
        _kantongPhotos.add(path);
      } else {
        _habitatPhotos.add(path);
      }
    });
  }

  // ================= Simpan =================

  double? _parseDouble(String text) => text.trim().isEmpty ? null : double.tryParse(text.trim().replaceAll(',', '.'));
  int? _parseInt(String text) => text.trim().isEmpty ? null : int.tryParse(text.trim());

  Future<void> _save() async {
    if (_titikCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Titik Pengamatan wajib diisi.')),
      );
      return;
    }

    setState(() => _saving = true);

    double? lat = _position?.latitude;
    double? lng = _position?.longitude;
    double? gpsAccuracy = _position?.accuracy;

    if (_manualCoordMode) {
      lat = _parseDouble(_manualLatCtrl.text);
      lng = _parseDouble(_manualLngCtrl.text);
      gpsAccuracy = null;
    }

    try {
      final entryId = await _repo.tambahEntry(
        titikPengamatan: _titikCtrl.text.trim(),
        tanggalPengamatan: _tanggal,
        latitude: lat,
        longitude: lng,
        gpsAccuracyMeter: gpsAccuracy,
        koordinatBelumLengkap: _deferLocation || (lat == null && !_manualCoordMode),
        ketinggianMdpl: _parseDouble(_mdplCtrl.text),
        spesies: _spesiesCtrl.text.trim().isEmpty ? null : _spesiesCtrl.text.trim(),
        panjangKantongCm: _parseDouble(_panjangKantongCtrl.text),
        diameterKantongCm: _parseDouble(_diameterKantongCtrl.text),
        tinggiTanamanCm: _parseDouble(_tinggiTanamanCtrl.text),
        panjangDaunCm: _parseDouble(_panjangDaunCtrl.text),
        warnaKantong: _warnaKantongCtrl.text.trim().isEmpty ? null : _warnaKantongCtrl.text.trim(),
        jumlahIndividu: _parseInt(_jumlahIndividuCtrl.text),
        phTanah: _parseDouble(_phCtrl.text),
        kelembapanTanahPersen: _parseDouble(_kelembapanTanahCtrl.text),
        kelembapanUdaraPersen: _parseDouble(_kelembapanUdaraCtrl.text),
        suhuUdaraCelsius: _parseDouble(_suhuCtrl.text),
        deskripsiHabitat: _deskripsiCtrl.text.trim().isEmpty ? null : _deskripsiCtrl.text.trim(),
      );

      for (final path in _kantongPhotos) {
        await _repo.tambahFoto(entryId: entryId, localPath: path, jenisFoto: 'kantong');
      }
      for (final path in _habitatPhotos) {
        await _repo.tambahFoto(entryId: entryId, localPath: path, jenisFoto: 'habitat');
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data tersimpan offline. Akan disinkronkan saat online.')),
      );
      Navigator.of(context).pop();
    } catch (_) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal menyimpan data. Coba lagi.')),
      );
    }
  }

  // ================= UI =================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.parchment,
      appBar: AppBar(
        title: const Text('Tambah Pendataan'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.lg, AppSpacing.lg, AppSpacing.xxl),
        children: [
          _sectionCard(
            title: 'Lokasi & Waktu',
            children: [
              _buildGpsBox(),
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(child: AppTextField(label: 'Titik Pengamatan', controller: _titikCtrl, hintText: 'TP-A04')),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: AppTextField(
                      label: 'Ketinggian',
                      unit: 'mdpl',
                      isManual: true,
                      useMonoFont: true,
                      controller: _mdplCtrl,
                      hintText: '412',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              _buildDatePicker(),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _sectionCard(
            title: 'Data Individu Nepenthes',
            children: [
              AppTextField(label: 'Spesies (boleh diketik manual)', controller: _spesiesCtrl, hintText: 'Nepenthes spectabilis'),
              const SizedBox(height: AppSpacing.md),
              Row(children: [
                Expanded(child: AppTextField(label: 'Panjang Kantong', unit: 'cm', isManual: true, useMonoFont: true, controller: _panjangKantongCtrl, hintText: '3.5', keyboardType: TextInputType.number)),
                const SizedBox(width: AppSpacing.sm),
                Expanded(child: AppTextField(label: 'Diameter Kantong', unit: 'cm', isManual: true, useMonoFont: true, controller: _diameterKantongCtrl, hintText: '1.8', keyboardType: TextInputType.number)),
              ]),
              const SizedBox(height: AppSpacing.md),
              Row(children: [
                Expanded(child: AppTextField(label: 'Tinggi Tanaman', unit: 'cm', isManual: true, useMonoFont: true, controller: _tinggiTanamanCtrl, hintText: '24', keyboardType: TextInputType.number)),
                const SizedBox(width: AppSpacing.sm),
                Expanded(child: AppTextField(label: 'Panjang Daun', unit: 'cm', isManual: true, useMonoFont: true, controller: _panjangDaunCtrl, hintText: '9', keyboardType: TextInputType.number)),
              ]),
              const SizedBox(height: AppSpacing.md),
              AppTextField(label: 'Warna Kantong', controller: _warnaKantongCtrl, hintText: 'Hijau kekuningan bercak ungu'),
              const SizedBox(height: AppSpacing.md),
              AppTextField(label: 'Jumlah Individu di Titik Ini', controller: _jumlahIndividuCtrl, hintText: '3', keyboardType: TextInputType.number),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _sectionCard(
            title: 'Kondisi Habitat',
            note: 'Belum ada sensor terhubung — isi manual dari alat ukur genggam bila tersedia, atau lewati bila tidak ada.',
            children: [
              Row(children: [
                Expanded(child: AppTextField(label: 'pH Tanah', unit: 'pH', isManual: true, useMonoFont: true, controller: _phCtrl, hintText: '5.4', keyboardType: TextInputType.number)),
                const SizedBox(width: AppSpacing.sm),
                Expanded(child: AppTextField(label: 'Kelembapan Tanah', unit: '%', isManual: true, useMonoFont: true, controller: _kelembapanTanahCtrl, hintText: '53', keyboardType: TextInputType.number)),
              ]),
              const SizedBox(height: AppSpacing.md),
              Row(children: [
                Expanded(child: AppTextField(label: 'Kelembapan Udara', unit: '%RH', isManual: true, useMonoFont: true, controller: _kelembapanUdaraCtrl, hintText: '73', keyboardType: TextInputType.number)),
                const SizedBox(width: AppSpacing.sm),
                Expanded(child: AppTextField(label: 'Suhu Udara', unit: '°C', isManual: true, useMonoFont: true, controller: _suhuCtrl, hintText: '22', keyboardType: TextInputType.number)),
              ]),
              const SizedBox(height: AppSpacing.md),
              AppTextField(label: 'Deskripsi Habitat', controller: _deskripsiCtrl, hintText: 'Semak belukar, tanah berhumus, vegetasi rapat…', maxLines: 3),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _sectionCard(
            title: 'Dokumentasi Foto',
            children: [
              const Text('Foto Kantong Semar', style: AppTypography.label),
              const SizedBox(height: AppSpacing.sm),
              _buildPhotoGrid(_kantongPhotos, isKantong: true),
              const SizedBox(height: AppSpacing.lg),
              const Text('Foto Area Sekitar / Habitat', style: AppTypography.label),
              const SizedBox(height: AppSpacing.sm),
              _buildPhotoGrid(_habitatPhotos, isKantong: false),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Foto tersimpan di penyimpanan lokal HP dan ikut disinkronkan ke Firebase Storage saat online.',
                style: AppTypography.bodySm,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            label: 'Simpan Data (Offline)',
            icon: Icons.save_outlined,
            loading: _saving,
            onPressed: _save,
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({required String title, String? note, required List<Widget> children}) {
    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(width: 7, height: 7, decoration: const BoxDecoration(color: AppColors.wine, shape: BoxShape.circle)),
            const SizedBox(width: AppSpacing.sm),
            Text(title.toUpperCase(),
                style: const TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w700, fontSize: 12.5, letterSpacing: 0.5, color: AppColors.forestDeep)),
          ]),
          if (note != null) ...[
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(note, style: AppTypography.bodySm),
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          ...children,
        ],
      ),
    );
  }

  Widget _buildDatePicker() {
    final dateStr = '${_tanggal.day.toString().padLeft(2, '0')}/${_tanggal.month.toString().padLeft(2, '0')}/${_tanggal.year}';
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: _tanggal,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
        );
        if (picked != null) setState(() => _tanggal = picked);
      },
      child: InputDecorator(
        decoration: const InputDecoration(labelText: 'Tanggal Pengamatan'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dateStr, style: AppTypography.bodyMd),
            const Icon(Icons.calendar_today_outlined, size: 16, color: AppColors.muted),
          ],
        ),
      ),
    );
  }

  Widget _buildGpsBox() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: AppColors.forestDeep, borderRadius: AppRadius.lgR),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  _gpsAcquiring
                      ? 'Mencari sinyal satelit…'
                      : _position != null
                          ? 'Koordinat diperoleh'
                          : 'GPS belum diaktifkan',
                  style: const TextStyle(color: AppColors.parchment, fontSize: 12.5, fontWeight: FontWeight.w600),
                ),
              ),
              if (_gpsAcquiring)
                const SizedBox(
                  width: 20, height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF6EA36B)),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),

          if (_position == null && !_gpsAcquiring)
            AppButton(
              label: 'Mulai Ambil Koordinat GPS',
              icon: Icons.my_location,
              variant: AppButtonVariant.wine,
              onPressed: _startGps,
            ),

          if (_gpsError != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(_gpsError!, style: const TextStyle(color: Color(0xFFE8968A), fontSize: 10.5)),
          ],

          if (_position != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.08), borderRadius: AppRadius.smR),
              child: Text(
                '${_position!.latitude.toStringAsFixed(5)}, ${_position!.longitude.toStringAsFixed(5)}',
                style: const TextStyle(fontFamily: 'JetBrainsMono', color: AppColors.parchment, fontSize: 12.5, fontWeight: FontWeight.w600),
              ),
            ),
            _buildAccuracyPill(),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _startGps,
                  style: OutlinedButton.styleFrom(foregroundColor: AppColors.parchment, side: const BorderSide(color: Colors.white24)),
                  child: const Text('↻ Coba Lagi', style: TextStyle(fontSize: 11)),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => setState(() {}), // koordinat sudah otomatis "dipakai"
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6EA36B), foregroundColor: const Color(0xFF0F2413)),
                  child: const Text('✓ Gunakan Ini', style: TextStyle(fontSize: 11)),
                ),
              ),
            ]),
          ],

          TextButton(
            onPressed: () => setState(() => _manualCoordMode = !_manualCoordMode),
            child: Text(
              _manualCoordMode ? 'Tutup input manual' : 'Tidak ada sinyal GPS? Input koordinat manual',
              style: const TextStyle(color: Color(0xFFB9CBB2), fontSize: 10.5, decoration: TextDecoration.underline),
            ),
          ),
          if (_manualCoordMode) ...[
            Row(children: [
              Expanded(
                child: TextField(
                  controller: _manualLatCtrl,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                  style: const TextStyle(color: Colors.white, fontFamily: 'JetBrainsMono', fontSize: 12),
                  decoration: const InputDecoration(hintText: 'Lat: -3.2412', filled: true, fillColor: Colors.white10),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _manualLngCtrl,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                  style: const TextStyle(color: Colors.white, fontFamily: 'JetBrainsMono', fontSize: 12),
                  decoration: const InputDecoration(hintText: 'Long: 98.5042', filled: true, fillColor: Colors.white10),
                ),
              ),
            ]),
          ],

          CheckboxListTile(
            value: _deferLocation,
            onChanged: (v) => setState(() => _deferLocation = v ?? false),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
            activeColor: const Color(0xFF6EA36B),
            dense: true,
            title: const Text(
              'Simpan dulu tanpa koordinat pasti — lengkapi nanti saat sinyal tersedia.',
              style: TextStyle(color: Color(0xFFE4EEDF), fontSize: 10.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccuracyPill() {
    final tier = _accuracyTier;
    if (tier == _AccuracyTier.none) return const SizedBox.shrink();
    final acc = _position!.accuracy;
    late Color bg;
    late Color fg;
    late String label;
    switch (tier) {
      case _AccuracyTier.good:
        bg = const Color(0xFF2C4A2E); fg = const Color(0xFF9BDD93); label = 'Akurasi ±${acc.toStringAsFixed(0)} m — baik'; break;
      case _AccuracyTier.mid:
        bg = const Color(0xFF4A3E20); fg = const Color(0xFFE8C685); label = 'Akurasi ±${acc.toStringAsFixed(0)} m — sedang'; break;
      case _AccuracyTier.bad:
        bg = const Color(0xFF4A2620); fg = const Color(0xFFE8968A); label = 'Akurasi ±${acc.toStringAsFixed(0)} m — rendah'; break;
      case _AccuracyTier.none:
        return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: AppRadius.pillR),
      child: Text(label, style: TextStyle(color: fg, fontSize: 10.5, fontWeight: FontWeight.w700)),
    );
  }

  Widget _buildPhotoGrid(List<String> photos, {required bool isKantong}) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final path in photos)
          Stack(
            children: [
              ClipRRect(
                borderRadius: AppRadius.mdR,
                child: Image.file(File(path), width: 64, height: 64, fit: BoxFit.cover),
              ),
              Positioned(
                top: -6, right: -6,
                child: InkWell(
                  onTap: () => setState(() => photos.remove(path)),
                  child: const CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.redWarn,
                    child: Icon(Icons.close, size: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        InkWell(
          onTap: () => _addPhoto(isKantong: isKantong),
          borderRadius: AppRadius.mdR,
          child: Container(
            width: 64, height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFF0EAD6),
              borderRadius: AppRadius.mdR,
              border: Border.all(color: AppColors.line, width: 1.5, style: BorderStyle.solid),
            ),
            child: const Icon(Icons.add, color: AppColors.muted),
          ),
        ),
      ],
    );
  }
}

enum _AccuracyTier { none, good, mid, bad }
