import 'package:flutter/material.dart';

class AuthSocialButtons extends StatelessWidget {
  const AuthSocialButtons({super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: ['Google', 'GitHub']
        .map(
          (provider) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$provider sign-in is not connected yet.'),
                  ),
                ),
                icon: provider == 'Google'
                    ? const Text(
                        'G',
                        style: TextStyle(
                          color: Color(0xFF69B4FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      )
                    : const Icon(Icons.code, size: 19),
                label: Text(provider, style: const TextStyle(fontSize: 12)),
              ),
            ),
          ),
        )
        .toList(),
  );
}
