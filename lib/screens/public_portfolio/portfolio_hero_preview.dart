import 'package:flutter/material.dart';

class PortfolioHeroPreview extends StatelessWidget {
  const PortfolioHeroPreview({super.key});

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: AspectRatio(
      aspectRatio: 1.15,
      child: Image.asset(
        'assets/images/developer_workspace.png',
        fit: BoxFit.cover,
        alignment: const Alignment(.45, 0),
      ),
    ),
  );
}
