import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:excel/excel.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../../features/pendataan/pendataan_repository.dart';
import '../database/app_database.dart';
import '../utils/text_format.dart' as fmt;

class ExportFailure implements Exception {
  final String message;
  ExportFailure(this.message);
}

/// Membangun satu file .zip berisi:
///   data_pendataan.xlsx   — 1 baris = 1 entri, semua field jadi kolom
///   peta_lokasi.kml       — semua entri berkoordinat, siap dibuka di
///                           Google Earth / Google My Maps
///   foto/<folder per entri>/...   — foto asli, dikelompokkan per entri
///
/// Kenapa dipisah gini (bukan foto ditempel ke dalam Excel): spreadsheet
/// tetap ringan & gampang dianalisis ulang (Excel/Sheets/SPSS/R), sementara
/// foto tetap resolusi asli dan gampang dibuka pakai file explorer biasa.
/// Kolom "Folder Foto" di Excel jadi penghubung antara baris data dan
/// folder fotonya.
class ExportService {
  final _repo = PendataanRepository();

  Future<File> exportAllData() async {
    final entries = await _repo.watchAllEntries().first;
    if (entries.isEmpty) {
      throw ExportFailure('Belum ada data untuk di-export.');
    }

    final tempDir = await getTemporaryDirectory();
    final exportDir = Directory(p.join(tempDir.path, 'export_${DateTime.now().millisecondsSinceEpoch}'));
    await exportDir.create(recursive: true);

    try {
      final xlsxFile = await _buildExcel(entries, exportDir);
      final kmlFile = await _buildKml(entries, exportDir);
      final zipFile = await _buildZip(entries: entries, xlsxFile: xlsxFile, kmlFile: kmlFile, workDir: exportDir);
      return zipFile;
    } finally {
      // File sementara & folder kerja dibersihkan setelah zip jadi —
      // yang tersisa cuma zip final yang mau di-share/simpan user.
      if (await exportDir.exists()) {
        await exportDir.delete(recursive: true);
      }
    }
  }

  Future<File> _buildExcel(List<PendataanEntry> entries, Directory exportDir) async {
    final workbook = Excel.createExcel();
    final sheet = workbook['Data Pendataan'];
    workbook.setDefaultSheet('Data Pendataan');
    // Hapus sheet bawaan kosong ("Sheet1") kalau bukan sheet yang kita pakai.
    for (final name in List<String>.from(workbook.sheets.keys)) {
      if (name != 'Data Pendataan') workbook.delete(name);
    }

    const headers = [
      'No', 'Titik Pengamatan', 'Tanggal Pengamatan', 'Latitude', 'Longitude',
      'Akurasi GPS (m)', 'Koordinat Belum Lengkap', 'Ketinggian (mdpl)',
      'Spesies', 'Panjang Kantong (cm)', 'Diameter Kantong (cm)',
      'Tinggi Tanaman (cm)', 'Panjang Daun (cm)', 'Warna Kantong',
      'Jumlah Individu', 'pH Tanah', 'Kelembapan Tanah (%)',
      'Kelembapan Udara (%RH)', 'Suhu Udara (°C)', 'Deskripsi Habitat',
      'Status Sinkronisasi', 'Waktu Dicatat di HP', 'Folder Foto',
    ];
    sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

    for (var i = 0; i < entries.length; i++) {
      final e = entries[i];
      final folder = _folderNameFor(e);
      sheet.appendRow([
        IntCellValue(i + 1),
        TextCellValue(e.titikPengamatan),
        TextCellValue(_formatDateTime(e.tanggalPengamatan)),
        // PENTING: Latitude/Longitude sebagai TEXT, bukan DoubleCellValue.
        // Excel/package excel menampilkan angka desimal panjang dengan
        // format numerik default yang memotong tampilan jadi cuma ~2
        // desimal (walau nilai aslinya presisi penuh di baliknya) —
        // untuk koordinat GPS ini fatal, 2 desimal cuma akurat sampai
        // ~1 km, bukan meteran lagi. Disimpan sebagai teks 7 desimal
        // (~1 cm presisi) supaya tampil PERSIS seperti aslinya, tidak
        // tunduk ke pembulatan format sel Excel.
        e.latitude != null ? TextCellValue(e.latitude!.toStringAsFixed(7)) : TextCellValue('-'),
        e.longitude != null ? TextCellValue(e.longitude!.toStringAsFixed(7)) : TextCellValue('-'),
        e.gpsAccuracyMeter != null ? DoubleCellValue(e.gpsAccuracyMeter!) : TextCellValue('-'),
        TextCellValue(e.koordinatBelumLengkap ? 'Ya' : 'Tidak'),
        e.ketinggianMdpl != null ? DoubleCellValue(e.ketinggianMdpl!) : TextCellValue('-'),
        TextCellValue(e.spesies != null ? fmt.capitalizeFirst(e.spesies!) : '-'),
        e.panjangKantongCm != null ? DoubleCellValue(e.panjangKantongCm!) : TextCellValue('-'),
        e.diameterKantongCm != null ? DoubleCellValue(e.diameterKantongCm!) : TextCellValue('-'),
        e.tinggiTanamanCm != null ? DoubleCellValue(e.tinggiTanamanCm!) : TextCellValue('-'),
        e.panjangDaunCm != null ? DoubleCellValue(e.panjangDaunCm!) : TextCellValue('-'),
        TextCellValue(e.warnaKantong != null ? fmt.capitalizeFirst(e.warnaKantong!) : '-'),
        e.jumlahIndividu != null ? IntCellValue(e.jumlahIndividu!) : TextCellValue('-'),
        e.phTanah != null ? DoubleCellValue(e.phTanah!) : TextCellValue('-'),
        e.kelembapanTanahPersen != null ? DoubleCellValue(e.kelembapanTanahPersen!) : TextCellValue('-'),
        e.kelembapanUdaraPersen != null ? DoubleCellValue(e.kelembapanUdaraPersen!) : TextCellValue('-'),
        e.suhuUdaraCelsius != null ? DoubleCellValue(e.suhuUdaraCelsius!) : TextCellValue('-'),
        TextCellValue(e.deskripsiHabitat != null ? fmt.capitalizeFirst(e.deskripsiHabitat!) : '-'),
        TextCellValue(e.syncStatus == 'synced' ? 'Tersinkron' : 'Pending'),
        TextCellValue(_formatDateTime(e.createdAt)),
        TextCellValue(folder),
      ]);
    }

    final bytes = workbook.save();
    if (bytes == null) {
      throw ExportFailure('Gagal membuat file Excel.');
    }
    final xlsxFile = File(p.join(exportDir.path, 'data_pendataan.xlsx'));
    await xlsxFile.writeAsBytes(bytes);
    return xlsxFile;
  }

  /// KML — format standar Google Earth/Google My Maps. Cuma entri yang
  /// punya koordinat (latitude & longitude terisi) yang dimasukkan;
  /// entri dengan "koordinat belum lengkap" dilewati diam-diam karena
  /// memang tidak ada titik yang bisa digambar di peta.
  Future<File> _buildKml(List<PendataanEntry> entries, Directory exportDir) async {
    final buffer = StringBuffer();
    buffer.writeln('<?xml version="1.0" encoding="UTF-8"?>');
    buffer.writeln('<kml xmlns="http://www.opengis.net/kml/2.2">');
    buffer.writeln('<Document>');
    buffer.writeln('<name>${_xmlEscape('SemarField - Data Pendataan Kantong Semar')}</name>');

    for (final e in entries) {
      if (e.latitude == null || e.longitude == null) continue;

      final speciesLabel = e.spesies != null ? fmt.capitalizeFirst(e.spesies!) : 'Belum teridentifikasi';
      final title = '${e.titikPengamatan} — $speciesLabel';

      final desc = StringBuffer();
      desc.write('<b>Titik Pengamatan:</b> ${e.titikPengamatan}<br/>');
      desc.write('<b>Spesies:</b> $speciesLabel<br/>');
      desc.write('<b>Tanggal Pengamatan:</b> ${_formatDateTime(e.tanggalPengamatan)}<br/>');
      if (e.ketinggianMdpl != null) desc.write('<b>Ketinggian:</b> ${e.ketinggianMdpl} mdpl<br/>');
      if (e.gpsAccuracyMeter != null) desc.write('<b>Akurasi GPS:</b> ±${e.gpsAccuracyMeter!.toStringAsFixed(1)} m<br/>');
      if (e.panjangKantongCm != null) desc.write('<b>Panjang Kantong:</b> ${e.panjangKantongCm} cm<br/>');
      if (e.diameterKantongCm != null) desc.write('<b>Diameter Kantong:</b> ${e.diameterKantongCm!.toStringAsFixed(2)} cm<br/>');
      if (e.warnaKantong != null) desc.write('<b>Warna Kantong:</b> ${fmt.capitalizeFirst(e.warnaKantong!)}<br/>');
      if (e.phTanah != null) desc.write('<b>pH Tanah:</b> ${e.phTanah}<br/>');
      if (e.deskripsiHabitat != null) desc.write('<b>Habitat:</b> ${fmt.capitalizeFirst(e.deskripsiHabitat!)}<br/>');

      buffer.writeln('<Placemark>');
      buffer.writeln('<name>${_xmlEscape(title)}</name>');
      buffer.writeln('<description><![CDATA[${desc.toString()}]]></description>');
      buffer.writeln('<Point><coordinates>${e.longitude!.toStringAsFixed(7)},${e.latitude!.toStringAsFixed(7)},${e.ketinggianMdpl ?? 0}</coordinates></Point>');
      buffer.writeln('</Placemark>');
    }

    buffer.writeln('</Document>');
    buffer.writeln('</kml>');

    final kmlFile = File(p.join(exportDir.path, 'peta_lokasi.kml'));
    await kmlFile.writeAsString(buffer.toString());
    return kmlFile;
  }

  String _xmlEscape(String s) => s
      .replaceAll('&', '&amp;')
      .replaceAll('<', '&lt;')
      .replaceAll('>', '&gt;')
      .replaceAll('"', '&quot;')
      .replaceAll("'", '&apos;');

  Future<File> _buildZip({
    required List<PendataanEntry> entries,
    required File xlsxFile,
    required File kmlFile,
    required Directory workDir,
  }) async {
    final downloadsDir = await getTemporaryDirectory();
    final zipPath = p.join(
      downloadsDir.path,
      'semarfield_export_${_formatDateForFilename(DateTime.now())}.zip',
    );

    final encoder = ZipFileEncoder();
    encoder.create(zipPath);
    await encoder.addFile(xlsxFile, 'data_pendataan.xlsx');
    await encoder.addFile(kmlFile, 'peta_lokasi.kml');

    for (final entry in entries) {
      final photos = await _repo.getPhotosForEntry(entry.id);
      final folder = _folderNameFor(entry);
      for (final photo in photos) {
        final file = File(photo.localPath);
        if (!await file.exists()) continue; // foto hilang dari device, lewati diam-diam
        final ext = p.extension(photo.localPath);
        final filename = '${photo.jenisFoto}_${photo.id}$ext';
        await encoder.addFile(file, 'foto/$folder/$filename');
      }
    }

    encoder.close();
    return File(zipPath);
  }

  /// Nama folder per entri — pakai titik pengamatan + id lokal, BUKAN
  /// titik pengamatan saja. Kalau cuma titik pengamatan, dua individu
  /// Nepenthes berbeda yang dicatat di titik yang sama (kasus normal —
  /// lihat fitur "salin kondisi habitat" di form) akan tabrakan folder
  /// dan saling menimpa foto satu sama lain.
  String _folderNameFor(PendataanEntry e) {
    final safe = e.titikPengamatan.replaceAll(RegExp(r'[\\/:*?"<>|]'), '_');
    return '${safe}_id${e.id}';
  }

  String _formatDateTime(DateTime d) {
    final dd = d.day.toString().padLeft(2, '0');
    final mm = d.month.toString().padLeft(2, '0');
    final hh = d.hour.toString().padLeft(2, '0');
    final mi = d.minute.toString().padLeft(2, '0');
    return '$dd/$mm/${d.year} $hh:$mi';
  }

  String _formatDateForFilename(DateTime d) {
    final dd = d.day.toString().padLeft(2, '0');
    final mm = d.month.toString().padLeft(2, '0');
    return '${d.year}-$mm-$dd';
  }
}
