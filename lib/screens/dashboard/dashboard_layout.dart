import 'package:flutter/material.dart';

import 'dashboard_dependencies.dart';
import 'dashboard_chrome.dart';

class DashboardLayout extends StatelessWidget {
  final String page;
  final bool mobile;
  final ValueChanged<String> onPageSelected;
  final Widget child;
  const DashboardLayout({
    super.key,
    required this.page,
    required this.mobile,
    required this.onPageSelected,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: mobile
        ? AppBar(
            title: const Text('Portfolio Admin'),
            actions: [
              PopupMenuButton<String>(
                onSelected: onPageSelected,
                itemBuilder: (_) => dashboardMenu
                    .map((s) => PopupMenuItem(value: s, child: Text(s)))
                    .toList(),
              ),
            ],
          )
        : null,
    bottomNavigationBar: mobile
        ? DashboardNavigation(page: page, onPageSelected: onPageSelected)
        : null,
    body: GlowBackdrop(
      child: Row(
        children: [
          if (!mobile)
            DashboardSidebar(page: page, onPageSelected: onPageSelected),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!mobile) const DashboardHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(mobile ? 20 : 30),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
