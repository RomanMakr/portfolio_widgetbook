import 'package:flutter/material.dart';

import 'dashboard/dashboard_components.dart';
import 'dashboard/dashboard_dependencies.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final projects = [...sampleProjects];
  String page = 'Dashboard';

  void editor([Project? project]) => showProjectEditor(
    context,
    project: project,
    onSave: (saved) => setState(() {
      if (project != null) {
        projects.removeWhere((p) => p.id == project.id);
      }
      projects.add(saved);
    }),
  );

  void delete(Project project) => showDeleteProjectDialog(
    context,
    project: project,
    onDelete: () => setState(() {
      projects.removeWhere((p) => p.id == project.id);
    }),
  );

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final mobile = constraints.maxWidth < 800;
      final content = page == 'Projects'
          ? ProjectsContent(
              projects: projects,
              width: constraints.maxWidth,
              onAdd: () => editor(),
              onEdit: editor,
              onDelete: delete,
            )
          : page == 'Publish & Share'
          ? const PublishShareScreen(embedded: true)
          : DashboardOverview(
              menu: dashboardMenu,
              page: page,
              projectCount: projects.length,
              onPageSelected: (value) => setState(() => page = value),
            );
      return DashboardLayout(
        page: page,
        mobile: mobile,
        onPageSelected: (value) => setState(() => page = value),
        child: content,
      );
    },
  );
}
