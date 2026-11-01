import 'package:portfolio_widgetbook/screens/dashboard/publish_share.dart';

import '../support/test_support.dart';

void main() {
  for (final embedded in [false, true]) {
    testWidgets('Publish toggle changes visibility, embedded=$embedded', (
      tester,
    ) async {
      await pumpTestApp(tester, PublishShareScreen(embedded: embedded));
      expect(find.byType(AppBar), embedded ? findsNothing : findsOneWidget);
      expect(
        find.text('Your portfolio is public (demo state)'),
        findsOneWidget,
      );
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();
      expect(find.text('Your portfolio is private'), findsOneWidget);
      expect(
        tester.widget<SwitchListTile>(find.byType(SwitchListTile)).value,
        isFalse,
      );
      expect(find.text('https://portfolio.example/p/roman'), findsOneWidget);
      await tester.tap(find.byType(Switch));
      await tester.pumpAndSettle();
      expect(
        find.text('Your portfolio is public (demo state)'),
        findsOneWidget,
      );
    });
  }
}
