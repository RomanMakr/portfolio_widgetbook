import 'package:portfolio_widgetbook/screens/public_portfolio.dart';

import '../support/portfolio_fixtures.dart';
import '../support/test_support.dart';

void main() {
  for (final mobile in [false, true]) {
    testWidgets('Public portfolio shows supplied projects, mobile=$mobile', (
      tester,
    ) async {
      await pumpTestApp(
        tester,
        const PublicPortfolioScreen(projects: portfolioProjects),
        size: mobile ? const Size(390, 844) : const Size(1440, 1000),
      );
      expect(find.text('Roman Makaryan'), findsOneWidget);
      expect(
        find.byType(NavigationBar),
        mobile ? findsOneWidget : findsNothing,
      );
      await tester.ensureVisible(find.text('Featured Projects'));
      await tester.pumpAndSettle();
      expect(find.text('Backend API'), findsOneWidget);
      expect(find.text('Backend'), findsOneWidget);
      expect(find.text('Healthcare App'), findsNothing);
      expect(find.byTooltip('Edit'), findsNothing);
      expect(find.byTooltip('Delete'), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('Empty portfolio still allows entering a contact message', (
    tester,
  ) async {
    await pumpTestApp(tester, const PublicPortfolioScreen(projects: []));
    await tester.ensureVisible(field('Your Message'));
    await tester.enterText(field('Your Email'), 'client@example.com');
    await tester.enterText(field('Your Message'), 'Let’s build an app.');
    expect(
      tester.widget<TextField>(field('Your Email')).controller!.text,
      'client@example.com',
    );
    expect(
      tester.widget<TextField>(field('Your Message')).controller!.text,
      'Let’s build an app.',
    );
    expect(find.text('Featured Projects'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
