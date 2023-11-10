// ignore_for_file: avoid_returning_widgets
import 'package:flutter/material.dart';
import 'package:routing/application.dart';
import 'package:routing/page.dart';

import '../router/pages.dart';

typedef OnNavCallback = ValueChanged<BuildContext>;

class Destination {
  const Destination({
    required this.label,
    required this.icon,
    required this.onSelected,
    this.selectedIcon,
  });

  final Widget icon;
  final String label;
  final OnNavCallback onSelected;
  final Widget? selectedIcon;
}

class TestLayoutPage extends StatelessWidget {
  TestLayoutPage(
    this.child, {
    super.key,
  });

  final Widget child;

  final _destination = [
    Destination(
      label: Pages.testA.name,
      icon: const Icon(Icons.home_outlined),
      selectedIcon: const Icon(Icons.home),
      onSelected: (context) => context.to(Pages.testA.name),
    ),
    Destination(
      label: Pages.testB.name,
      icon: const Icon(Icons.search_outlined),
      selectedIcon: const Icon(Icons.search),
      onSelected: (context) => context.to(Pages.testB.name),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: child,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: context.currentIndex,
        onDestinationSelected: (index) => _destination[index].onSelected(
          context,
        ),
        destinations: _destination.map((e) => e.toNavDestination()).toList(),
      ),
    );
  }
}

extension on Destination {
  NavigationDestination toNavDestination() {
    return NavigationDestination(
      icon: icon,
      label: label,
      selectedIcon: selectedIcon,
    );
  }
}

extension on BuildContext {
  int get currentIndex {
    switch (page.path) {
      case '/testa':
        return 0;
      case '/testb':
        return 1;
      default:
        return 0;
    }
  }
}
