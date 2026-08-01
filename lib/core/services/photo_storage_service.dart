import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// image_picker mengembalikan file di direktori cache/temp sementara —
/// OS boleh menghapusnya kapan saja untuk hemat ruang. Service ini
/// menyalin foto ke Application Documents Directory (permanen, aman
/// dari pembersihan OS) sebelum path-nya disimpan ke database.
class PhotoStorageService {
  final _picker = ImagePicker();

  Future<String?> pickFromCamera() => _pickAndSave(ImageSource.camera);
  Future<String?> pickFromGallery() => _pickAndSave(ImageSource.gallery);

  Future<String?> _pickAndSave(ImageSource source) async {
    final picked = await _picker.pickImage(
      source: source,
      maxWidth: 1600,
      imageQuality: 85,
    );
    if (picked == null) return null; // user membatalkan

    final docsDir = await getApplicationDocumentsDirectory();
    final photosDir = Directory(p.join(docsDir.path, 'photos'));
    if (!await photosDir.exists()) {
      await photosDir.create(recursive: true);
    }

    final fileName = '${DateTime.now().millisecondsSinceEpoch}_${p.basename(picked.path)}';
    final savedPath = p.join(photosDir.path, fileName);
    await File(picked.path).copy(savedPath);
    return savedPath;
  }
}
