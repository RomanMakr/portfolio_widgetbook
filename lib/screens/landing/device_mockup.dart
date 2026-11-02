import 'package:flutter/material.dart';

class DeviceMockup extends StatelessWidget {
  const DeviceMockup({super.key});

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 1.35,
    child: Image.asset(
      'assets/images/portfolio_devices.png',
      fit: BoxFit.contain,
      excludeFromSemantics: true,
    ),
  );
}
