import 'package:widgetbook/widgetbook.dart';

import 'design_use_cases.dart';
import 'screen_use_cases.dart';

List<WidgetbookNode> get portfolioDirectories => [
  WidgetbookFolder(name: 'Screens', children: screenUseCases),
  WidgetbookFolder(name: 'Design System', children: designUseCases),
];
