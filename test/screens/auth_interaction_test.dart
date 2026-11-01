import 'package:portfolio_widgetbook/screens/auth.dart';

import '../support/test_support.dart';

void main() {
  testWidgets('Password visibility toggles without losing the value', (
    tester,
  ) async {
    await pumpTestApp(tester, const AuthScreen());
    await tester.enterText(field('Password'), 'private-password');
    expect(tester.widget<TextField>(field('Password')).obscureText, isTrue);
    await tester.tap(find.byIcon(Icons.visibility_off));
    await tester.pump();
    expect(tester.widget<TextField>(field('Password')).obscureText, isFalse);
    expect(
      tester.widget<TextField>(field('Password')).controller!.text,
      'private-password',
    );
    await tester.tap(find.byIcon(Icons.visibility));
    await tester.pump();
    expect(tester.widget<TextField>(field('Password')).obscureText, isTrue);
  });

  for (final signUp in [false, true]) {
    testWidgets('Auth mode $signUp calls the switch callback', (tester) async {
      var switched = false;
      await pumpTestApp(
        tester,
        AuthScreen(signUp: signUp, onSwitch: () => switched = true),
      );
      await tester.tap(
        find.widgetWithText(
          TextButton,
          signUp ? 'Already have an account? Sign In' : 'New here? Sign Up',
        ),
      );
      expect(switched, isTrue);
    });
  }
}
