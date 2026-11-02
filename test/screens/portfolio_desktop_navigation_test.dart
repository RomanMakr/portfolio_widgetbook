import 'package:portfolio_widgetbook/screens/public_portfolio.dart';
import 'package:portfolio_widgetbook/widgets/common.dart';

import '../support/test_support.dart';

void main() {
  for (final entry in {
    'About': 'About Me',
    'Experience': 'Experience',
    'Projects': 'Featured Projects',
    'Contact': 'Contact',
  }.entries) {
    testWidgets('Desktop ${entry.key} button reaches its section', (
      tester,
    ) async {
      await pumpTestApp(tester, const PublicPortfolioScreen());
      await tester.tap(find.widgetWithText(TextButton, entry.key));
      await tester.pumpAndSettle();
      final bounds = tester.getRect(
        find.widgetWithText(SectionHeading, entry.value),
      );
      expect(bounds.top, greaterThanOrEqualTo(-1));
      expect(bounds.bottom, lessThanOrEqualTo(1000));
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('Portfolio section cards navigate to their targets', (
    tester,
  ) async {
    await pumpTestApp(
      tester,
      const PublicPortfolioScreen(),
      size: const Size(390, 844),
    );
    final card = find.text('Selected work and case studies');
    await tester.ensureVisible(card);
    await tester.tap(card);
    await tester.pumpAndSettle();
    final heading = tester.getRect(
      find.widgetWithText(SectionHeading, 'Featured Projects'),
    );
    expect(heading.top, greaterThanOrEqualTo(-1));
    expect(
      heading.bottom,
      lessThan(tester.getTopLeft(find.byType(NavigationBar)).dy),
    );
    expect(
      tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
      2,
    );
  });
}
