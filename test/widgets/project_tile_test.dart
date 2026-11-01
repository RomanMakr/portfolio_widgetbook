import 'package:portfolio_widgetbook/widgets/project_tile.dart';

import '../support/test_support.dart';

void main() {
  testWidgets('Read-only project tile displays data without editing actions', (
    tester,
  ) async {
    await pumpTestApp(
      tester,
      const Center(
        child: SizedBox(
          width: 350,
          height: 290,
          child: ProjectTile(
            title: 'API',
            category: 'Backend',
            description: 'Go service',
          ),
        ),
      ),
    );
    expect(find.text('API'), findsOneWidget);
    expect(find.text('Backend'), findsOneWidget);
    expect(find.text('Go service'), findsOneWidget);
    expect(find.byType(IconButton), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Project tile invokes edit and delete independently', (
    tester,
  ) async {
    var edits = 0;
    var deletes = 0;
    await pumpTestApp(
      tester,
      Center(
        child: SizedBox(
          width: 350,
          height: 340,
          child: ProjectTile(
            title: 'API',
            category: 'Backend',
            description: 'Go service',
            onEdit: () => edits++,
            onDelete: () => deletes++,
          ),
        ),
      ),
    );
    await tester.tap(find.byTooltip('Edit'));
    expect(edits, 1);
    expect(deletes, 0);
    await tester.tap(find.byTooltip('Delete'));
    expect(edits, 1);
    expect(deletes, 1);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Project tile disables an unavailable action', (tester) async {
    await pumpTestApp(
      tester,
      Center(
        child: SizedBox(
          width: 350,
          height: 340,
          child: ProjectTile(
            title: 'API',
            category: 'Backend',
            description: 'Go service',
            onEdit: () {},
          ),
        ),
      ),
    );
    final delete = find.byWidgetPredicate(
      (widget) => widget is IconButton && widget.tooltip == 'Delete',
    );
    expect(tester.widget<IconButton>(delete).onPressed, isNull);
    expect(tester.takeException(), isNull);
  });
}
