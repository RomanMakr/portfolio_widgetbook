import 'package:flutter/material.dart';

import 'portfolio_hero_preview.dart';
import 'portfolio_achievements.dart';

class PortfolioVisuals extends StatelessWidget {
  const PortfolioVisuals({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, c) => c.maxWidth >= 510
        ? const Row(
            children: [
              PortfolioAchievements(),
              SizedBox(width: 16),
              Expanded(child: PortfolioHeroPreview()),
            ],
          )
        : const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PortfolioHeroPreview(),
              SizedBox(height: 18),
              PortfolioAchievements(horizontal: true),
            ],
          ),
  );
}
