import 'package:flutter/material.dart';

import 'portfolio_hero_content.dart';
import 'portfolio_visuals.dart';

class PortfolioHero extends StatelessWidget {
  final bool mobile;
  final VoidCallback? onContact;

  const PortfolioHero({super.key, required this.mobile, this.onContact});

  @override
  Widget build(BuildContext context) => Flex(
    direction: mobile ? Axis.vertical : Axis.horizontal,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ExpandedIf(
        mobile: mobile,
        child: PortfolioHeroContent(mobile: mobile, onContact: onContact),
      ),
      const SizedBox(width: 28, height: 30),
      ExpandedIf(mobile: mobile, child: const PortfolioVisuals()),
    ],
  );
}

class ExpandedIf extends StatelessWidget {
  final bool mobile;
  final Widget child;

  const ExpandedIf({super.key, required this.mobile, required this.child});

  @override
  Widget build(BuildContext context) => mobile
      ? SizedBox(width: double.infinity, child: child)
      : Expanded(child: child);
}
