import 'package:portfolio_widgetbook/screens/auth.dart';

import '../support/test_support.dart';

void main() {
  testWidgets('Sign-up requires matching passwords and consent', (
    tester,
  ) async {
    var submissions = 0;
    await pumpTestApp(
      tester,
      AuthScreen(signUp: true, onSubmit: () => submissions++),
    );
    await tester.enterText(field('Full Name'), 'Roman');
    await tester.enterText(field('Email'), 'roman@example.com');
    await tester.enterText(field('Password'), 'secret123');
    await tester.enterText(field('Confirm Password'), 'different');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
    await tester.pumpAndSettle();
    expect(find.text('Passwords must match'), findsOneWidget);
    expect(find.text('Please accept the terms to continue'), findsOneWidget);
    expect(submissions, 0);
    await tester.enterText(field('Confirm Password'), 'secret123');
    await tester.tap(find.byType(Checkbox));
    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
    await tester.pumpAndSettle();
    expect(submissions, 1);
  });
}
