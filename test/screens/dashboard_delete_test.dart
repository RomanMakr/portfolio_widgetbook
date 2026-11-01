import 'package:portfolio_widgetbook/widgets/common.dart';

import '../support/dashboard_helpers.dart';
import '../support/test_support.dart';

Future<void> deleteHealthcare(WidgetTester tester) async {
  final tile = find.ancestor(
    of: find.text('Healthcare App'),
    matching: find.byType(ProjectTile),
  );
  await tester.tap(
    find.descendant(of: tile, matching: find.byTooltip('Delete')),
  );
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
    expect(find.byType(ProjectTile), findsNWidgets(2));
    await tester.tap(find.widgetWithText(ListTile, 'Dashboard'));
    await tester.pumpAndSettle();
    expect(find.text('2'), findsOneWidget);
  });
}
