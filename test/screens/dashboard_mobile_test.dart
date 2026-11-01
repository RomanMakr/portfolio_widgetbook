import 'package:portfolio_widgetbook/screens/dashboard.dart';

import '../support/test_support.dart';

void main() {
  testWidgets('Mobile dashboard navigates between projects and sharing', (
    tester,
  ) async {
    await pumpTestApp(
      tester,
      const DashboardScreen(),
      size: const Size(600, 1000),
    );
    expect(find.byType(NavigationBar), findsOneWidget);
    await tester.tap(
      find.descendant(
        of: find.byType(NavigationBar),
        matching: find.text('Projects'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Projects Management (CRUD)'), findsOneWidget);
    expect(
      tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
      1,
    );
    await tester.tap(
      find.descendant(
        of: find.byType(NavigationBar),
        matching: find.text('Share'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Publish Portfolio'), findsOneWidget);
    expect(
      tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
      2,
    );
  });
}
