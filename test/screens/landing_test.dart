import 'package:portfolio_widgetbook/screens/landing.dart';

import '../support/test_support.dart';

void main() {
  testWidgets('Landing actions call the corresponding callbacks', (
    tester,
  ) async {
    var signIns = 0;
    var signUps = 0;
    var demos = 0;
    await pumpTestApp(
      tester,
      LandingScreen(
        onSignIn: () => signIns++,
        onSignUp: () => signUps++,
        onDemo: () => demos++,
      ),
    );
    await tester.tap(find.widgetWithText(TextButton, 'Sign In'));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
    await tester.tap(find.text('Get Started'));
    await tester.tap(find.widgetWithText(OutlinedButton, 'View Demo'));
    expect(signIns, 1);
    expect(signUps, 2);
    expect(demos, 1);
  });

  testWidgets('Mobile landing keeps actions usable without desktop links', (
    tester,
  ) async {
    var demos = 0;
    await pumpTestApp(
      tester,
      LandingScreen(onDemo: () => demos++),
      size: const Size(390, 844),
    );
    expect(
      find.text('Home     Features     Preview     Templates'),
      findsNothing,
    );
    final demo = find.widgetWithText(OutlinedButton, 'View Demo');
    await tester.ensureVisible(demo);
    await tester.tap(demo);
    expect(demos, 1);
    await tester.ensureVisible(find.text('Everything you need'));
    expect(find.text('About Me'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
