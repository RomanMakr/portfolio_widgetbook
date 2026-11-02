import 'package:flutter/material.dart';

import '../../design/theme.dart';
import 'portfolio_scope.dart';

class PortfolioNavigation extends StatelessWidget {
  const PortfolioNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = PortfolioScope.maybeOf(context);
    const sections = [
      PortfolioSection.home,
      PortfolioSection.about,
      PortfolioSection.projects,
      PortfolioSection.contact,
    ];
    final selected = navigation?.selected ?? PortfolioSection.home;
    return NavigationBar(
      backgroundColor: Palette.panel,
      selectedIndex: selected == PortfolioSection.experience
          ? 1
          : sections.indexOf(selected),
      onDestinationSelected: navigation == null
          ? null
          : (index) => navigation.navigate(sections[index]),
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
}
