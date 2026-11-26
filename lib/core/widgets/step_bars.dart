import 'package:flutter/material.dart';

import '../theme/tm_colors.dart';

enum StepBarsTone {
  /// For dark hero headers: done = lime, current = cream, upcoming = grey.
  onInk,

  /// For white cards: done = ink, current = lime (outlined), upcoming = line.
  onLight,
}

/// Segmented progress bar showing where a deal is.
class StepBars extends StatelessWidget {
  const StepBars({
    super.key,
    required this.total,
    required this.current,
    this.tone = StepBarsTone.onInk,
  });

  final int total;

  /// Zero-based index of the current step. Use [total] when all are done.
  final int current;
  final StepBarsTone tone;

  @override
  Widget build(BuildContext context) {
    final onInk = tone == StepBarsTone.onInk;
    final h = onInk ? 6.0 : 5.0;
    final gap = onInk ? 4.0 : 3.0;
    return Semantics(
      label: 'Step ${(current + 1).clamp(1, total)} of $total',
      child: Row(
        children: [
          for (var i = 0; i < total; i++) ...[
            if (i > 0) SizedBox(width: gap),
            Expanded(
              child: Container(
                height: h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(h / 2),
                  color: i < current
                      ? (onInk ? TmColors.lime : TmColors.ink)
                      : i == current
                      ? (onInk ? TmColors.cream : TmColors.lime)
                      : (onInk ? TmColors.inkLine : TmColors.line),
                  border: !onInk && i == current
                      ? Border.all(color: TmColors.ink, width: 1)
                      : null,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
