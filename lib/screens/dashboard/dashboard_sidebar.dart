import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';
import '../public_portfolio.dart';

const dashboardMenu = [
  'Dashboard',
  'Profile (About Me)',
  'Experience',
  'Projects',
  'Skills',
  'Contacts',
  'Settings',
  'Publish & Share',
];

class DashboardSidebar extends StatelessWidget {
  final String page;
  final ValueChanged<String> onPageSelected;
  const DashboardSidebar({
    super.key,
    required this.page,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: 245,
    decoration: const BoxDecoration(
      color: Color(0xFF100C27),
      border: Border(right: BorderSide(color: Palette.border)),
    ),
    child: ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Row(
          children: [
            Logo(),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Portfolio Builder',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        ...dashboardMenu.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Material(
              color: page == item ? Palette.purple : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              child: ListTile(
                dense: true,
                selected: page == item,
                selectedColor: Colors.white,
                selectedTileColor: Palette.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: Icon(switch (item) {
                  'Dashboard' => Icons.dashboard_outlined,
                  'Profile (About Me)' => Icons.person_outline,
                  'Experience' => Icons.work_outline,
                  'Projects' => Icons.layers_outlined,
                  'Skills' => Icons.code,
                  'Contacts' => Icons.mail_outline,
                  'Settings' => Icons.settings_outlined,
                  _ => Icons.share_outlined,
                }, size: 19),
                title: Text(item, style: const TextStyle(fontSize: 12)),
                onTap: () => onPageSelected(item),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => const PublicPortfolioScreen(),
            ),
          ),
          icon: const Icon(Icons.north_east, size: 16),
          label: const Text('View My Portfolio'),
        ),
      ],
    ),
  );
}
