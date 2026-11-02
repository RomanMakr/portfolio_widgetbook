import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  const PasswordField({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool visible = false;

  @override
  Widget build(BuildContext context) => TextFormField(
    controller: widget.controller,
    obscureText: !visible,
    decoration: InputDecoration(
      labelText: widget.label,
      prefixIcon: const Icon(Icons.lock_outline, size: 19),
      suffixIcon: IconButton(
        tooltip: visible ? 'Hide password' : 'Show password',
        onPressed: () => setState(() => visible = !visible),
        icon: Icon(visible ? Icons.visibility : Icons.visibility_off, size: 18),
      ),
    ),
    validator: widget.validator,
  );
}
