import 'package:flutter/material.dart';

import '../../widgets/common.dart';

class PortfolioAchievements extends StatelessWidget {
  final bool horizontal;
  const PortfolioAchievements({super.key, this.horizontal = false});

  @override
  Widget build(BuildContext context) {
    final cards = [
      const _Achievement(
        Icons.emoji_events_outlined,
        '5+ Years',
        'of Experience',
      ),
      const _Achievement(
        Icons.layers_outlined,
        'Projects',
        'Selected work & ideas',
      ),
      const _Achievement(Icons.code, '10+', 'Technologies'),
    ];
    return horizontal
        ? Wrap(spacing: 10, runSpacing: 10, children: cards)
        : Column(
            children: cards
                .map(
                  (card) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: card,
                  ),
                )
                .toList(),
          );
  }
}

class _Achievement extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  const _Achievement(this.icon, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 175,
    child: Panel(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          IconBadge(icon, size: 34),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFFC3BBD8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
