import 'package:flutter/material.dart';

import '../../widgets/common.dart';
import 'portfolio_navigation.dart';

class PortfolioLayout extends StatelessWidget {
  final bool mobile;
  final Widget child;

  const PortfolioLayout({super.key, required this.mobile, required this.child});

  @override
  Widget build(BuildContext context) => Scaffold(
    bottomNavigationBar: mobile ? const PortfolioNavigation() : null,
    body: GlowBackdrop(
      child: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1250),
            child: Padding(
              padding: EdgeInsets.all(mobile ? 18 : 32),
              child: child,
            ),
          ),
        ),
      ),
    ),
  );
}

class PortfolioHeader extends StatelessWidget {
  final bool mobile;

  const PortfolioHeader({super.key, required this.mobile});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      const Logo(initials: 'RM'),
      const SizedBox(width: 10),
      const Expanded(
        child: Text(
          'Roman Makaryan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      if (!mobile)
        const Text(
          'Home       About       Experience       Projects       Contact',
        ),
    ],
  );
}
