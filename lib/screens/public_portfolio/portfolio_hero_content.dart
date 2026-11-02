import 'package:flutter/material.dart';

import '../../design/theme.dart';
import '../../widgets/common.dart';

class PortfolioHeroContent extends StatelessWidget {
  final bool mobile;
  final VoidCallback? onContact;
  const PortfolioHeroContent({super.key, required this.mobile, this.onContact});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Chip(label: Text('Software Engineer • Backend & Mobile Developer')),
      const SizedBox(height: 18),
      AccentHeading(
        leading: 'Hi, I’m Roman 👋\nSoftware ',
        accent: 'Engineer',
        size: mobile ? 37 : 48,
      ),
      const SizedBox(height: 16),
      const Text(
        'I build reliable backend services and mobile applications with Go, TypeScript, Flutter and Dart.',
        style: TextStyle(color: Palette.muted, fontSize: 15),
      ),
      const SizedBox(height: 24),
      Wrap(
        spacing: 12,
        runSpacing: 10,
        children: [
          AccentButton(
            text: 'Download CV',
            icon: Icons.download,
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('A CV file has not been added yet.'),
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed: onContact,
            icon: const Icon(Icons.send_outlined, size: 16),
            label: const Text('Contact Me'),
          ),
        ],
      ),
      const SizedBox(height: 18),
      const SocialLinks(),
    ],
  );
}
