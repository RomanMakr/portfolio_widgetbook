import 'package:portfolio_widgetbook/widgets/accent_button.dart';

import '../support/test_support.dart';

void main() {
  testWidgets('Enabled accent button invokes its callback once', (
    tester,
  ) async {
    var taps = 0;
    await pumpTestApp(
      tester,
      Center(
        child: AccentButton(
          text: 'Save',
          icon: Icons.save_outlined,
          onPressed: () => taps++,
        ),
      ),
    );
    expect(find.byIcon(Icons.save_outlined), findsOneWidget);
    await tester.tap(find.text('Save'));
    expect(taps, 1);
  });

  testWidgets('Accent button without a callback is disabled', (tester) async {
    await pumpTestApp(tester, const Center(child: AccentButton(text: 'Save')));
    expect(
      tester.widget<ElevatedButton>(find.bySubtype<ElevatedButton>()).onPressed,
      isNull,
    );
    expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    await tester.tap(find.text('Save'));
    await tester.pump();
    expect(tester.takeException(), isNull);
  });
}
