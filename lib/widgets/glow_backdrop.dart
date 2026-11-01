import 'package:flutter/material.dart';

import '../design/theme.dart';

class GlowBackdrop extends StatelessWidget {
  final Widget child;

  const GlowBackdrop({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      gradient: RadialGradient(
        center: Alignment(0.7, -0.3),
        radius: 1.3,
        colors: [Color(0xFF43207E), Palette.bg, Palette.bg],
      ),
    ),
    child: child,
  );
}
