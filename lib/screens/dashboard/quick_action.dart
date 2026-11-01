import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';

class QuickAction extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const QuickAction({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 215,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Panel(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Palette.violet, size: 28),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Manage your portfolio content',
                    style: TextStyle(fontSize: 11, color: Palette.muted),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: Palette.violet,
                  size: 17,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
