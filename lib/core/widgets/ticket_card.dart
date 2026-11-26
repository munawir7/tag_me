import 'package:flutter/material.dart';

import '../theme/tm_colors.dart';
import '../theme/tm_dimens.dart';
import 'dashed_border.dart';

/// Ticket-style card: a [top] section and a [bottom] section separated by a
/// dashed line with round notches cut into both sides.
///
/// Used for vouchers / entry codes (dark top, white bottom), the creator QR,
/// and the "Confirm application" summary (both white).
class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.top,
    required this.bottom,
    this.topColor = TmColors.ink,
    this.bottomColor = Colors.white,
    this.notchColor = TmColors.cream,
    this.radius = TmDimens.radiusTicket,
    this.notchSize = 26,
    this.topPadding = const EdgeInsets.all(22),
    this.bottomPadding = const EdgeInsets.fromLTRB(22, 26, 22, 22),
  });

  final Widget top;
  final Widget bottom;
  final Color topColor;
  final Color bottomColor;

  /// Should match the background the ticket sits on.
  final Color notchColor;
  final double radius;
  final double notchSize;
  final EdgeInsetsGeometry topPadding;
  final EdgeInsetsGeometry bottomPadding;

  @override
  Widget build(BuildContext context) {
    final n = notchSize / 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: topPadding,
          decoration: BoxDecoration(
            color: topColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
          ),
          child: top,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              padding: bottomPadding,
              decoration: BoxDecoration(
                color: bottomColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(radius),
                ),
              ),
              child: bottom,
            ),
            Positioned(
              left: n + 4,
              right: n + 4,
              top: 0,
              child: const DashedLine(),
            ),
            Positioned(left: -n, top: -n, child: _notch()),
            Positioned(right: -n, top: -n, child: _notch()),
          ],
        ),
      ],
    );
  }

  Widget _notch() => Container(
    width: notchSize,
    height: notchSize,
    decoration: BoxDecoration(color: notchColor, shape: BoxShape.circle),
  );
}
