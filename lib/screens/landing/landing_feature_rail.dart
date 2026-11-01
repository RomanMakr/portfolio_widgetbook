import 'package:flutter/material.dart';

import 'landing_feature.dart';

class LandingFeatureRail extends StatelessWidget {
  const LandingFeatureRail({super.key});

  @override
  Widget build(BuildContext context) => const Column(
    children: [
      LandingFeature(
        icon: Icons.person_outline,
        title: 'About Me',
        subtitle: 'Tell your story',
        width: double.infinity,
      ),
      SizedBox(height: 10),
      LandingFeature(
        icon: Icons.work_outline,
        title: 'Experience',
        subtitle: 'Show your work history',
        width: double.infinity,
      ),
      SizedBox(height: 10),
      LandingFeature(
        icon: Icons.layers_outlined,
        title: 'Projects',
        subtitle: 'Highlight your best work',
        width: double.infinity,
      ),
      SizedBox(height: 10),
      LandingFeature(
        icon: Icons.mail_outline,
        title: 'Contact',
        subtitle: 'Get in touch easily',
        width: double.infinity,
      ),
    ],
  );
}
