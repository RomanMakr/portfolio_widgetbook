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
      AccentHeading(
        leading: 'Create Your\nProfessional\n',
        accent: 'Portfolio',
        size: mobile ? 42 : 52,
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
      Wrap(
        spacing: 18,
        runSpacing: 10,
        children: ['No coding required', 'Web & Mobile', 'Free to start']
            .map(
              (text) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check, size: 15),
                  const SizedBox(width: 6),
                  Text(
                    text,
                    style: const TextStyle(color: Palette.muted, fontSize: 12),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    ],
  );
}
