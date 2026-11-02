import 'package:portfolio_widgetbook/screens/public_portfolio.dart';
import 'package:portfolio_widgetbook/widgets/common.dart';

import '../support/test_support.dart';

void expectVisible(WidgetTester tester, Finder target) {
  final viewportBottom = tester.getTopLeft(find.byType(NavigationBar)).dy;
  final bounds = tester.getRect(target);
  expect(bounds.top, greaterThanOrEqualTo(-1));
  expect(bounds.bottom, lessThanOrEqualTo(viewportBottom));
}

Future<void> navigate(WidgetTester tester, String label) async {
  await tester.tap(
    find.descendant(of: find.byType(NavigationBar), matching: find.text(label)),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Mobile navigation scrolls to each section and returns home', (
    tester,
  ) async {
    await pumpTestApp(
      tester,
      const PublicPortfolioScreen(),
      size: const Size(390, 844),
    );
    for (final entry in {
      'About': 'About Me',
      'Projects': 'Featured Projects',
      'Contact': 'Contact',
    }.entries) {
      await navigate(tester, entry.key);
      expectVisible(tester, find.widgetWithText(SectionHeading, entry.value));
      final expected = [
        'Home',
        'About',
        'Projects',
        'Contact',
      ].indexOf(entry.key);
      expect(
        tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
        expected,
      );
    }
    await navigate(tester, 'Home');
    expectVisible(tester, find.text('Roman Makaryan'));
    expect(
      tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
      0,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('Contact Me scrolls to the editable contact form', (
    tester,
  ) async {
    await pumpTestApp(
      tester,
      const PublicPortfolioScreen(),
      size: const Size(390, 844),
    );
    await tester.tap(find.text('Contact Me'));
    await tester.pumpAndSettle();
    expectVisible(tester, field('Your Message'));
    await tester.enterText(field('Your Email'), 'client@example.com');
    expect(
      tester.widget<TextField>(field('Your Email')).controller!.text,
      'client@example.com',
    );
    expect(
      tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
      3,
    );
  });

  testWidgets('Manual scrolling updates the selected mobile destination', (
    tester,
  ) async {
    await pumpTestApp(
      tester,
      const PublicPortfolioScreen(),
      size: const Size(390, 844),
    );
    await tester.dragFrom(const Offset(100, 200), const Offset(0, -6000));
    await tester.pumpAndSettle();
    expect(
      tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
      3,
    );
    await navigate(tester, 'Home');
    expect(
      tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
      0,
    );
  });
}
