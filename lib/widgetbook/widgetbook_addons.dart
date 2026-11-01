import 'package:widgetbook/widgetbook.dart';

import '../design/theme.dart';

List<WidgetbookAddon> get portfolioAddons => [
  MaterialThemeAddon(
    themes: [WidgetbookTheme(name: 'Dark Purple', data: portfolioTheme())],
  ),
  ViewportAddon([LinuxViewports.desktop, AndroidViewports.samsungGalaxyA50]),
];
