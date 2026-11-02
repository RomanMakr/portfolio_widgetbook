import 'package:flutter/material.dart';

import '../design/theme.dart';

class AccentHeading extends StatelessWidget {
  final String leading, accent;
  final double size;
  const AccentHeading({
    super.key,
    required this.leading,
    required this.accent,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) => Text.rich(
    TextSpan(
      children: [
        TextSpan(text: leading),
        TextSpan(
          text: accent,
          style: const TextStyle(color: Palette.violet),
        ),
      ],
    ),
    style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: size),
  );
}
