import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';

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
        constraints: const BoxConstraints(maxWidth: 700),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading('Publish & Share'),
            Panel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Publish Portfolio'),
                    subtitle: Text(
                      published
                          ? 'Your portfolio is public (demo state)'
                          : 'Your portfolio is private',
                    ),
                    value: published,
                    onChanged: (v) => setState(() => published = v),
                  ),
                  const SizedBox(height: 16),
                  const Text('Your Portfolio Link'),
                  const SizedBox(height: 10),
                  const SelectableText(
                    'https://portfolio.example/p/roman',
                    style: TextStyle(color: Palette.violet),
                  ),
                  const SizedBox(height: 20),
                  const Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      Chip(label: Text('Copy Link • demo')),
                      Chip(label: Text('QR Code • planned')),
                      Chip(label: Text('Native Share • planned')),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This is an example URL, not a deployed portfolio.',
                    style: TextStyle(color: Palette.muted, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
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
