import 'package:flutter/material.dart';

import '../../design/theme.dart';

class PortfolioNavigation extends StatelessWidget {
  const PortfolioNavigation({super.key});

  @override
  Widget build(BuildContext context) => NavigationBar(
    backgroundColor: Palette.panel,
    selectedIndex: 0,
    destinations: const [
      NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
      NavigationDestination(icon: Icon(Icons.person_outline), label: 'About'),
      NavigationDestination(
        icon: Icon(Icons.layers_outlined),
        label: 'Projects',
      ),
      NavigationDestination(icon: Icon(Icons.mail_outline), label: 'Contact'),
    ],
  );
}
