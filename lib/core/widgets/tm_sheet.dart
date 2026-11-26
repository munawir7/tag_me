import 'package:flutter/material.dart';

/// Opens a TagMe bottom sheet.
///
/// * Shown on the root navigator, so it covers the bottom tab bar instead
///   of being squeezed above it.
/// * At most 85% of the screen tall; [scrollable] content scrolls when it
///   doesn't fit (small phones, large text). Pass `scrollable: false` when
///   the sheet scrolls by itself (e.g. a form handling the keyboard).
Future<T?> showTmSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool scrollable = true,
}) => showModalBottomSheet<T>(
  context: context,
  useRootNavigator: true,
  isScrollControlled: true,
  showDragHandle: true,
  constraints: BoxConstraints(
    maxHeight: MediaQuery.sizeOf(context).height * 0.85,
  ),
  builder: (sheetContext) => SafeArea(
    top: false,
    child: scrollable
        ? SingleChildScrollView(child: builder(sheetContext))
        : builder(sheetContext),
  ),
);
