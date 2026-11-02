import 'package:flutter/material.dart';

class ProjectStatus extends StatelessWidget {
  final bool published;
  const ProjectStatus({super.key, required this.published});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: published ? const Color(0xFF176B2B) : const Color(0xFF3B3159),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(
      published ? 'Published' : 'Draft',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 11,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
