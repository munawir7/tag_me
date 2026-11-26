import 'package:flutter/material.dart';

import '../theme/tm_colors.dart';

/// The scalloped edge where an ink area meets the cream page.
///
/// * [ScallopEdge.down] goes directly *under* an ink block: ink
///   half-circles hanging down into the cream.
/// * [ScallopEdge.up] goes directly *above* a cream block that follows an
///   ink area: cream half-circles rising up into an ink strip.
class ScallopEdge extends StatelessWidget {
  const ScallopEdge.down({super.key, this.color = TmColors.ink})
    : background = null,
      _up = false;

  const ScallopEdge.up({
    super.key,
    this.color = TmColors.cream,
    this.background = TmColors.ink,
  }) : _up = true;

  /// Colour of the half-circles.
  final Color color;

  /// Colour of the strip behind the half-circles (only for [ScallopEdge.up]).
  final Color? background;
  final bool _up;

  static const double height = 16;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height,
    width: double.infinity,
    child: CustomPaint(painter: _ScallopPainter(color, background, _up)),
  );
}

class _ScallopPainter extends CustomPainter {
  _ScallopPainter(this.color, this.background, this.up);
  final Color color;
  final Color? background;
  final bool up;

  @override
  void paint(Canvas canvas, Size size) {
    const r = 15.5, step = 32.0;
    canvas.clipRect(Offset.zero & size);
    if (background != null) {
      canvas.drawRect(Offset.zero & size, Paint()..color = background!);
    }
    final paint = Paint()..color = color;
    final cy = up ? size.height : 0.0;
    for (var x = step / 2; x < size.width + step; x += step) {
      canvas.drawCircle(Offset(x, cy), r, paint);
    }
  }

  @override
  bool shouldRepaint(_ScallopPainter old) =>
      old.color != color || old.background != background || old.up != up;
}
