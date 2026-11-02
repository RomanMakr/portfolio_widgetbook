import 'package:flutter/material.dart';

import 'portfolio_controller.dart';
export 'portfolio_controller.dart';

class PortfolioScope extends InheritedNotifier<PortfolioController> {
  const PortfolioScope({
    super.key,
    required PortfolioController controller,
    required super.child,
  }) : super(notifier: controller);

  static PortfolioController? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PortfolioScope>()?.notifier;
}
