import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';

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

class DashboardLayout extends StatelessWidget {
  final String page;
  final bool mobile;
  final ValueChanged<String> onPageSelected;
  final Widget child;

  const DashboardLayout({
    super.key,
    required this.page,
    required this.mobile,
    required this.onPageSelected,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Palette.panel,
      title: const Text('Portfolio Admin'),
      actions: [
        if (mobile)
          PopupMenuButton<String>(
            onSelected: onPageSelected,
            itemBuilder: (_) => dashboardMenu
                .map((s) => PopupMenuItem(value: s, child: Text(s)))
                .toList(),
          ),
      ],
    ),
    bottomNavigationBar: mobile
        ? NavigationBar(
            selectedIndex: page == 'Projects'
                ? 1
                : page == 'Publish & Share'
                ? 2
                : 0,
            onDestinationSelected: (i) =>
                onPageSelected(['Dashboard', 'Projects', 'Publish & Share'][i]),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.dashboard_outlined),
                label: 'Dashboard',
              ),
              NavigationDestination(
                icon: Icon(Icons.layers_outlined),
                label: 'Projects',
              ),
              NavigationDestination(
                icon: Icon(Icons.share_outlined),
                label: 'Share',
              ),
            ],
          )
        : null,
    body: GlowBackdrop(
      child: Row(
        children: [
          if (!mobile)
            SizedBox(
              width: 230,
              child: ListView(
                children: dashboardMenu
                    .map(
                      (s) => ListTile(
                        selected: page == s,
                        title: Text(s),
                        onTap: () => onPageSelected(s),
                      ),
                    )
                    .toList(),
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: child,
            ),
          ),
        ],
      ),
    ),
  );
}
