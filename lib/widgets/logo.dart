import 'package:flutter/material.dart';

import '../design/theme.dart';

class Logo extends StatelessWidget {
  final String initials;
  const Logo({super.key, this.initials = 'PB'});

  @override
  Widget build(BuildContext context) => Container(
    width: 38,
    height: 38,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFB900FF), Color(0xFF6300C6)],
      ),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Palette.violet.withValues(alpha: 0.3)),
      boxShadow: const [BoxShadow(color: Color(0x559600FF), blurRadius: 18)],
    ),
    child: Text(
      initials,
      style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
    ),
  );
}
