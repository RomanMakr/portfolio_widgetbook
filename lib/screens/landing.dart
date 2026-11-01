import 'package:flutter/material.dart';

import '../widgets/common.dart';
import 'landing/landing_components.dart';

class LandingScreen extends StatelessWidget {
  final VoidCallback? onSignIn, onSignUp, onDemo;

  const LandingScreen({super.key, this.onSignIn, this.onSignUp, this.onDemo});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final mobile = constraints.maxWidth < 700;
      return Scaffold(
        body: GlowBackdrop(
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1440),
                child: Padding(
                  padding: EdgeInsets.all(mobile ? 20 : 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LandingHeader(
                        mobile: mobile,
                        onSignIn: onSignIn,
                        onSignUp: onSignUp,
                      ),
                      SizedBox(height: mobile ? 42 : 64),
                      LandingHero(
                        mobile: constraints.maxWidth < 1000,
                        onSignUp: onSignUp,
                        onDemo: onDemo,
                      ),
                      if (constraints.maxWidth < 1050) ...[
                        const SizedBox(height: 60),
                        const LandingFeatures(),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
