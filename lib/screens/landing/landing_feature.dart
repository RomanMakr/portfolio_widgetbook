import 'package:flutter/material.dart';

import '../../design/theme.dart';
import '../../widgets/common.dart';

class LandingFeature extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;

  const LandingFeature({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 240,
    child: Panel(
      child: Row(
        children: [
          Icon(icon, color: Palette.violet, size: 30),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Palette.muted, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
