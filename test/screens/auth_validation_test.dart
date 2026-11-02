import 'package:portfolio_widgetbook/screens/auth.dart';

import '../support/test_support.dart';

void main() {
  testWidgets('Sign-in rejects invalid input without submitting', (
    tester,
  ) async {
    var submitted = false;
    await pumpTestApp(tester, AuthScreen(onSubmit: () => submitted = true));
    await tester.enterText(field('Email'), 'invalid');
    await tester.enterText(field('Password'), '12345');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign In'));
    await tester.pumpAndSettle();
    expect(find.text('Enter a valid email'), findsOneWidget);
    expect(find.text('At least 6 characters'), findsOneWidget);
    expect(submitted, isFalse);
  });

  testWidgets('Sign-up requires a nonblank name before submitting', (
    tester,
  ) async {
    var submissions = 0;
    await pumpTestApp(
      tester,
      AuthScreen(signUp: true, onSubmit: () => submissions++),
    );
    await tester.enterText(field('Full Name'), '   ');
    await tester.enterText(field('Email'), 'roman@example.com');
    await tester.enterText(field('Password'), '123456');
    await tester.enterText(field('Confirm Password'), '123456');
    await tester.tap(find.byType(Checkbox));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
    await tester.pumpAndSettle();
    expect(find.text('Enter your name'), findsOneWidget);
    expect(submissions, 0);

    await tester.enterText(field('Full Name'), 'Roman');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
    await tester.pumpAndSettle();
    expect(find.text('Enter your name'), findsNothing);
    expect(submissions, 1);
  });
}
