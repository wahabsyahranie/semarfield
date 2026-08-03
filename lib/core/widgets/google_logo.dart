import 'package:flutter/material.dart';

/// Logo "G" Google 4-warna, digambar manual (bukan asset gambar) supaya
/// tidak perlu bundling file tambahan. Dipakai khusus untuk tombol
/// "Masuk dengan Google" — sesuai panduan identitas Google untuk tombol
/// sign-in (bukan dipakai sembarangan sebagai dekorasi umum).
class GoogleLogo extends StatelessWidget {
  final double size;
  const GoogleLogo({super.key, this.size = 18});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(painter: _GoogleLogoPainter()),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / 24;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = 10.0 * s;
    const strokeWidth = 4.4;

    void arc(double startDeg, double sweepDeg, Color color) {
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth * s
        ..strokeCap = StrokeCap.butt;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startDeg * 3.14159265 / 180,
        sweepDeg * 3.14159265 / 180,
        false,
        paint,
      );
    }

    // Empat busur warna resmi Google, membentuk cincin "G" —
    // sudut disusun searah jarum jam dimulai dari kanan (0°).
    arc(-50, 95, const Color(0xFF4285F4)); // biru — atas & kanan
    arc(45, 90, const Color(0xFF34A853)); // hijau — kanan bawah
    arc(135, 90, const Color(0xFFFBBC05)); // kuning — kiri bawah
    arc(225, 85, const Color(0xFFEA4335)); // merah — kiri atas

    // Bar horizontal khas "G" di sisi kanan tengah.
    final barPaint = Paint()..color = const Color(0xFF4285F4);
    canvas.drawRect(
      Rect.fromLTWH(center.dx, center.dy - (2.2 * s), radius + (strokeWidth * s / 2), 4.4 * s),
      barPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
