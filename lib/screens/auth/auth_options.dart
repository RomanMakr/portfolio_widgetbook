import 'package:flutter/material.dart';

import '../../design/theme.dart';

class AuthOptions extends StatefulWidget {
  final bool signUp;
  const AuthOptions({super.key, required this.signUp});

  @override
  State<AuthOptions> createState() => _AuthOptionsState();
}

class _AuthOptionsState extends State<AuthOptions> {
  bool remember = true;

  @override
  Widget build(BuildContext context) => widget.signUp
      ? FormField<bool>(
          initialValue: false,
          validator: (value) =>
              value == true ? null : 'Please accept the terms to continue',
          builder: (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(value: state.value, onChanged: state.didChange),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: 'I agree to the '),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(color: Palette.violet),
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Palette.violet),
                          ),
                        ],
                      ),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              if (state.hasError)
                Text(
                  state.errorText!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        )
      : Row(
          children: [
            Checkbox(
              value: remember,
              onChanged: (value) => setState(() => remember = value!),
            ),
            const Expanded(
              child: Text('Remember me', style: TextStyle(fontSize: 12)),
            ),
            TextButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password recovery is not connected yet.'),
                ),
              ),
              child: const Text(
                'Forgot password?',
                style: TextStyle(color: Palette.violet, fontSize: 11),
              ),
            ),
          ],
        );
}
