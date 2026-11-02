import 'package:flutter/material.dart';

import '../models/project.dart';
import 'public_portfolio/portfolio_components.dart';

class PublicPortfolioScreen extends StatefulWidget {
  final List<Project> projects;
  const PublicPortfolioScreen({super.key, this.projects = sampleProjects});

  @override
  State<PublicPortfolioScreen> createState() => _PublicPortfolioScreenState();
}

class _PublicPortfolioScreenState extends State<PublicPortfolioScreen> {
  final navigation = PortfolioController();

  @override
  void dispose() {
    navigation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PortfolioScope(
    controller: navigation,
    child: LayoutBuilder(
      builder: (context, constraints) {
        final mobile = constraints.maxWidth < 700;
        return PortfolioLayout(
          mobile: mobile,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PortfolioHeader(
                key: navigation.keys[PortfolioSection.home],
                mobile: mobile,
              ),
              SizedBox(height: mobile ? 48 : 85),
              PortfolioHero(
                mobile: mobile,
                onContact: () => navigation.navigate(PortfolioSection.contact),
              ),
              const SizedBox(height: 30),
              const PortfolioSectionLinks(),
              const SizedBox(height: 50),
              PortfolioDetails(
                key: navigation.keys[PortfolioSection.about],
                experienceKey: navigation.keys[PortfolioSection.experience],
              ),
              const SizedBox(height: 35),
              PortfolioProjects(
                key: navigation.keys[PortfolioSection.projects],
                mobile: mobile,
                projects: widget.projects,
              ),
              const SizedBox(height: 35),
              PortfolioContact(key: navigation.keys[PortfolioSection.contact]),
            ],
          ),
        );
      },
    ),
  );
}
