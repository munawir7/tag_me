import 'package:flutter/material.dart';

import '../theme/tm_colors.dart';
import '../theme/tm_text.dart';

/// Who did something in a deal.
enum TimelineActor { brand, you }

class TimelineEntry {
  const TimelineEntry({required this.text, required this.when, this.actor});
  final String text;
  final String when;
  final TimelineActor? actor;
}

/// The "UPDATES" log on a deal: newest first, newest dot highlighted lime.
class TimelineList extends StatelessWidget {
  const TimelineList({super.key, required this.entries});
  final List<TimelineEntry> entries;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      for (var i = 0; i < entries.length; i++)
        _Row(
          entry: entries[i],
          isFirst: i == 0,
          isLast: i == entries.length - 1,
        ),
    ],
  );
}

class _Row extends StatelessWidget {
  const _Row({
    required this.entry,
    required this.isFirst,
    required this.isLast,
  });
  final TimelineEntry entry;
  final bool isFirst, isLast;

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 14,
          child: Column(
            children: [
              Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isFirst ? TmColors.lime : TmColors.ink,
                  border: isFirst
                      ? Border.all(color: TmColors.ink, width: 2)
                      : null,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    constraints: const BoxConstraints(minHeight: 12),
                    color: TmColors.line,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (entry.actor != null) ...[
                      ActorTag(entry.actor!),
                      const SizedBox(width: 8),
                    ],
                    Text(entry.when, style: TmText.small()),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  entry.text,
                  style: TmText.body(
                    size: 14,
                    weight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

/// "Brand" (ink) or "You" (lime) tag.
class ActorTag extends StatelessWidget {
  const ActorTag(this.actor, {super.key});
  final TimelineActor actor;

  @override
  Widget build(BuildContext context) {
    final brand = actor == TimelineActor.brand;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: brand ? TmColors.ink : TmColors.lime,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        brand ? 'Brand' : 'You',
        style: TmText.body(
          size: 11,
          weight: FontWeight.w700,
          color: brand ? Colors.white : TmColors.ink,
        ),
      ),
    );
  }
}
