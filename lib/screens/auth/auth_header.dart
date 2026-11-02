import 'package:flutter/material.dart';

import '../../design/theme.dart';
import '../../widgets/common.dart';

class AuthHeader extends StatelessWidget {
  final bool signUp;
  const AuthHeader({super.key, required this.signUp});

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Logo(),
      const SizedBox(height: 18),
      Text(
        signUp ? 'Create Account' : 'Sign In',
        style: Theme.of(
          context,
        ).textTheme.headlineMedium?.copyWith(fontSize: 26),
      ),
      const SizedBox(height: 8),
      Text(
        signUp
            ? 'Start building your portfolio'
            : 'Access your portfolio builder account',
        textAlign: TextAlign.center,
        style: const TextStyle(color: Palette.muted, fontSize: 12),
      ),
    ],
  );
}
