import 'package:flutter/material.dart';

import 'password_field.dart';
import 'auth_options.dart';

class AuthFields extends StatefulWidget {
  final bool signUp;
  const AuthFields({super.key, required this.signUp});

  @override
  State<AuthFields> createState() => _AuthFieldsState();
}

class _AuthFieldsState extends State<AuthFields> {
  final password = TextEditingController();
  final confirmation = TextEditingController();

  @override
  void dispose() {
    password.dispose();
    confirmation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (widget.signUp) ...[
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Full Name',
            prefixIcon: Icon(Icons.person_outline, size: 19),
          ),
          validator: (v) =>
              (v?.trim().isEmpty ?? true) ? 'Enter your name' : null,
        ),
        const SizedBox(height: 14),
      ],
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Icons.email_outlined, size: 19),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (v) =>
            (v?.contains('@') ?? false) ? null : 'Enter a valid email',
      ),
      const SizedBox(height: 14),
      PasswordField(
        label: 'Password',
        controller: password,
        validator: (v) =>
            (v?.length ?? 0) >= 6 ? null : 'At least 6 characters',
      ),
      if (widget.signUp) ...[
        const SizedBox(height: 14),
        PasswordField(
          label: 'Confirm Password',
          controller: confirmation,
          validator: (v) => v == password.text && (v?.isNotEmpty ?? false)
              ? null
              : 'Passwords must match',
        ),
      ],
      const SizedBox(height: 8),
      AuthOptions(key: ValueKey(widget.signUp), signUp: widget.signUp),
    ],
  );
}
