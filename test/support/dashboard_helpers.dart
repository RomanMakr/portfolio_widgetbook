import 'package:portfolio_widgetbook/screens/dashboard.dart';

import 'test_support.dart';

Future<void> pumpProjects(WidgetTester tester) async {
  await pumpTestApp(tester, const DashboardScreen());
  await tester.tap(find.widgetWithText(ListTile, 'Projects'));
  await tester.pumpAndSettle();
}

Future<void> openProjectEditor(WidgetTester tester) async {
  await tester.tap(find.text('Add Project'));
  await tester.pumpAndSettle();
}
