import 'package:flutter/material.dart';

import 'landing_hero_content.dart';
import 'landing_preview.dart';

class LandingHero extends StatelessWidget {
  final bool mobile;
  final VoidCallback? onSignUp, onDemo;

  const LandingHero({
    super.key,
    required this.mobile,
    this.onSignUp,
    this.onDemo,
  });

  @override
  Widget build(BuildContext context) => Flex(
    direction: mobile ? Axis.vertical : Axis.horizontal,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ExpandedIfDesktop(
        mobile: mobile,
        flex: 4,
        child: LandingHeroContent(
          mobile: mobile,
          onSignUp: onSignUp,
          onDemo: onDemo,
        ),
      ),
      const SizedBox(width: 35, height: 35),
      ExpandedIfDesktop(mobile: mobile, flex: 7, child: const LandingPreview()),
    ],
  );
}

class ExpandedIfDesktop extends StatelessWidget {
  final bool mobile;
  final Widget child;
  final int flex;

  const ExpandedIfDesktop({
    super.key,
    required this.mobile,
    required this.child,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) => mobile
      ? SizedBox(width: double.infinity, child: child)
      : Expanded(flex: flex, child: child);
}
