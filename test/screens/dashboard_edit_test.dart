import 'package:portfolio_widgetbook/widgets/common.dart';

import '../support/dashboard_helpers.dart';
import '../support/test_support.dart';

Finder healthcareTile() => find.ancestor(
  of: find.text('Healthcare App'),
  matching: find.byType(ProjectTile),
);

void main() {
  testWidgets('Editing replaces a project without increasing its count', (
    tester,
  ) async {
    await pumpProjects(tester);
    await tester.tap(
      find.descendant(of: healthcareTile(), matching: find.byTooltip('Edit')),
    );
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
    expect(find.byType(ProjectTile), findsNWidgets(3));
  });

  testWidgets('Cancelling an edit leaves the original project unchanged', (
    tester,
  ) async {
    await pumpProjects(tester);
    await tester.tap(
      find.descendant(of: healthcareTile(), matching: find.byTooltip('Edit')),
    );
    await tester.pumpAndSettle();
    await tester.enterText(field('Project Title'), 'Unsaved title');
    await tester.tap(find.widgetWithText(TextButton, 'Cancel'));
    await tester.pumpAndSettle();
    expect(find.text('Healthcare App'), findsOneWidget);
    expect(find.text('Unsaved title'), findsNothing);
  });
}
