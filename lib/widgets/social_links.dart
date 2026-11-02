import 'package:flutter/material.dart';

import '../design/theme.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 8,
    children: ['GitHub', 'LinkedIn', 'X', 'Telegram', 'Email']
        .map(
          (name) => IconButton.filledTonal(
            tooltip: name,
            style: IconButton.styleFrom(
              backgroundColor: Palette.panel2,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$name profile is not configured yet.')),
            ),
            icon: switch (name) {
              'GitHub' => const Icon(Icons.code, size: 19),
              'LinkedIn' => const Text(
                'in',
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
              'X' => const Text(
                'X',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              'Telegram' => const Icon(Icons.send_outlined, size: 19),
              _ => const Icon(Icons.mail_outline, size: 19),
            },
          ),
        )
        .toList(),
  );
}
