import 'package:flutter/material.dart';

class DashboardNavigation extends StatelessWidget {
  final String page;
  final ValueChanged<String> onPageSelected;
  const DashboardNavigation({
    super.key,
    required this.page,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) => NavigationBar(
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
      NavigationDestination(icon: Icon(Icons.share_outlined), label: 'Share'),
    ],
  );
}
