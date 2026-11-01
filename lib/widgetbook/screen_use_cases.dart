import 'package:widgetbook/widgetbook.dart';

import '../screens/screens.dart';

List<WidgetbookComponent> get screenUseCases => [
  WidgetbookComponent(
    name: 'Introduction',
    useCases: [
      WidgetbookUseCase(name: 'Landing', builder: (_) => const LandingScreen()),
    ],
  ),
  WidgetbookComponent(
    name: 'Authentication',
    useCases: [
      WidgetbookUseCase(name: 'Sign In', builder: (_) => const AuthScreen()),
      WidgetbookUseCase(
        name: 'Sign Up',
        builder: (_) => const AuthScreen(signUp: true),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'Public Portfolio',
    useCases: [
      WidgetbookUseCase(
        name: 'Home & Sections',
        builder: (_) => const PublicPortfolioScreen(),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'Admin Dashboard',
    useCases: [
      WidgetbookUseCase(
        name: 'Dashboard & CRUD',
        builder: (_) => const DashboardScreen(),
      ),
    ],
  ),
  WidgetbookComponent(
    name: 'Publish & Share',
    useCases: [
      WidgetbookUseCase(
        name: 'Share',
        builder: (_) => const PublishShareScreen(),
      ),
    ],
  ),
];
