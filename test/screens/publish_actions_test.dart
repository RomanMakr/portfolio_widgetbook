import 'package:flutter/services.dart';
import 'package:portfolio_widgetbook/screens/dashboard/publish_share.dart';

import '../support/test_support.dart';

void main() {
  testWidgets('Copy Link writes the displayed URL to the clipboard', (
    tester,
  ) async {
    String? copied;
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(SystemChannels.platform, (call) async {
      if (call.method == 'Clipboard.setData') {
        copied = (call.arguments as Map)['text'] as String;
      }
      return null;
    });
    addTearDown(
      () => messenger.setMockMethodCallHandler(SystemChannels.platform, null),
    );
    await pumpTestApp(tester, const PublishShareScreen());
    await tester.tap(find.text('Copy Link'));
    await tester.pumpAndSettle();
    expect(copied, 'https://portfolio.example/p/roman');
    expect(find.text('Example link copied.'), findsOneWidget);
  });

  testWidgets('QR control explains that a real portfolio URL is required', (
    tester,
  ) async {
    await pumpTestApp(tester, const PublishShareScreen());
    await tester.tap(find.text('QR Code'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(
      find.text('Publish a real portfolio URL to enable QR code sharing.'),
      findsOneWidget,
    );
    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
  });
}
