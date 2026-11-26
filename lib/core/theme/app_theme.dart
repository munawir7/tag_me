import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tm_colors.dart';
import 'tm_dimens.dart';
import 'tm_text.dart';

/// TagMe has a single (light, cream) theme. Dark surfaces such as hero
/// headers are part of the design, not a dark mode.
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: TmColors.ink,
      onPrimary: Colors.white,
      secondary: TmColors.lime,
      onSecondary: TmColors.ink,
      surface: TmColors.cream,
      onSurface: TmColors.ink,
      surfaceContainerLowest: Colors.white,
      surfaceContainer: Colors.white,
      outline: TmColors.line2,
      outlineVariant: TmColors.line,
      error: TmColors.warnText,
      onError: Colors.white,
    );

    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(TmDimens.radiusInput),
      borderSide: const BorderSide(color: TmColors.ink, width: TmDimens.stroke),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: TmColors.cream,
      textTheme: TmText.textTheme(),
      splashFactory: InkSparkle.splashFactory,
      appBarTheme: AppBarTheme(
        backgroundColor: TmColors.cream,
        foregroundColor: TmColors.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TmText.display(26),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 15,
        ),
        hintStyle: TmText.body(size: 16, color: TmColors.disabled),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: inputBorder.copyWith(
          borderSide: const BorderSide(color: TmColors.ink, width: 2),
        ),
        errorBorder: inputBorder.copyWith(
          borderSide: const BorderSide(color: TmColors.warnText, width: 2),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: TmColors.ink,
        selectionColor: TmColors.lime,
        selectionHandleColor: TmColors.ink,
      ),
      dividerTheme: const DividerThemeData(
        color: TmColors.line,
        thickness: 1,
        space: 1,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: TmColors.cream,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: TmColors.ink,
        contentTextStyle: TmText.body(
          size: 14,
          weight: FontWeight.w600,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) =>
              s.contains(WidgetState.selected) ? TmColors.lime : Colors.white,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) =>
              s.contains(WidgetState.selected) ? TmColors.ink : TmColors.line2,
        ),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),
    );
  }
}
