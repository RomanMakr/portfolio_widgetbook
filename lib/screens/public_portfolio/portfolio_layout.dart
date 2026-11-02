import 'package:flutter/material.dart';

import '../../widgets/common.dart';
import 'portfolio_navigation_widgets.dart';

class PortfolioLayout extends StatelessWidget {
  final bool mobile;
  final Widget child;
  const PortfolioLayout({super.key, required this.mobile, required this.child});

  @override
  Widget build(BuildContext context) => Scaffold(
    bottomNavigationBar: mobile ? const PortfolioNavigation() : null,
    body: GlowBackdrop(
      child: SingleChildScrollView(
        controller: PortfolioScope.maybeOf(context)?.scroll,
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
