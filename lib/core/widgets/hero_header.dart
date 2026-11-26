import 'package:flutter/material.dart';

import '../theme/tm_colors.dart';
import '../theme/tm_text.dart';
import 'scallop_edge.dart';
import 'tm_icon.dart';

/// Rounded "‹ Back" button. Pass [onInk] when it sits on a dark header.
class TmBackButton extends StatelessWidget {
  const TmBackButton({
    super.key,
    this.label = 'Back',
    this.onPressed,
    this.onInk = false,
  });

  final String label;

  /// Defaults to [Navigator.maybePop].
  final VoidCallback? onPressed;
  final bool onInk;

  @override
  Widget build(BuildContext context) {
    final fg = onInk ? TmColors.cream : TmColors.ink;
    return Material(
      color: onInk ? TmColors.inkRaised : Colors.white,
      shape: const StadiumBorder(),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onPressed ?? () => Navigator.of(context).maybePop(),
        child: Container(
          height: 44,
          padding: const EdgeInsets.only(left: 10, right: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TmIcon(TmIcons.back, color: fg),
              const SizedBox(width: 4),
              Text(
                label,
                style: TmText.body(
                  size: 14,
                  weight: FontWeight.w700,
                  color: fg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Round 44×44 icon button (notifications bell, close, send).
class TmIconButton extends StatelessWidget {
  const TmIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.tooltip,
    this.background = Colors.white,
    this.foreground = TmColors.ink,
    this.size = 44,
    this.badgeCount,
  });

  final TmIcons icon;
  final VoidCallback? onPressed;
  final String tooltip;
  final Color background;
  final Color foreground;
  final double size;

  /// Shows a small ink/lime count bubble in the corner when > 0.
  final int? badgeCount;

  @override
  Widget build(BuildContext context) => Tooltip(
    message: tooltip,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          color: background,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onPressed,
            child: SizedBox.square(
              dimension: size,
              child: Center(child: TmIcon(icon, color: foreground)),
            ),
          ),
        ),
        if ((badgeCount ?? 0) > 0)
          Positioned(
            top: -4,
            right: -4,
            child: Container(
              constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: TmColors.ink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$badgeCount',
                style: TmText.body(
                  size: 11,
                  weight: FontWeight.w800,
                  color: TmColors.lime,
                ),
              ),
            ),
          ),
      ],
    ),
  );
}

/// Dark header with a back button, eyebrow, big title and a scalloped edge.
/// Used by the deal, tracking and offer-status screens.
class HeroHeader extends StatelessWidget {
  const HeroHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.backLabel = 'Back',
    this.onBack,
    this.trailing,
    this.bottom,
  });

  final String eyebrow;
  final String title;
  final String backLabel;
  final VoidCallback? onBack;

  /// Shown at the end of the back-button row, e.g. a [TurnPill].
  final Widget? trailing;

  /// Extra content under the title, e.g. [StepBars].
  final Widget? bottom;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        color: TmColors.ink,
        padding: EdgeInsets.fromLTRB(
          20,
          MediaQuery.paddingOf(context).top + 14,
          20,
          22,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TmBackButton(label: backLabel, onPressed: onBack, onInk: true),
                const SizedBox(width: 12),
                // The trailing pill gives way (and shortens) on narrow
                // screens instead of overflowing.
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: trailing ?? const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              eyebrow.toUpperCase(),
              style: TmText.eyebrow(color: TmColors.onInkMuted),
            ),
            const SizedBox(height: 6),
            Text(title, style: TmText.display(32, color: TmColors.cream)),
            if (bottom != null) ...[const SizedBox(height: 14), bottom!],
          ],
        ),
      ),
      const ScallopEdge.down(),
    ],
  );
}
