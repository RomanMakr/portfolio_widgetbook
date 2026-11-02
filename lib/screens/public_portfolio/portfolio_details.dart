import 'package:flutter/material.dart';

import '../../design/theme.dart';
import '../../widgets/common.dart';

class PortfolioDetails extends StatelessWidget {
  final GlobalKey? experienceKey;
  const PortfolioDetails({super.key, this.experienceKey});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SectionHeading('About Me'),
      const Text(
        'Experienced Software Engineer specializing in backend development with '
        'GoLang, TypeScript, and mobile development with Flutter and Dart. '
        'I build reliable, scalable applications with a focus on clean code and '
        'maintainable architecture. I enjoy solving complex problems and '
        'continuously improving my skills to create software that makes '
        'a positive impact.',
      ),
      const SizedBox(height: 35),
      const SectionHeading('Technical Skills'),
      Wrap(
        spacing: 9,
        runSpacing: 9,
        children: [
          'Go',
          'TypeScript',
          'Flutter',
          'Dart',
          'BLoC / Cubit',
          'Clean Architecture',
          'Firebase',
          'REST API',
          'AWS',
          'SQLite',
          'PostgreSQL',
          'Docker',
          'Redis',
          'Git / GitHub',
        ].map((skill) => Chip(label: Text(skill))).toList(),
      ),
      const SizedBox(height: 35),
      SectionHeading('Experience', key: experienceKey),
      const Panel(
        child: ListTile(
          leading: Icon(Icons.work_outline, color: Palette.violet),
          title: Text('Software Engineer'),
          subtitle: Text(
            'Cross-platform applications • Healthcare, E-Commerce, Social Media',
          ),
        ),
      ),
    ],
  );
}
