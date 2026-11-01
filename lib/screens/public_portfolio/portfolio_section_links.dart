import 'package:flutter/material.dart';

import '../../widgets/common.dart';

class PortfolioSectionLinks extends StatelessWidget {
  const PortfolioSectionLinks({super.key});

  @override
  Widget build(BuildContext context) => Panel(
    padding: const EdgeInsets.all(16),
    child: LayoutBuilder(
      builder: (context, c) {
        const items = [
          _Section(
            Icons.person_outline,
            'About Me',
            'Biography, skills, technologies',
          ),
          _Section(
            Icons.work_outline,
            'Experience',
            'Work history and achievements',
          ),
          _Section(
            Icons.layers_outlined,
            'Projects',
            'Selected work and case studies',
          ),
          _Section(Icons.mail_outline, 'Contact', 'Get in touch or hire me'),
        ];
        return c.maxWidth > 900
            ? Row(children: items.map((item) => Expanded(child: item)).toList())
            : Wrap(spacing: 18, runSpacing: 14, children: items);
      },
    ),
  );
}

class _Section extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  const _Section(this.icon, this.title, this.subtitle);

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 240,
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
              Text(
                subtitle,
                style: const TextStyle(fontSize: 10, color: Color(0xFFC3BBD8)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
