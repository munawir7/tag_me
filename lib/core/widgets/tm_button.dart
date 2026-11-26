import 'package:flutter/material.dart';

import '../theme/tm_colors.dart';
import '../theme/tm_dimens.dart';
import '../theme/tm_text.dart';
import 'dashed_border.dart';

enum TmButtonVariant {
  /// Ink background, white text. The main call to action.
  primary,

  /// White background with ink outline.
  ghost,

  /// Lime background with ink outline.
  lime,

  /// Transparent with a dashed grey outline, e.g. "+ Add a new address".
  dashed,
}

/// Pill-shaped TagMe button.
///
/// Full width by default; set [expand] to false for inline buttons.
/// Pass `onPressed: null` to show the disabled ("off") state.
class TmButton extends StatelessWidget {
  const TmButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = TmButtonVariant.primary,
    this.small = false,
    this.expand = true,
    this.icon,
  });

  const TmButton.ghost({
    super.key,
    required this.label,
    required this.onPressed,
    this.small = false,
    this.expand = true,
    this.icon,
  }) : variant = TmButtonVariant.ghost;

  const TmButton.lime({
    super.key,
    required this.label,
    required this.onPressed,
    this.small = false,
    this.expand = true,
    this.icon,
  }) : variant = TmButtonVariant.lime;

  const TmButton.dashed({
    super.key,
    required this.label,
    required this.onPressed,
    this.small = true,
    this.expand = true,
    this.icon,
  }) : variant = TmButtonVariant.dashed;

  final String label;
  final VoidCallback? onPressed;
  final TmButtonVariant variant;
  final bool small;
  final bool expand;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    final height = small ? TmDimens.buttonHeightSm : TmDimens.buttonHeight;

    final (Color bg, Color fg, BorderSide side) = !enabled
        ? (TmColors.line2, TmColors.sub, BorderSide.none)
        : switch (variant) {
            TmButtonVariant.primary => (
              TmColors.ink,
              Colors.white,
              BorderSide.none,
            ),
            TmButtonVariant.ghost => (
              Colors.white,
              TmColors.ink,
              const BorderSide(color: TmColors.ink, width: TmDimens.stroke),
            ),
            TmButtonVariant.lime => (
              TmColors.lime,
              TmColors.ink,
              const BorderSide(color: TmColors.ink, width: TmDimens.stroke),
            ),
            TmButtonVariant.dashed => (
              Colors.white,
              TmColors.ink,
              BorderSide.none,
            ),
          };

    final content = Row(
      mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          IconTheme.merge(
            data: IconThemeData(color: fg),
            child: icon!,
          ),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: Text(
            label,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TmText.body(
              size: small ? 15 : 16,
              weight: FontWeight.w700,
              color: fg,
            ),
          ),
        ),
      ],
    );

    Widget button = Material(
      color: bg,
      shape: StadiumBorder(side: side),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: expand ? 16 : 22),
          alignment: Alignment.center,
          child: content,
        ),
      ),
    );

    if (variant == TmButtonVariant.dashed && enabled) {
      button = DashedBorder(radius: height / 2, child: button);
    }

    return Semantics(
      button: true,
      enabled: enabled,
      child: expand ? SizedBox(width: double.infinity, child: button) : button,
    );
  }
}

/// Underlined text button, e.g. "I already have an account".
class TmLinkButton extends StatelessWidget {
  const TmLinkButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.small = false,
    this.color = TmColors.ink,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool small;
  final Color color;

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      minimumSize: const Size(0, 44),
      foregroundColor: color,
    ),
    child: Text(
      label,
      style: TmText.body(
        size: small ? 13 : 15,
        weight: FontWeight.w700,
        color: color,
      ).copyWith(decoration: TextDecoration.underline, decorationColor: color),
    ),
  );
}
