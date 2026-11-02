import '../support/dashboard_helpers.dart';
import '../support/test_support.dart';

void main() {
  testWidgets('Editing replaces a project without increasing its count', (
    tester,
  ) async {
    await pumpProjects(tester);
    await tester.tap(find.byTooltip('Edit').first);
    await tester.pumpAndSettle();
    expect(
      tester.widget<TextField>(field('Project Title')).controller!.text,
      'Healthcare App',
    );
    expect(
      tester.widget<TextField>(field('Category')).controller!.text,
      'Healthcare',
    );
    await tester.enterText(field('Project Title'), 'Updated Healthcare');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Save'));
    await tester.pumpAndSettle();
    expect(find.text('Healthcare App'), findsNothing);
    expect(find.text('Updated Healthcare'), findsOneWidget);
    expect(find.text('Published'), findsNWidgets(2));
    expect(tester.widget<DataTable>(find.byType(DataTable)).rows.length, 3);
  });

  testWidgets('Cancelling an edit leaves the original project unchanged', (
    tester,
  ) async {
    await pumpProjects(tester);
    await tester.tap(find.byTooltip('Edit').first);
    await tester.pumpAndSettle();
    await tester.enterText(field('Project Title'), 'Unsaved title');
    await tester.tap(find.widgetWithText(TextButton, 'Cancel'));
    await tester.pumpAndSettle();
    expect(find.text('Healthcare App'), findsOneWidget);
    expect(find.text('Unsaved title'), findsNothing);
  });
}
