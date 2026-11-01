import 'package:flutter/material.dart';

import '../../design/theme.dart';
import '../../widgets/common.dart';

class PortfolioHeroPreview extends StatelessWidget {
  const PortfolioHeroPreview({super.key});

  @override
  Widget build(BuildContext context) => const Panel(
    child: Column(
      children: [
        Icon(Icons.code, color: Palette.violet, size: 82),
        SizedBox(height: 10),
        Text(
          'Flutter • Dart • Mobile • Web',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        Text('5+ Years of Experience', style: TextStyle(color: Palette.muted)),
      ],
    ),
  );
}
