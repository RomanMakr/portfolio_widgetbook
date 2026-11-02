import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 74,
    padding: const EdgeInsets.symmetric(horizontal: 28),
    decoration: const BoxDecoration(
      border: Border(bottom: BorderSide(color: Palette.border)),
    ),
    child: const Row(
      children: [
        Text(
          'Portfolio Admin',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Spacer(),
        CircleAvatar(
          radius: 18,
          backgroundColor: Palette.purple,
          foregroundColor: Colors.white,
          child: Text(
            'RM',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
        SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Roman Makaryan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Text(
              'Account Owner',
              style: TextStyle(color: Palette.muted, fontSize: 11),
            ),
          ],
        ),
      ],
    ),
  );
}
