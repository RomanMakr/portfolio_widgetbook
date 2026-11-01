import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';
import 'project_status.dart';

class ProjectTable extends StatelessWidget {
  final List<Project> projects;
  final ValueChanged<Project> onEdit, onDelete;
  const ProjectTable({
    super.key,
    required this.projects,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) => Panel(
    padding: EdgeInsets.zero,
    child: LayoutBuilder(
      builder: (context, c) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: c.maxWidth),
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(Palette.panel2),
            headingRowHeight: 46,
            dataRowMinHeight: 68,
            dataRowMaxHeight: 68,
            horizontalMargin: 18,
            columnSpacing: 26,
            columns: const [
              DataColumn(label: Text('Project')),
              DataColumn(label: Text('Category')),
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Actions')),
            ],
            rows: projects
                .map(
                  (p) => DataRow(
                    key: ValueKey(p.id),
                    cells: [
                      DataCell(
                        Row(
                          children: [
                            const IconBadge(Icons.layers_outlined, size: 32),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 180,
                              child: Text(
                                p.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DataCell(Chip(label: Text(p.category))),
                      DataCell(ProjectStatus(published: p.published)),
                      DataCell(
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              tooltip: 'Edit',
                              onPressed: () => onEdit(p),
                              icon: const Icon(Icons.edit_outlined, size: 19),
                            ),
                            IconButton(
                              tooltip: 'Delete',
                              onPressed: () => onDelete(p),
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.redAccent,
                                size: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    ),
  );
}
