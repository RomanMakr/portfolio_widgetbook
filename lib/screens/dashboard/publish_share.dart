import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';
import 'publish_share_content.dart';

class PublishShareScreen extends StatefulWidget {
  final bool embedded;
  const PublishShareScreen({super.key, this.embedded = false});

  @override
  State<PublishShareScreen> createState() => _PublishShareScreenState();
}

class _PublishShareScreenState extends State<PublishShareScreen> {
  bool published = true;

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 680),
        child: PublishShareContent(
          published: published,
          onChanged: (value) => setState(() => published = value),
        ),
      ),
    );
    return widget.embedded
        ? content
        : Scaffold(
            appBar: AppBar(title: const Text('Publish & Share')),
            body: GlowBackdrop(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: content,
              ),
            ),
          );
  }
}
