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
            constraints: const BoxConstraints(maxWidth: 1440),
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
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, c) => Row(
      children: [
        const Logo(initials: 'RM'),
        const SizedBox(width: 10),
        const Expanded(
          child: Text(
            'Roman Makaryan',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        if (c.maxWidth >= 1000) ...[
          const Text(
            'Home       About       Experience       Projects       Contact',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(width: 24),
          OutlinedButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('A CV file has not been added yet.'),
              ),
            ),
            child: const Text('Download CV'),
          ),
        ],
      ],
    ),
  );
}
