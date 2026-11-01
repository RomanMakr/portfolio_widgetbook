import 'package:flutter/material.dart';

import '../../widgets/common.dart';

class LandingHeader extends StatelessWidget {
  final bool mobile;
  final VoidCallback? onSignIn, onSignUp;
  const LandingHeader({
    super.key,
    required this.mobile,
    this.onSignIn,
    this.onSignUp,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      LayoutBuilder(
        builder: (context, c) => Row(
          children: [
            const Logo(),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'Portfolio Builder',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            if (c.maxWidth > 1050) ...[
              const Text(
                'Home       Features       Preview       Templates       Pricing',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 50),
            ],
            TextButton(
              onPressed: onSignIn,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF81758F)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Sign In'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: onSignUp, child: const Text('Sign Up')),
          ],
        ),
      ),
      const SizedBox(height: 18),
      const Divider(height: 1),
    ],
  );
}
