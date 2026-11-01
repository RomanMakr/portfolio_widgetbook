import '../support/dashboard_helpers.dart';
import '../support/test_support.dart';

void main() {
  testWidgets('Adding a project trims input and preserves existing projects', (
    tester,
  ) async {
    await pumpProjects(tester);
    await openProjectEditor(tester);
    await tester.enterText(field('Project Title'), '  New API  ');
    await tester.enterText(field('Category'), '  Backend  ');
    await tester.enterText(field('Description'), '  Reliable service  ');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Save'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
    await tester.ensureVisible(find.text('New API'));
    expect(find.text('Backend'), findsOneWidget);
    expect(find.text('Reliable service'), findsOneWidget);
    expect(find.text('Healthcare App'), findsOneWidget);
    await tester.tap(find.widgetWithText(ListTile, 'Dashboard'));
    await tester.pumpAndSettle();
    expect(find.text('4'), findsOneWidget);
  });

  testWidgets('Blank project title keeps the editor open without saving', (
    tester,
  ) async {
    await pumpProjects(tester);
    await openProjectEditor(tester);
    await tester.enterText(field('Project Title'), '   ');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Save'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.tap(find.widgetWithText(TextButton, 'Cancel'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ListTile, 'Dashboard'));
    await tester.pumpAndSettle();
    expect(find.text('3'), findsNWidgets(2));
  });
}
