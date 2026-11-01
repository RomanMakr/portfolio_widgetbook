import 'package:flutter/material.dart';

class GlowPainter extends CustomPainter {
  const GlowPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final ribbon = Path()
      ..moveTo(-size.width * .1, size.height * .85)
      ..cubicTo(
        size.width * .25,
        -size.height * .15,
        size.width * .48,
        size.height * 1.2,
        size.width * .78,
        size.height * .35,
      )
      ..cubicTo(
        size.width,
        -size.height * .18,
        size.width * 1.2,
        size.height * .45,
        size.width * 1.1,
        size.height * .8,
      );
    canvas.drawPath(
      ribbon,
      Paint()
        ..color = const Color(0x489800FF)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 135
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 45),
    );
    canvas.drawPath(
      ribbon,
      Paint()
        ..shader = const LinearGradient(
          colors: [Color(0x007400D9), Color(0xFF9E2BFF), Color(0x006D00C4)],
        ).createShader(Offset.zero & size)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );
  }

  @override
  bool shouldRepaint(GlowPainter oldDelegate) => false;
}
