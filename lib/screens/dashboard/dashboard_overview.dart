import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';
import 'dashboard_overview_widgets.dart';

class DashboardOverview extends StatelessWidget {
  final String page;
  final int projectCount;
  final ValueChanged<String> onPageSelected;
  const DashboardOverview({
    super.key,
    required this.page,
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
      const SizedBox(height: 22),
      Wrap(
        spacing: 14,
        runSpacing: 14,
        children: [
          const StatCard(label: 'Experiences', count: '3'),
          StatCard(label: 'Projects', count: '$projectCount'),
          const StatCard(label: 'Skills', count: '12'),
          const StatCard(label: 'Profile Views', count: '—'),
        ],
      ),
      const SizedBox(height: 28),
      const SectionHeading('Quick Actions'),
      const Text(
        'Create, update or delete your portfolio content.',
        style: TextStyle(color: Palette.muted, fontSize: 12),
      ),
      const SizedBox(height: 14),
      Wrap(
        spacing: 14,
        runSpacing: 14,
        children: [
          QuickAction(
            label: 'Edit About Me',
            icon: Icons.person_outline,
            onTap: () => onPageSelected('Profile (About Me)'),
          ),
          QuickAction(
            label: 'Manage Experience',
            icon: Icons.work_outline,
            onTap: () => onPageSelected('Experience'),
          ),
          QuickAction(
            label: 'Manage Projects',
            icon: Icons.layers_outlined,
            onTap: () => onPageSelected('Projects'),
          ),
          QuickAction(
            label: 'Manage Skills',
            icon: Icons.code,
            onTap: () => onPageSelected('Skills'),
          ),
        ],
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
