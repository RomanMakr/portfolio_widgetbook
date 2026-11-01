import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';
import 'project_table.dart';

class ProjectsContent extends StatelessWidget {
  final List<Project> projects;
  final double width;
  final VoidCallback onAdd;
  final ValueChanged<Project> onEdit, onDelete;
  const ProjectsContent({
    super.key,
    required this.projects,
    required this.width,
    required this.onAdd,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          const Expanded(child: SectionHeading('Projects Management (CRUD)')),
          AccentButton(text: 'Add Project', icon: Icons.add, onPressed: onAdd),
        ],
      ),
      const SizedBox(height: 14),
      if (width >= 800)
        ProjectTable(projects: projects, onEdit: onEdit, onDelete: onDelete)
      else
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: projects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: width < 600 ? 1 : 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 370,
          ),
          itemBuilder: (_, i) {
            final p = projects[i];
            return ProjectTile(
              title: p.title,
              category: p.category,
              description: p.description,
              onEdit: () => onEdit(p),
              onDelete: () => onDelete(p),
            );
          },
        ),
    ],
  );
}
