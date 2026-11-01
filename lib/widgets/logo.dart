import 'package:flutter/material.dart';

import '../design/theme.dart';

class Logo extends StatelessWidget {
  final String initials;

  const Logo({super.key, this.initials = 'PB'});

  @override
  Widget build(BuildContext context) => Container(
    width: 40,
    height: 40,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Palette.purple,
      borderRadius: BorderRadius.circular(9),
    ),
    child: Text(
      initials,
      style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
    ),
  );
}
