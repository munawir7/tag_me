import 'package:flutter/material.dart';

import '../theme/tm_colors.dart';
import '../theme/tm_text.dart';
import 'dashed_border.dart';

/// Status pill styles from the prototype.
enum TmPillStyle {
  /// Lime: "YOUR TURN", "VERIFIED".
  you,

  /// White with ink outline: "WAITING ON BRAND".
  brand,

  /// Sand: "NOT APPROVED", "OPTIONAL".
  grey,

  /// Ink: "COMPLETED", "ALL REQUIRED".
  dark,

  /// Ink with a double ring: "SCRIPT REJECTED".
  rejected,

  /// For use on ink backgrounds: "WAITING ON BRAND" inside a hero header.
  onInk,
}

class TmPill extends StatelessWidget {
  const TmPill(this.label, {super.key, this.style = TmPillStyle.dark});

  final String label;
  final TmPillStyle style;

  @override
  Widget build(BuildContext context) {
    final (
      Color bg,
      Color fg,
      Border? border,
      List<BoxShadow>? ring,
    ) = switch (style) {
      TmPillStyle.you => (TmColors.lime, TmColors.ink, null, null),
      TmPillStyle.brand => (
        Colors.white,
        TmColors.ink,
        Border.all(color: TmColors.ink, width: 1.5),
        null,
      ),
      TmPillStyle.grey => (TmColors.sand, TmColors.sub, null, null),
      TmPillStyle.dark => (TmColors.ink, Colors.white, null, null),
      TmPillStyle.rejected => (
        TmColors.ink,
        Colors.white,
        null,
        const [
          BoxShadow(color: Colors.white, spreadRadius: 2),
          BoxShadow(color: TmColors.ink, spreadRadius: 3.5),
        ],
      ),
      TmPillStyle.onInk => (
        TmColors.inkRaised,
        TmColors.cream,
        Border.all(color: TmColors.sub),
        null,
      ),
    };

    return Container(
      // The ring shadows paint outside the box, so leave room for them.
      margin: ring == null ? null : const EdgeInsets.all(3.5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: border,
        boxShadow: ring,
      ),
      child: Text(
        label.toUpperCase(),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TmText.body(
          size: 11,
          weight: FontWeight.w700,
          color: fg,
        ).copyWith(letterSpacing: 0.66),
      ),
    );
  }
}

/// "YOUR TURN" / "WAITING ON BRAND" / "COMPLETED" pill in deal headers.
class TurnPill extends StatelessWidget {
  const TurnPill(this.label, {super.key, required this.waiting});

  final String label;

  /// True when the creator is waiting on the brand.
  final bool waiting;

  @override
  Widget build(BuildContext context) =>
      TmPill(label, style: waiting ? TmPillStyle.onInk : TmPillStyle.you);
}

/// Outlined chip, e.g. eligibility tags ("UAE address").
class TmChip extends StatelessWidget {
  const TmChip(
    this.label, {
    super.key,
    this.selected = false,
    this.onTap,
    this.leading,
    this.dashed = false,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final Widget? leading;
  final bool dashed;

  @override
  Widget build(BuildContext context) {
    Widget chip = Container(
      constraints: BoxConstraints(minHeight: onTap != null ? 44 : 0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: selected ? TmColors.lime : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: selected ? TmColors.ink : TmColors.line2,
          width: 1.5,
          style: dashed ? BorderStyle.none : BorderStyle.solid,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: 6)],
          Text(label, style: TmText.body(size: 13, weight: FontWeight.w600)),
        ],
      ),
    );
    if (dashed) {
      chip = DashedBorder(color: TmColors.disabled, radius: 14, child: chip);
    }
    if (onTap == null) return chip;
    return Semantics(
      button: true,
      selected: selected,
      child: GestureDetector(onTap: onTap, child: chip),
    );
  }
}

/// Horizontal filter chip ("All · 4", "Barter · 2").
class TmFilterChip extends StatelessWidget {
  const TmFilterChip(
    this.label, {
    super.key,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    selected: selected,
    child: Material(
      color: selected ? TmColors.lime : Colors.transparent,
      shape: StadiumBorder(
        side: BorderSide(
          color: selected ? TmColors.ink : TmColors.line2,
          width: 1.5,
        ),
      ),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onTap,
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TmText.body(size: 13, weight: FontWeight.w700),
          ),
        ),
      ),
    ),
  );
}
