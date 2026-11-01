import 'package:flutter/material.dart';

import '../../design/theme.dart';
import 'auth_social_buttons.dart';

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
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onSubmit,
          child: Text(signUp ? 'Sign Up' : 'Sign In'),
        ),
      ),
      if (!signUp) ...[
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'or continue with',
                style: TextStyle(color: Palette.muted, fontSize: 11),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 12),
        const AuthSocialButtons(),
      ],
      const SizedBox(height: 18),
      TextButton(
        onPressed: onSwitch,
        child: Text(
          signUp ? 'Already have an account? Sign In' : 'New here? Sign Up',
          style: const TextStyle(color: Palette.violet, fontSize: 12),
        ),
      ),
    ],
  );
}
