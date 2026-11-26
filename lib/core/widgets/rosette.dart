import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/tm_colors.dart';

/// Builds the scalloped "rosette" (seal) shape used for badges, the credit
/// balance and the welcome bonus.
///
/// [radius] is the distance from the centre to the scallop joints; [lobes]
/// is the number of scallops; [rotation] is in radians.
Path rosettePath(
  Offset center,
  double radius,
  int lobes, {
  double rotation = 0,
}) {
  final chord = 2 * radius * math.sin(math.pi / lobes);
  final arc = Radius.circular(chord * 0.62);
  final path = Path();
  for (var i = 0; i <= lobes; i++) {
    final a = rotation + i / lobes * math.pi * 2;
    final p = center + Offset(radius * math.cos(a), radius * math.sin(a));
    if (i == 0) {
      path.moveTo(p.dx, p.dy);
    } else {
      path.arcToPoint(p, radius: arc, clockwise: true);
    }
  }
  return path..close();
}

/// A rosette shape with an optional child centred on top.
///
/// Set [ringColor] to draw the faint outer ring used on dark backgrounds
/// (welcome bonus, "Applied!" screens).
class Rosette extends StatelessWidget {
  const Rosette({
    super.key,
    required this.size,
    this.lobes = 16,
    this.color = TmColors.lime,
    this.strokeColor,
    this.strokeWidth = 1.5,
    this.ringColor,
    this.child,
  });

  final double size;
  final int lobes;
  final Color color;
  final Color? strokeColor;
  final double strokeWidth;
  final Color? ringColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: size,
    child: CustomPaint(
      painter: _RosettePainter(
        lobes: lobes,
        color: color,
        strokeColor: strokeColor,
        strokeWidth: strokeWidth,
        ringColor: ringColor,
      ),
      child: child == null ? null : Center(child: child),
    ),
  );
}

class _RosettePainter extends CustomPainter {
  _RosettePainter({
    required this.lobes,
    required this.color,
    required this.strokeColor,
    required this.strokeWidth,
    required this.ringColor,
  });

  final int lobes;
  final Color color;
  final Color? strokeColor;
  final double strokeWidth;
  final Color? ringColor;

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final half = size.shortestSide / 2;
    // Matches the prototype proportions: ring at 130/145, fill at 116/145.
    final fillR = half * 0.80;
    if (ringColor != null) {
      canvas.drawPath(
        rosettePath(c, half * 0.895, lobes, rotation: 0.16),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..color = ringColor!,
      );
    }
    final path = rosettePath(c, fillR, lobes);
    canvas.drawPath(path, Paint()..color = color);
    if (strokeColor != null) {
      canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..color = strokeColor!,
      );
    }
  }

  @override
  bool shouldRepaint(_RosettePainter old) =>
      old.lobes != lobes ||
      old.color != color ||
      old.strokeColor != strokeColor ||
      old.ringColor != ringColor;
}

/// The lime "completed" seal with a check mark.
class CompletedBadge extends StatelessWidget {
  const CompletedBadge({super.key, this.size = 68});
  final double size;

  @override
  Widget build(BuildContext context) => Rosette(
    size: size,
    strokeColor: TmColors.ink,
    child: Icon(Icons.check_rounded, size: size * 0.42, color: TmColors.ink),
  );
}
