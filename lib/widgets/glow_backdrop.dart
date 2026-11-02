import 'package:flutter/material.dart';

import '../design/theme.dart';
import 'glow_painter.dart';

class GlowBackdrop extends StatelessWidget {
  final Widget child;
  const GlowBackdrop({super.key, required this.child});

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: const BoxDecoration(
      gradient: RadialGradient(
        center: Alignment(0.45, -0.4),
        radius: 1.1,
        colors: [Color(0xFF2B104F), Palette.bg, Palette.bg],
      ),
    ),
    child: Stack(
      children: [
        const Positioned.fill(
          child: IgnorePointer(child: CustomPaint(painter: GlowPainter())),
        ),
        child,
      ],
    ),
  );
}
