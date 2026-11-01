import 'package:flutter/material.dart';

import '../../design/theme.dart';
import '../../widgets/common.dart';

class PortfolioHeroContent extends StatelessWidget {
  final bool mobile;

  const PortfolioHeroContent({super.key, required this.mobile});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Chip(label: Text('</> Software Engineer')),
      const SizedBox(height: 18),
      Text(
        'Hi, I’m Roman 👋\nSoftware Engineer',
        style: Theme.of(
          context,
        ).textTheme.headlineLarge?.copyWith(fontSize: mobile ? 37 : 54),
      ),
      const SizedBox(height: 15),
      const Text(
        'I build high-quality mobile and web applications with Flutter and modern technologies.',
        style: TextStyle(color: Palette.muted, fontSize: 16),
      ),
      const SizedBox(height: 24),
      Wrap(
        spacing: 12,
        children: [
          const AccentButton(text: 'Download CV', icon: Icons.download),
          OutlinedButton(onPressed: () {}, child: const Text('Contact Me')),
        ],
      ),
      const SizedBox(height: 18),
      const Text(
        'GitHub     LinkedIn     Telegram     Email',
        style: TextStyle(color: Palette.muted),
      ),
    ],
  );
}
