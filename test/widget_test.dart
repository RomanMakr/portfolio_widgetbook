import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio_widgetbook/main.dart';

Future<void> pumpPortfolio(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1440, 1000);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  await tester.pumpWidget(const PortfolioApp());
}

void main() {
  testWidgets('Sign-in validates input before opening the dashboard', (
    tester,
  ) async {
    await pumpPortfolio(tester);
    expect(find.text('Portfolio Builder'), findsOneWidget);
    await tester.tap(find.widgetWithText(TextButton, 'Sign In'));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign In'));
    await tester.pumpAndSettle();
    expect(find.text('Enter a valid email'), findsOneWidget);
    expect(find.text('At least 6 characters'), findsOneWidget);
    expect(find.text('Portfolio Admin'), findsNothing);

    await tester.enterText(
      find.byType(TextFormField).at(0),
      'roman@example.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign In'));
    await tester.pumpAndSettle();
    expect(find.text('Portfolio Admin'), findsOneWidget);
    expect(find.text('Quick Actions'), findsOneWidget);
  });

  testWidgets('Sign-up can switch to sign-in', (tester) async {
    await pumpPortfolio(tester);
    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign Up'));
    await tester.pumpAndSettle();
    expect(find.text('Create Account'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(4));

    await tester.tap(find.text('Already have an account? Sign In'));
    await tester.pumpAndSettle();
    expect(find.text('Access your portfolio builder account'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
  });

  testWidgets('View Demo opens the public portfolio', (tester) async {
    await pumpPortfolio(tester);
    await tester.tap(find.widgetWithText(OutlinedButton, 'View Demo'));
    await tester.pumpAndSettle();
    expect(find.text('Roman Makaryan'), findsOneWidget);
    expect(find.text('Featured Projects'), findsOneWidget);
    expect(find.text('Portfolio Builder'), findsNothing);
  });
}
