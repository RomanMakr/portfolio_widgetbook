import 'package:portfolio_widgetbook/screens/screens.dart';

import '../support/test_support.dart';

void main() {
  for (final width in [700.0, 800.0, 1100.0]) {
    testWidgets('Landing fits the $width breakpoint', (tester) async {
      await pumpTestApp(tester, const LandingScreen(), size: Size(width, 1000));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
    testWidgets('Portfolio fits the $width breakpoint', (tester) async {
      await pumpTestApp(
        tester,
        const PublicPortfolioScreen(projects: []),
        size: Size(width, 1000),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
    testWidgets('Dashboard fits the $width breakpoint', (tester) async {
      await pumpTestApp(
        tester,
        const DashboardScreen(),
        size: Size(width, 1000),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  }
}
