import 'package:flutter/material.dart';

import '../../design/theme.dart';
import '../../widgets/common.dart';

class LandingPreview extends StatelessWidget {
  const LandingPreview({super.key});

  @override
  Widget build(BuildContext context) => Panel(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        const Icon(Icons.devices, size: 88, color: Palette.violet),
        const SizedBox(height: 12),
        const Text(
          'YOUR PORTFOLIO',
          style: TextStyle(color: Palette.muted, letterSpacing: 2),
        ),
        const SizedBox(height: 12),
        const Text(
          'Software Engineer',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        const Text('About • Experience • Projects • Contact'),
        const SizedBox(height: 25),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Chip(label: Text('Flutter')),
            Chip(label: Text('Firebase')),
            Chip(label: Text('Clean Architecture')),
          ],
        ),
      ],
    ),
  );
}
