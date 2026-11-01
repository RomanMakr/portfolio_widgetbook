import 'package:flutter/material.dart';

import '../widgets/common.dart';
import 'auth/auth_form.dart';

class AuthScreen extends StatelessWidget {
  final bool signUp;
  final VoidCallback? onSubmit, onSwitch;

  const AuthScreen({
    super.key,
    this.signUp = false,
    this.onSubmit,
    this.onSwitch,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    body: GlowBackdrop(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Panel(
              padding: const EdgeInsets.all(30),
              child: AuthForm(
                signUp: signUp,
                onSubmit: onSubmit,
                onSwitch: onSwitch,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
