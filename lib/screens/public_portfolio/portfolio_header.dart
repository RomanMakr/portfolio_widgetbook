import 'package:flutter/material.dart';

import '../../widgets/common.dart';
import 'portfolio_header_links.dart';

class PortfolioHeader extends StatelessWidget {
  final bool mobile;
  const PortfolioHeader({super.key, required this.mobile});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, c) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Logo(initials: 'RM'),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'Roman Makaryan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (c.maxWidth >= 1000) ...[
              const PortfolioHeaderLinks(),
              const SizedBox(width: 24),
              OutlinedButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('A CV file has not been added yet.'),
                  ),
                ),
                child: const Text('Download CV'),
              ),
            ],
          ],
        ),
        if (!mobile && c.maxWidth < 1000) ...[
          const SizedBox(height: 12),
          const PortfolioHeaderLinks(),
        ],
      ],
    ),
  );
}
