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
      const SizedBox(height: 20),
      Text(
        signUp ? 'Create Account' : 'Sign In',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      const SizedBox(height: 8),
      Text(
        signUp
            ? 'Start building your portfolio'
            : 'Access your portfolio builder account',
        style: const TextStyle(color: Palette.muted),
      ),
    ],
  );
}

class AuthFooter extends StatelessWidget {
  final bool signUp;
  final VoidCallback? onSubmit, onSwitch;

  const AuthFooter({
    super.key,
    required this.signUp,
    this.onSubmit,
    this.onSwitch,
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (!signUp)
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forgot password?',
            style: TextStyle(color: Palette.violet),
          ),
        ),
      const SizedBox(height: 20),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onSubmit,
          child: Text(signUp ? 'Sign Up' : 'Sign In'),
        ),
      ),
      const SizedBox(height: 16),
      const Text(
        'Authentication UI demo • Firebase not connected',
        style: TextStyle(fontSize: 11, color: Palette.muted),
      ),
      const SizedBox(height: 16),
      TextButton(
        onPressed: onSwitch,
        child: Text(
          signUp ? 'Already have an account? Sign In' : 'New here? Sign Up',
        ),
      ),
    ],
  );
}
