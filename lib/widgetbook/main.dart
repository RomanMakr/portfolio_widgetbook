import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'widgetbook_content.dart';

void main() => runApp(const PortfolioWidgetbook());

class PortfolioWidgetbook extends StatelessWidget {
  const PortfolioWidgetbook({super.key});

  @override
  Widget build(BuildContext context) => Widgetbook.material(
    directories: portfolioDirectories,
    addons: portfolioAddons,
  );
}
