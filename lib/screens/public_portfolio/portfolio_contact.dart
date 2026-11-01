import 'package:flutter/material.dart';

import '../../design/theme.dart';
import '../../widgets/common.dart';

class PortfolioContact extends StatelessWidget {
  const PortfolioContact({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SectionHeading('Contact'),
      Panel(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Let’s work together!'),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Your Email'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Your Message'),
            ),
            const SizedBox(height: 12),
            const Text(
              'Contact form UI demo — sending is not connected',
              style: TextStyle(color: Palette.muted),
            ),
          ],
        ),
      ),
    ],
  );
}
