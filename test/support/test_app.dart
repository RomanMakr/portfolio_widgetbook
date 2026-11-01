import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio_widgetbook/design/theme.dart';

Future<void> pumpTestApp(
  WidgetTester tester,
  Widget child, {
  Size size = const Size(1440, 1000),
}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  await tester.pumpWidget(
    MaterialApp(
      theme: portfolioTheme(),
      home: Scaffold(body: child),
    ),
  );
}

Finder field(String label) => find.byWidgetPredicate(
  (widget) => widget is TextField && widget.decoration?.labelText == label,
);
