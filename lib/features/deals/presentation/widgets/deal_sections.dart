import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/deal_providers.dart';
import '../../../../core/theme/tm_colors.dart';
import '../../../../core/theme/tm_text.dart';
import '../../../../core/utils/dates.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../campaigns/domain/campaign.dart';
import '../../domain/deal.dart';
import '../../domain/deal_deadlines.dart';
import '../deal_ui.dart';

/// Card with an eyebrow header used for every section on the deal screen.
class DealSection extends StatelessWidget {
  const DealSection({
    super.key,
    required this.title,
    required this.children,
    this.trailing,
    this.outlined = false,
  });

  final String title;
  final Widget? trailing;
  final List<Widget> children;
  final bool outlined;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
    child: TmCard(
      borderColor: outlined ? TmColors.ink : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Eyebrow(title)),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    ),
  );
}

// ---------------------------------------------------------------------------
// Chat
// ---------------------------------------------------------------------------

/// One chat thread with the brand for the whole collab.
class DealChat extends ConsumerStatefulWidget {
  const DealChat({super.key, required this.deal});
  final Deal deal;

  @override
  ConsumerState<DealChat> createState() => _DealChatState();
}

class _DealChatState extends ConsumerState<DealChat> {
  final _text = TextEditingController();
  String? _attachment;
  var _attachCount = 0;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _text.text.trim();
    if (text.isEmpty && _attachment == null) return;
    final attachment = _attachment;
    _text.clear();
    setState(() => _attachment = null);
    await runDealAction(
      context,
      () => ref.read(sendDealMessageProvider)(
        widget.deal.id,
        text,
        attachment: attachment,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.deal;
    final now = DateTime.now();
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 0),
      child: TmCard(
        borderColor: d.needsFix ? TmColors.ink : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                InitialAvatar(d.brandName[0], size: 36),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chat with ${d.brandName}',
                        style: TmText.body(weight: FontWeight.w700),
                      ),
                      Text('Open for the whole collab', style: TmText.small()),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (d.chat.isEmpty)
              DashedBorder(
                color: TmColors.line2,
                strokeWidth: 2,
                radius: 14,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Questions about the brief, dates or delivery? Ask here, '
                    'e.g. "Can I film it outdoors in the evening?"',
                    style: TmText.small(color: TmColors.ink, height: 1.45),
                  ),
                ),
              )
            else
              for (final m in d.chat)
                _Bubble(message: m, brand: d.brandName, now: now),
            if (d.needsFix) ...[
              const SizedBox(height: 4),
              Text(
                'Re-submit as many times as needed. If the brand closes the '
                'deal instead, credits are not refunded.',
                style: TmText.small(),
              ),
            ],
            const SizedBox(height: 10),
            Row(
              children: [
                TmIconButton(
                  icon: TmIcons.photo,
                  tooltip: 'Attach an image',
                  background: TmColors.cream,
                  size: 48,
                  onPressed: () => setState(
                    () => _attachment = 'photo_${++_attachCount}.jpg',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _text,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _send(),
                    decoration: InputDecoration(
                      hintText: 'Write to ${d.brandName.split(' ').first}…',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 13,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(
                          color: TmColors.line2,
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(
                          color: TmColors.line2,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                TmIconButton(
                  icon: TmIcons.send,
                  tooltip: 'Send',
                  background: TmColors.ink,
                  foreground: TmColors.lime,
                  size: 48,
                  onPressed: _send,
                ),
              ],
            ),
            if (_attachment != null) ...[
              const SizedBox(height: 6),
              Text('📎 $_attachment attached', style: TmText.small()),
            ],
          ],
        ),
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    required this.message,
    required this.brand,
    required this.now,
  });
  final ChatMessage message;
  final String brand;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final m = message;
    final mine = m.from == Actor.you;
    final good =
        m.tag != null && RegExp('thank', caseSensitive: false).hasMatch(m.tag!);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: mine
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            '${mine ? 'You' : brand} · ${TmDates.ago(m.sentAt, now)}',
            style: TmText.body(
              size: 11,
              weight: FontWeight.w700,
              color: TmColors.sub,
            ),
          ),
          if (m.tag != null || m.videoTimestamp != null) ...[
            const SizedBox(height: 4),
            Wrap(
              spacing: 6,
              children: [
                if (m.tag != null)
                  _Tag(
                    m.tag!,
                    background: good ? TmColors.lime : TmColors.warnBg,
                  ),
                if (m.videoTimestamp != null)
                  _Tag('⏱ ${m.videoTimestamp}', background: TmColors.sand),
              ],
            ),
          ],
          const SizedBox(height: 4),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.7,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: mine ? TmColors.lime : TmColors.cream,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(mine ? 16 : 4),
                  bottomRight: Radius.circular(mine ? 4 : 16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (m.text.isNotEmpty)
                    Text(m.text, style: TmText.body(size: 14, height: 1.45)),
                  if (m.attachment != null) ...[
                    if (m.text.isNotEmpty) const SizedBox(height: 8),
                    Container(
                      height: 80,
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: TmColors.sand,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '📎 ${m.attachment}',
                        style: TmText.small(weight: FontWeight.w700),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.text, {required this.background});
  final String text;
  final Color background;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(text, style: TmText.body(size: 11, weight: FontWeight.w700)),
  );
}

// ---------------------------------------------------------------------------
// Key dates
// ---------------------------------------------------------------------------

/// The brand's dates, with the current one highlighted (or flagged late)
/// and finished ones ticked. Which is which comes from [DealDeadlines].
class KeyDatesCard extends StatelessWidget {
  const KeyDatesCard({super.key, required this.deal, required this.campaign});
  final Deal deal;
  final Campaign campaign;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return DealSection(
      title: 'Key dates · set by ${campaign.brand.name}',
      children: [
        for (final row in DealDeadlines.rows(deal, campaign, now))
          _KeyDateLine(row: row, now: now),
        const SizedBox(height: 8),
        Text(
          'Dates come from the brand. If you need more time, ask in the chat '
          'before the date passes.',
          style: TmText.small(),
        ),
      ],
    );
  }
}

class _KeyDateLine extends StatelessWidget {
  const _KeyDateLine({required this.row, required this.now});
  final KeyDateRow row;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final done = row.state == KeyDateState.done;
    final late = row.state == KeyDateState.late;
    final highlight = late || row.state == KeyDateState.current;
    final days = row.daysFromNow;
    final when = late
        ? 'late by ${-days} day${days == -1 ? '' : 's'}'
        : TmDates.relative(row.date, now);
    return Opacity(
      opacity: done ? 0.55 : 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(
          color: highlight ? (late ? TmColors.warnBg : TmColors.lime) : null,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${done ? '✓ ' : ''}${row.label}',
                style: TmText.body(
                  size: 14,
                  weight: highlight ? FontWeight.w800 : FontWeight.w600,
                ),
              ),
            ),
            Text(
              '${TmDates.short(row.date)} · $when',
              style: TmText.small(
                weight: FontWeight.w700,
                color: late ? TmColors.warnText : TmColors.ink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Deliverables, materials, updates
// ---------------------------------------------------------------------------

class DeliverablesCard extends StatelessWidget {
  const DeliverablesCard({super.key, required this.campaign});
  final Campaign campaign;

  @override
  Widget build(BuildContext context) => DealSection(
    title: 'What to deliver',
    children: [
      for (final x in campaign.deliverables)
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: TmColors.cream,
                  shape: BoxShape.circle,
                ),
                child: const TmIcon(
                  TmIcons.check,
                  size: 12,
                  color: TmColors.ink,
                  strokeWidth: 3,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  x,
                  style: TmText.body(size: 14, weight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      if (campaign.contentReuse)
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: TmColors.cream,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Content reuse: ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text:
                      '${campaign.brand.name} may reuse your approved '
                      'content on its own channels and ads. You agreed '
                      'to this when you applied.',
                ),
              ],
            ),
            style: TmText.small(color: TmColors.ink, height: 1.45),
          ),
        ),
    ],
  );
}

class MaterialsCard extends StatelessWidget {
  const MaterialsCard({super.key, required this.campaign});
  final Campaign campaign;

  @override
  Widget build(BuildContext context) => DealSection(
    title: 'Brand materials',
    trailing: Text('${campaign.materials.length} files', style: TmText.small()),
    children: [
      for (final f in campaign.materials)
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: TmColors.cream,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TmIcon(TmIcons.photo, size: 16),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  f,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TmText.body(size: 14, weight: FontWeight.w700),
                ),
              ),
              TmButton.ghost(
                label: 'Download',
                small: true,
                expand: false,
                onPressed: () => ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Downloading $f'))),
              ),
            ],
          ),
        ),
    ],
  );
}

class UpdatesCard extends StatelessWidget {
  const UpdatesCard({super.key, required this.deal});
  final Deal deal;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return DealSection(
      title: 'Updates',
      trailing: Text('Synced with the brand', style: TmText.small()),
      children: [
        TimelineList(
          entries: [
            for (final e in deal.log)
              TimelineEntry(
                text: e.text,
                when: TmDates.ago(e.at, now),
                actor: switch (e.actor) {
                  Actor.brand => TimelineActor.brand,
                  Actor.you => TimelineActor.you,
                  null => null,
                },
              ),
          ],
        ),
      ],
    );
  }
}
