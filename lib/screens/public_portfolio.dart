import 'package:flutter/material.dart';

import '../models/project.dart';
import 'public_portfolio/portfolio_components.dart';

class PublicPortfolioScreen extends StatelessWidget {
  final List<Project> projects;

  const PublicPortfolioScreen({super.key, this.projects = sampleProjects});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final mobile = constraints.maxWidth < 700;
      return PortfolioLayout(
        mobile: mobile,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PortfolioHeader(mobile: mobile),
            SizedBox(height: mobile ? 48 : 85),
            PortfolioHero(mobile: mobile),
            const SizedBox(height: 70),
            const PortfolioDetails(),
            const SizedBox(height: 35),
            PortfolioProjects(mobile: mobile, projects: projects),
            const SizedBox(height: 35),
            const PortfolioContact(),
          ],
        ),
      );
    },
  );
}
