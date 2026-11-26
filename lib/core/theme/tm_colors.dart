import 'package:flutter/material.dart';

/// TagMe brand colours, taken from the app prototype.
class TmColors {
  TmColors._();

  /// Near-black used for text, dark buttons and hero headers.
  static const ink = Color(0xFF141414);

  /// Warm off-white app background.
  static const cream = Color(0xFFF6F2EA);

  /// Signature accent: active states, badges, "your turn".
  static const lime = Color(0xFFD2FF4D);

  /// Light lime used for selected list rows.
  static const limeSoft = Color(0xFFF2FFD0);

  static const card = Colors.white;

  /// Hairlines and inactive borders.
  static const line = Color(0xFFE2DCD0);
  static const line2 = Color(0xFFD8D1C3);

  /// Soft neutral fill (photo placeholders, grey pills).
  static const sand = Color(0xFFECE6DA);
  static const sandDark = Color(0xFFC9C1B1);

  /// Text greys.
  static const muted = Color(0xFF6B6B6B);
  static const sub = Color(0xFF4A4A4A);
  static const body = Color(0xFF333333);
  static const disabled = Color(0xFF8A8A8A);

  /// Surfaces and text on dark (ink) backgrounds.
  static const inkRaised = Color(0xFF262626);
  static const inkLine = Color(0xFF3A3A3A);
  static const onInkMuted = Color(0xFFCFC8BA);
  static const onInkFaint = Color(0xFFA8A193);

  /// Warnings: late dates, delivery problems, collab ended.
  static const warnBg = Color(0xFFFFE2D4);
  static const warnText = Color(0xFF8A2A00);

  /// Online status dot.
  static const online = Color(0xFF2BB34A);
  static const offline = Color(0xFFB5AD9E);
}
