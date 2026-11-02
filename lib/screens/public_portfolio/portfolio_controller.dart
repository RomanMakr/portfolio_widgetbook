import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum PortfolioSection { home, about, experience, projects, contact }

class PortfolioController extends ChangeNotifier {
  final scroll = ScrollController();
  final keys = {
    for (final section in PortfolioSection.values) section: GlobalKey(),
  };
  PortfolioSection selected = PortfolioSection.home;
  int _navigation = 0;
  bool _animating = false;

  PortfolioController() {
    scroll.addListener(_syncSelection);
  }

  Future<void> navigate(PortfolioSection section) async {
    if (!scroll.hasClients) return;
    final target = keys[section]!.currentContext;
    if (target == null) return;
    final request = ++_navigation;
    _animating = true;
    _select(section);
    try {
      await scroll.animateTo(
        section == PortfolioSection.home
            ? 0
            : _offset(target).clamp(0, scroll.position.maxScrollExtent),
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
      );
    } finally {
      if (request == _navigation) _animating = false;
    }
  }

  double _offset(BuildContext context) {
    final object = context.findRenderObject()!;
    return RenderAbstractViewport.of(
      object,
    ).getOffsetToReveal(object, 0).offset;
  }

  void _syncSelection() {
    if (_animating || !scroll.hasClients) return;
    var section = PortfolioSection.home;
    if (scroll.position.maxScrollExtent > 0 &&
        scroll.position.extentAfter < 1) {
      section = PortfolioSection.contact;
    } else {
      for (final candidate in PortfolioSection.values) {
        final context = keys[candidate]!.currentContext;
        if (context != null && _offset(context) <= scroll.offset + 24) {
          section = candidate;
        }
      }
    }
    _select(section);
  }

  void _select(PortfolioSection section) {
    if (selected == section) return;
    selected = section;
    notifyListeners();
  }

  @override
  void dispose() {
    ++_navigation;
    scroll.dispose();
    super.dispose();
  }
}
