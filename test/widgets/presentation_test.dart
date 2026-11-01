import 'package:portfolio_widgetbook/widgets/common.dart';

import '../support/test_support.dart';

void main() {
  testWidgets('Logo supports default and custom initials', (tester) async {
    await pumpTestApp(
      tester,
      const Row(
        children: [
          Logo(),
          Logo(initials: 'RM'),
        ],
      ),
    );
    expect(find.text('PB'), findsOneWidget);
    expect(find.text('RM'), findsOneWidget);
  });

  testWidgets('Section heading shows the supplied section name', (
    tester,
  ) async {
    await pumpTestApp(tester, const SectionHeading('Experience'));
    expect(find.text('Experience'), findsOneWidget);
  });

  testWidgets('Panel and backdrop preserve child interaction', (tester) async {
    var taps = 0;
    await pumpTestApp(
      tester,
      GlowBackdrop(
        child: Center(
          child: Panel(
            padding: const EdgeInsets.all(30),
            child: TextButton(
              onPressed: () => taps++,
              child: const Text('Continue'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Continue'));
    expect(taps, 1);
    expect(tester.takeException(), isNull);
  });
}
