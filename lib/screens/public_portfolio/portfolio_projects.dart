import 'package:flutter/material.dart';

import '../../models/project.dart';
import '../../widgets/common.dart';

class PortfolioProjects extends StatelessWidget {
  final bool mobile;
  final List<Project> projects;

  const PortfolioProjects({
    super.key,
    required this.mobile,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SectionHeading('Featured Projects'),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projects.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: mobile ? 1 : 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          mainAxisExtent: 290,
        ),
        itemBuilder: (context, index) {
          final project = projects[index];
          return ProjectTile(
            title: project.title,
            category: project.category,
            description: project.description,
          );
        },
      ),
    ],
  );
}
