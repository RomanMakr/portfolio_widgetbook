import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';
import 'publish_actions.dart';

class PublishShareContent extends StatelessWidget {
  final bool published;
  final ValueChanged<bool> onChanged;
  const PublishShareContent({
    super.key,
    required this.published,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Panel(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.share_outlined, color: Palette.violet, size: 30),
            SizedBox(width: 14),
            Expanded(
              child: Text(
                'Publish & Share',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Make your portfolio public and share it with anyone.',
          style: TextStyle(color: Palette.muted, fontSize: 12),
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
            color: Palette.bg.withValues(alpha: .5),
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: Palette.border),
          ),
          child: SwitchListTile(
            title: const Text('Publish Portfolio'),
            subtitle: Text(
              published
                  ? 'Your portfolio is public (demo state)'
                  : 'Your portfolio is private',
              style: const TextStyle(fontSize: 11),
            ),
            value: published,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Your Portfolio Link',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Palette.panel2,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Palette.border),
          ),
          child: const SelectableText(
            'https://portfolio.example/p/roman',
            style: TextStyle(fontSize: 13),
          ),
        ),
        const SizedBox(height: 18),
        const PublishActions(),
        const SizedBox(height: 14),
        const Text(
          'This is an example URL, not a deployed portfolio.',
          style: TextStyle(color: Palette.muted, fontSize: 11),
        ),
      ],
    ),
  );
}
