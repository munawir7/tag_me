import 'package:flutter/material.dart';

import '../theme/tm_colors.dart';
import '../theme/tm_dimens.dart';

/// White rounded card. Optionally outlined and/or tappable.
class TmCard extends StatelessWidget {
  const TmCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.radius = TmDimens.radiusCard,
    this.color = TmColors.card,
    this.borderColor,
    this.borderWidth = TmDimens.stroke,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color color;

  /// Pass e.g. [TmColors.ink] for an outlined card.
  final Color? borderColor;
  final double borderWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
      side: borderColor == null
          ? BorderSide.none
          : BorderSide(color: borderColor!, width: borderWidth),
    );
    return Material(
      color: color,
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? Padding(padding: padding, child: child)
          : InkWell(
              onTap: onTap,
              child: Padding(padding: padding, child: child),
            ),
    );
  }
}

/// Small uppercase section label ("YOU GET", "KEY DATES").
class Eyebrow extends StatelessWidget {
  const Eyebrow(this.text, {super.key, this.color = TmColors.muted});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => Text(
    text.toUpperCase(),
    style: Theme.of(context).textTheme.labelSmall!.copyWith(color: color),
  );
}
