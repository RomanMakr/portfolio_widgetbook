import 'package:flutter/material.dart';

import '../design/theme.dart';

class SectionHeading extends StatelessWidget {
  final String text;

  const SectionHeading(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 5),
        Container(
          width: 50,
          height: 3,
          decoration: BoxDecoration(
            color: Palette.violet,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    ),
  );
}
