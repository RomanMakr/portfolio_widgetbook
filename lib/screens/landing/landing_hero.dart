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
        child: LandingHeroContent(
          mobile: mobile,
          onSignUp: onSignUp,
          onDemo: onDemo,
        ),
      ),
      const SizedBox(width: 35, height: 35),
      ExpandedIfDesktop(mobile: mobile, child: const LandingPreview()),
    ],
  );
}

class ExpandedIfDesktop extends StatelessWidget {
  final bool mobile;
  final Widget child;

  const ExpandedIfDesktop({
    super.key,
    required this.mobile,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => mobile
      ? SizedBox(width: double.infinity, child: child)
      : Expanded(child: child);
}
