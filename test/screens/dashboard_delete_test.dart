import '../support/dashboard_helpers.dart';
import '../support/test_support.dart';

Future<void> deleteHealthcare(WidgetTester tester) async {
  await tester.tap(find.byTooltip('Delete').first);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Deleting requires confirmation and updates the project count', (
    tester,
  ) async {
    await pumpProjects(tester);
    await deleteHealthcare(tester);
    expect(find.text('Delete Healthcare App?'), findsOneWidget);
    await tester.tap(find.widgetWithText(TextButton, 'Cancel'));
    await tester.pumpAndSettle();
    expect(find.text('Healthcare App'), findsOneWidget);

    await deleteHealthcare(tester);
    await tester.tap(find.widgetWithText(TextButton, 'Delete'));
    await tester.pumpAndSettle();
    expect(find.text('Healthcare App'), findsNothing);
    expect(tester.widget<DataTable>(find.byType(DataTable)).rows.length, 2);
    await tester.tap(find.widgetWithText(ListTile, 'Dashboard'));
    await tester.pumpAndSettle();
    expect(find.text('2'), findsOneWidget);
  });
}
