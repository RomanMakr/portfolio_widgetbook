import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';

void showProjectEditor(
  BuildContext context, {
  Project? project,
  required ValueChanged<Project> onSave,
}) {
  final title = TextEditingController(text: project?.title ?? '');
  final category = TextEditingController(text: project?.category ?? '');
  final description = TextEditingController(text: project?.description ?? '');
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(project == null ? 'Add Project' : 'Edit Project'),
      content: SizedBox(
        width: 430,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: title,
                decoration: const InputDecoration(labelText: 'Project Title'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: category,
                decoration: const InputDecoration(labelText: 'Category'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: description,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (title.text.trim().isEmpty) return;
            onSave(
              Project(
                published: project?.published ?? false,
                id:
                    project?.id ??
                    DateTime.now().microsecondsSinceEpoch.toString(),
                title: title.text.trim(),
                category: category.text.trim(),
                description: description.text.trim(),
              ),
            );
            Navigator.pop(ctx);
          },
          child: const Text('Save'),
        ),
      ],
    ),
  );
}
