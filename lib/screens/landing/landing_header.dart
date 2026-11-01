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
  Widget build(BuildContext context) => Row(
    children: [
      const Logo(),
      const SizedBox(width: 12),
      const Expanded(
        child: Text(
          'Portfolio Builder',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
      ),
      if (!mobile) ...[
        const Text('Home     Features     Preview     Templates'),
        const SizedBox(width: 25),
      ],
      TextButton(onPressed: onSignIn, child: const Text('Sign In')),
      const SizedBox(width: 8),
      ElevatedButton(onPressed: onSignUp, child: const Text('Sign Up')),
    ],
  );
}
