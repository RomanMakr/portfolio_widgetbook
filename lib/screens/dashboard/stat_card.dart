import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';

class StatCard extends StatelessWidget {
  final String label, count;

  const StatCard({super.key, required this.label, required this.count});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 155,
    child: Panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.auto_awesome, color: Palette.violet),
          const SizedBox(height: 8),
          Text(
            count,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(label, style: const TextStyle(color: Palette.muted)),
        ],
      ),
    ),
  );
}
