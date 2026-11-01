import 'package:flutter/material.dart';

import '../../widgets/common.dart';
import 'landing_feature.dart';

class LandingFeatures extends StatelessWidget {
  const LandingFeatures({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SectionHeading('Everything you need'),
      Wrap(
        spacing: 16,
        runSpacing: 16,
        children: const [
          LandingFeature(
            icon: Icons.person_outline,
            title: 'About Me',
            subtitle: 'Tell your story',
          ),
          LandingFeature(
            icon: Icons.work_outline,
            title: 'Experience',
            subtitle: 'Show your work history',
          ),
          LandingFeature(
            icon: Icons.layers_outlined,
            title: 'Projects',
            subtitle: 'Highlight your best work',
          ),
          LandingFeature(
            icon: Icons.mail_outline,
            title: 'Contact',
            subtitle: 'Get in touch easily',
          ),
        ],
      ),
    ],
  );
}
