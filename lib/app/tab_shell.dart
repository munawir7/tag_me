import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/widgets/widgets.dart';

/// Hosts the four main tabs with the TagMe bottom nav.
class TabShell extends StatelessWidget {
  const TabShell({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: shell,
    bottomNavigationBar: TmBottomNav(
      current: TmTab.values[shell.currentIndex],
      // Tapping the active tab again returns it to its first page.
      onSelect: (t) => shell.goBranch(
        t.index,
        initialLocation: t.index == shell.currentIndex,
      ),
    ),
  );
}
