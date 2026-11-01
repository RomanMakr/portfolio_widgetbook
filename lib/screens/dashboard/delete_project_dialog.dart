import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';

void showDeleteProjectDialog(
  BuildContext context, {
  required Project project,
  required VoidCallback onDelete,
}) => showDialog(
  context: context,
  builder: (ctx) => AlertDialog(
    title: const Text('Delete project?'),
    content: Text('Delete ${project.title}?'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(ctx),
        child: const Text('Cancel'),
      ),
      TextButton(
        onPressed: () {
          onDelete();
          Navigator.pop(ctx);
        },
        child: const Text('Delete', style: TextStyle(color: Colors.redAccent)),
      ),
    ],
  ),
);
