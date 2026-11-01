import 'package:flutter/material.dart';

import 'design/theme.dart';
import 'screens/screens.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});
  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  String route = 'landing';
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Portfolio Builder',
    theme: portfolioTheme(),
    home: switch (route) {
      'signIn' => AuthScreen(
        onSubmit: () => setState(() => route = 'dashboard'),
        onSwitch: () => setState(() => route = 'signUp'),
      ),
      'signUp' => AuthScreen(
        signUp: true,
        onSubmit: () => setState(() => route = 'dashboard'),
        onSwitch: () => setState(() => route = 'signIn'),
      ),
      'portfolio' => const PublicPortfolioScreen(),
      'dashboard' => const DashboardScreen(),
      'share' => const PublishShareScreen(),
      _ => LandingScreen(
        onSignIn: () => setState(() => route = 'signIn'),
        onSignUp: () => setState(() => route = 'signUp'),
        onDemo: () => setState(() => route = 'portfolio'),
      ),
    },
  );
}
