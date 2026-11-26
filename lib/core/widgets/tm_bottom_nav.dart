import 'package:flutter/material.dart';

import '../theme/tm_colors.dart';
import '../theme/tm_text.dart';
import 'tm_icon.dart';

/// The four main tabs.
enum TmTab {
  home('Home', TmIcons.home),
  collabs('Collabs', TmIcons.collabs),
  credits('Credits', TmIcons.credits),
  profile('Profile', TmIcons.me);

  const TmTab(this.label, this.icon);
  final String label;
  final TmIcons icon;
}

/// White bottom navigation bar; the active tab's icon sits in a lime pill.
class TmBottomNav extends StatelessWidget {
  const TmBottomNav({super.key, required this.current, required this.onSelect});

  final TmTab current;
  final ValueChanged<TmTab> onSelect;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(top: BorderSide(color: TmColors.line)),
    ),
    child: SafeArea(
      top: false,
      minimum: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
        child: Row(
          children: [
            for (final t in TmTab.values)
              Expanded(
                child: _Item(
                  tab: t,
                  on: t == current,
                  onTap: () => onSelect(t),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

class _Item extends StatelessWidget {
  const _Item({required this.tab, required this.on, required this.onTap});
  final TmTab tab;
  final bool on;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = on ? TmColors.ink : TmColors.sub;
    return Semantics(
      button: true,
      selected: on,
      label: tab.label,
      excludeSemantics: true,
      child: InkResponse(
        onTap: onTap,
        radius: 36,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 52,
              height: 30,
              decoration: BoxDecoration(
                color: on ? TmColors.lime : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              alignment: Alignment.center,
              child: TmIcon(tab.icon, color: color),
            ),
            const SizedBox(height: 4),
            Text(
              tab.label,
              style: TmText.body(
                size: 12,
                weight: on ? FontWeight.w700 : FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
