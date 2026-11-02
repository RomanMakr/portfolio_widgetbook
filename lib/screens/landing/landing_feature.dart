import 'package:flutter/material.dart';

import '../../widgets/common.dart';

class LandingFeature extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final double width;
  const LandingFeature({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.width = 240,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width,
    child: Panel(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          IconBadge(icon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFFC3BBD8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
