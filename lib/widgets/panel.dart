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
      color: Palette.panel,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Palette.border),
    ),
    child: child,
  );
}
