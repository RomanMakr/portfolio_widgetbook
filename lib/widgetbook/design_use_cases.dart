import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import '../widgets/common.dart';

List<WidgetbookComponent> get designUseCases => [
  WidgetbookComponent(
    name: 'Buttons',
    useCases: [
      WidgetbookUseCase(
        name: 'Primary',
        builder: (_) => const Center(child: AccentButton(text: 'Get Started')),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'Cards',
    useCases: [
      WidgetbookUseCase(
        name: 'Project',
        builder: (_) => const Center(
          child: SizedBox(
            width: 330,
            child: ProjectTile(
              title: 'Healthcare App',
              category: 'Healthcare',
              description: 'A Flutter healthcare project.',
            ),
          ),
        ),
      ),
    ],
  ),
];
