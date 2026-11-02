import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';

class StatCard extends StatelessWidget {
  final String label, count;
  const StatCard({super.key, required this.label, required this.count});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 170,
    child: Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            switch (label) {
              'Experiences' => Icons.work_outline,
              'Projects' => Icons.layers_outlined,
              'Skills' => Icons.code,
              _ => Icons.bar_chart,
            },
            color: Palette.violet,
            size: 25,
          ),
          const SizedBox(height: 9),
          Text(
            count,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          Text(
            label,
            style: const TextStyle(color: Palette.muted, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
