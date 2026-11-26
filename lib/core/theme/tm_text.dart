import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'tm_colors.dart';

/// TagMe typography.
///
/// * Display / headings: Bricolage Grotesque, weight 800, tight tracking.
/// * Body: DM Sans.
class TmText {
  TmText._();

  /// Heading style. [size] in logical pixels; [height] is the line height
  /// multiplier (the prototype uses ~0.95–1.1 for big titles).
  static TextStyle display(
    double size, {
    Color color = TmColors.ink,
    double height = 1.0,
  }) => GoogleFonts.bricolageGrotesque(
    fontSize: size,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.03 * size,
    height: height,
    color: color,
  );

  /// Body text.
  static TextStyle body({
    double size = 15,
    FontWeight weight = FontWeight.w400,
    Color color = TmColors.ink,
    double? height,
  }) => GoogleFonts.dmSans(
    fontSize: size,
    fontWeight: weight,
    color: color,
    height: height,
  );

  /// Small uppercase label, e.g. "YOU GET", "KEY DATES".
  static TextStyle eyebrow({Color color = TmColors.muted}) =>
      GoogleFonts.dmSans(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.14 * 11,
        color: color,
      );

  /// 13px secondary text.
  static TextStyle small({
    Color color = TmColors.sub,
    FontWeight weight = FontWeight.w400,
    double? height,
  }) => body(size: 13, color: color, weight: weight, height: height);

  /// Material text theme built on DM Sans, so default widgets match.
  static TextTheme textTheme() {
    final base = GoogleFonts.dmSansTextTheme().apply(
      bodyColor: TmColors.ink,
      displayColor: TmColors.ink,
    );
    return base.copyWith(
      displayLarge: display(44, height: 0.95),
      displayMedium: display(38, height: 0.98),
      displaySmall: display(32),
      headlineLarge: display(30),
      headlineMedium: display(26),
      headlineSmall: display(24, height: 1.1),
      titleLarge: display(22),
      titleMedium: body(size: 16, weight: FontWeight.w700),
      titleSmall: body(size: 14, weight: FontWeight.w700),
      bodyLarge: body(size: 16, height: 1.45),
      bodyMedium: body(size: 15, height: 1.45),
      bodySmall: small(height: 1.4),
      labelLarge: body(size: 16, weight: FontWeight.w700),
      labelMedium: body(size: 14, weight: FontWeight.w700),
      labelSmall: eyebrow(),
    );
  }
}
