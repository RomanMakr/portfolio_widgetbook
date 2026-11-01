import 'package:flutter/material.dart';

import '../design/theme.dart';

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  const IconBadge(this.icon, {super.key, this.size = 42});

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Palette.purple.withValues(alpha: .15),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Palette.violet.withValues(alpha: .12)),
    ),
    child: Icon(icon, color: Palette.violet, size: size * .6),
  );
}
