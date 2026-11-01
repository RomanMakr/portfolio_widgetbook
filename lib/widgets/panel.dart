import 'package:flutter/material.dart';

import '../design/theme.dart';

class Panel extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const Panel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: padding,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Palette.panel2, Palette.panel],
      ),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Palette.border.withValues(alpha: 0.65)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x25000000),
          blurRadius: 20,
          offset: Offset(0, 8),
        ),
      ],
    ),
    child: child,
  );
}
