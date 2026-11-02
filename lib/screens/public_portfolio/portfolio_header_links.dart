import 'package:flutter/material.dart';

import 'portfolio_scope.dart';

class PortfolioHeaderLinks extends StatelessWidget {
  const PortfolioHeaderLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = PortfolioScope.maybeOf(context);
    return Wrap(
      spacing: 4,
      children: PortfolioSection.values
          .map(
            (section) => TextButton(
              onPressed: navigation == null
                  ? null
                  : () => navigation.navigate(section),
              style: TextButton.styleFrom(
                foregroundColor: navigation?.selected == section
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.white,
              ),
              child: Text(switch (section) {
                PortfolioSection.home => 'Home',
                PortfolioSection.about => 'About',
                PortfolioSection.experience => 'Experience',
                PortfolioSection.projects => 'Projects',
                PortfolioSection.contact => 'Contact',
              }, style: const TextStyle(fontSize: 12)),
            ),
          )
          .toList(),
    );
  }
}
