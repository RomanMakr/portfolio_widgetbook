import 'package:flutter/material.dart';

import '../../design/theme.dart';
import '../../widgets/common.dart';

class LandingHeroContent extends StatelessWidget {
  final bool mobile;
  final VoidCallback? onSignUp, onDemo;

  const LandingHeroContent({
    super.key,
    required this.mobile,
    this.onSignUp,
    this.onDemo,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Chip(label: Text('Build • Manage • Share')),
      const SizedBox(height: 18),
      Text(
        'Create Your\nProfessional\nPortfolio',
        style: Theme.of(
          context,
        ).textTheme.headlineLarge?.copyWith(fontSize: mobile ? 42 : 66),
      ),
      const SizedBox(height: 18),
      const Text(
        'Build a modern responsive portfolio for your career. Manage your content, showcase your work and share it with a unique link.',
        style: TextStyle(color: Palette.muted, fontSize: 16, height: 1.6),
      ),
      const SizedBox(height: 26),
      Wrap(
        spacing: 12,
        runSpacing: 10,
        children: [
          AccentButton(text: 'Get Started', onPressed: onSignUp),
          OutlinedButton(onPressed: onDemo, child: const Text('View Demo')),
        ],
      ),
      const SizedBox(height: 20),
      const Text(
        '✓ No coding required     ✓ Web & Mobile     ✓ Share anywhere',
        style: TextStyle(color: Palette.muted),
      ),
    ],
  );
}
