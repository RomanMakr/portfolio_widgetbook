import 'package:flutter/material.dart';

class AuthFields extends StatefulWidget {
  final bool signUp;

  const AuthFields({super.key, required this.signUp});

  @override
  State<AuthFields> createState() => _AuthFieldsState();
}

class _AuthFieldsState extends State<AuthFields> {
  bool visible = false;

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (widget.signUp) ...[
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Full Name',
            prefixIcon: Icon(Icons.person_outline),
          ),
          validator: (v) =>
              (v?.trim().isEmpty ?? true) ? 'Enter your name' : null,
        ),
        const SizedBox(height: 12),
      ],
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Icons.email_outlined),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (v) =>
            (v?.contains('@') ?? false) ? null : 'Enter a valid email',
      ),
      const SizedBox(height: 12),
      TextFormField(
        obscureText: !visible,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            onPressed: () => setState(() => visible = !visible),
            icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
          ),
        ),
        validator: (v) =>
            (v?.length ?? 0) >= 6 ? null : 'At least 6 characters',
      ),
    ],
  );
}
