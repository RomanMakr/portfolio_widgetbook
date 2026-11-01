import 'package:flutter/material.dart';

import 'auth_content.dart';
import 'auth_fields.dart';

class AuthForm extends StatefulWidget {
  final bool signUp;
  final VoidCallback? onSubmit, onSwitch;

  const AuthForm({
    super.key,
    required this.signUp,
    this.onSubmit,
    this.onSwitch,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Form(
    key: keyForm,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AuthHeader(signUp: widget.signUp),
        const SizedBox(height: 30),
        AuthFields(signUp: widget.signUp),
        const SizedBox(height: 14),
        AuthFooter(
          signUp: widget.signUp,
          onSubmit: () {
            if (keyForm.currentState!.validate()) {
              widget.onSubmit?.call();
            }
          },
          onSwitch: widget.onSwitch,
        ),
      ],
    ),
  );
}
