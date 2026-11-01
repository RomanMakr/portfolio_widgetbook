import 'package:flutter/material.dart';

import '../design/theme.dart';
import 'panel.dart';

class ProjectTile extends StatelessWidget {
  final String title;
  final String category;
  final String description;
  final IconData icon;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ProjectTile({
    super.key,
    required this.title,
    required this.category,
    required this.description,
    this.icon = Icons.layers_outlined,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) => Panel(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Color(0xFF5D1B9C), Color(0xFF241B4E)],
            ),
          ),
          child: Center(child: Icon(icon, size: 48, color: Palette.violet)),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Palette.muted),
        ),
        const SizedBox(height: 12),
        Chip(label: Text(category)),
        if (onEdit != null || onDelete != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                tooltip: 'Edit',
                onPressed: onEdit,
                icon: const Icon(Icons.edit_outlined),
              ),
              IconButton(
                tooltip: 'Delete',
                onPressed: onDelete,
                icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              ),
            ],
          ),
      ],
    ),
  );
}
