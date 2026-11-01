import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';
import 'stat_card.dart';

class DashboardOverview extends StatelessWidget {
  final String page;
  final List<String> menu;
  final int projectCount;
  final ValueChanged<String> onPageSelected;

  const DashboardOverview({
    super.key,
    required this.page,
    required this.menu,
    required this.projectCount,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SectionHeading('Dashboard'),
      const Text(
        'Manage your portfolio content',
        style: TextStyle(color: Palette.muted),
      ),
      const SizedBox(height: 20),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          const StatCard(label: 'Experiences', count: '3'),
          StatCard(label: 'Projects', count: '$projectCount'),
          const StatCard(label: 'Skills', count: '12'),
          const StatCard(label: 'Profile Views', count: '—'),
        ],
      ),
      const SizedBox(height: 28),
      const SectionHeading('Quick Actions'),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: menu
            .skip(1)
            .map(
              (item) => SizedBox(
                width: 190,
                child: InkWell(
                  onTap: () => onPageSelected(item),
                  child: Panel(
                    child: Column(
                      children: [
                        const Icon(Icons.edit_note, color: Palette.violet),
                        const SizedBox(height: 8),
                        Text(item, textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
      if (page != 'Dashboard') ...[
        const SizedBox(height: 25),
        Panel(
          child: Text(
            '$page editor placeholder — connect this module to Firestore for persistent CRUD.',
          ),
        ),
      ],
    ],
  );
}
