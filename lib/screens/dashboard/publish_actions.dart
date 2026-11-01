import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PublishActions extends StatelessWidget {
  const PublishActions({super.key});

  Future<void> activate(BuildContext context, String action) async {
    if (action == 'QR Code') {
      await showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('QR Code'),
          content: const Text(
            'Publish a real portfolio URL to enable QR code sharing.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        ),
      );
      return;
    }
    await Clipboard.setData(
      const ClipboardData(text: 'https://portfolio.example/p/roman'),
    );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            action == 'Share'
                ? 'Example link copied. You can paste it to share.'
                : 'Example link copied.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Row(
    children: ['Copy Link', 'QR Code', 'Share']
        .map(
          (label) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: OutlinedButton(
                onPressed: () => activate(context, label),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      label == 'Copy Link'
                          ? Icons.link
                          : label == 'QR Code'
                          ? Icons.qr_code
                          : Icons.ios_share,
                      size: 26,
                    ),
                    const SizedBox(height: 10),
                    Text(label, style: const TextStyle(fontSize: 11)),
                  ],
                ),
              ),
            ),
          ),
        )
        .toList(),
  );
}
