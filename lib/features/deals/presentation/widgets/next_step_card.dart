import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routes.dart';
import '../../../../core/theme/tm_colors.dart';
import '../../../../core/theme/tm_text.dart';
import '../../../../core/utils/dates.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../campaigns/domain/campaign.dart';
import '../../../profile/application/profile_providers.dart';
import '../../../profile/presentation/widgets/add_address_sheet.dart';
import '../../application/deal_providers.dart';
import '../../domain/deal.dart';
import '../../domain/deal_deadlines.dart';
import '../deal_ui.dart';

/// "YOUR NEXT STEP" card: different content for every stage.
class NextStepCard extends StatelessWidget {
  const NextStepCard({super.key, required this.deal, this.campaign});
  final Deal deal;
  final Campaign? campaign;

  /// Wording for the due badge; the date itself comes from the domain.
  String? get _due {
    final d = deal;
    if (d.stage == DealStage.address) return 'Confirm within 1 day';
    final date = DealDeadlines.currentDue(d, campaign);
    if (date == null) return null;
    final prefix = switch (d.stage) {
      DealStage.delivery => 'Deliver by',
      DealStage.shoot =>
        d.type == CampaignType.event ? 'Event day' : 'Shoot by',
      DealStage.upload || DealStage.contentReview => 'Upload by',
      DealStage.voucher =>
        d.type == CampaignType.event ? 'Event' : 'Valid till',
      _ => 'Due',
    };
    return '$prefix ${TmDates.short(date)}';
  }

  @override
  Widget build(BuildContext context) {
    final d = deal;
    final heading = d.isBrandsTurn
        ? 'Status'
        : d.stage == DealStage.done
        ? 'Done'
        : d.isClosed
        ? 'Closed'
        : 'Your next step';
    final due = _due;

    final Widget body = switch (d.stage) {
      DealStage.applied => _Applied(deal: d),
      DealStage.address => _Address(deal: d),
      DealStage.script => _Script(deal: d, campaign: campaign),
      DealStage.scriptReview || DealStage.contentReview => _InReview(deal: d),
      DealStage.delivery => _Delivery(deal: d),
      DealStage.choose => _Choose(deal: d),
      DealStage.shoot => _Shoot(deal: d, campaign: campaign),
      DealStage.upload => _Upload(deal: d),
      DealStage.voucher => _Voucher(deal: d),
      DealStage.done => _Done(deal: d, campaign: campaign),
      _ => _Closed(deal: d),
    };

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
      child: TmCard(
        radius: 24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                Eyebrow(heading),
                if (due != null && !d.isClosed) _DueBadge(due),
              ],
            ),
            const SizedBox(height: 14),
            body,
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared bits
// ---------------------------------------------------------------------------

class _DueBadge extends StatelessWidget {
  const _DueBadge(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: TmColors.ink,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TmIcon(
          TmIcons.clock,
          size: 14,
          color: TmColors.lime,
          strokeWidth: 2.4,
        ),
        const SizedBox(width: 6),
        // Shrinks with "…" on narrow screens / large text.
        Flexible(
          child: Text(
            '$text · set by brand',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TmText.body(
              size: 12,
              weight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

class _OkBar extends StatelessWidget {
  const _OkBar(this.text, {this.warn = false});
  final String text;
  final bool warn;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
      color: warn ? TmColors.warnBg : TmColors.lime,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      text,
      style: TmText.body(
        size: 13,
        weight: FontWeight.w700,
        color: warn ? TmColors.warnText : TmColors.ink,
      ),
    ),
  );
}

class _Title extends StatelessWidget {
  const _Title(this.text);
  final String text;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: TmText.display(24, height: 1.1));
}

class _Para extends StatelessWidget {
  const _Para(this.text);
  final String text;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: TmText.body(size: 14, height: 1.45));
}

class _DevNote extends StatelessWidget {
  const _DevNote(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => DashedBorder(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Text('Prototype: $text', style: TmText.small()),
    ),
  );
}

/// Spaces children 12px apart.
class _Gap extends StatelessWidget {
  const _Gap(this.children);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      for (var i = 0; i < children.length; i++) ...[
        if (i > 0) const SizedBox(height: 12),
        children[i],
      ],
    ],
  );
}

/// "Tapped received by mistake? Undo".
class _UndoReceived extends ConsumerWidget {
  const _UndoReceived({required this.deal});
  final Deal deal;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
    padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
    decoration: BoxDecoration(
      color: TmColors.cream,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(
            'Tapped “received” by mistake?',
            style: TmText.small(color: TmColors.ink),
          ),
        ),
        TmButton.ghost(
          label: 'Undo',
          small: true,
          expand: false,
          onPressed: () => runDealAction(
            context,
            () => ref.read(undoReceivedProvider)(deal.id),
          ),
        ),
      ],
    ),
  );
}

// ---------------------------------------------------------------------------
// Stages
// ---------------------------------------------------------------------------

class _Applied extends ConsumerWidget {
  const _Applied({required this.deal});
  final Deal deal;

  @override
  Widget build(BuildContext context, WidgetRef ref) => _Gap([
    const _Title('Application in review'),
    _Para(
      '${deal.credits} credits are on hold. If the brand picks other '
      "creators, they come back. We'll notify you on the app and WhatsApp.",
    ),
    TmLinkButton(
      label: "I can't do it, withdraw",
      onPressed: () => runDealAction(
        context,
        () => ref.read(withdrawFromDealProvider)(deal.id),
      ),
    ),
  ]);
}

class _Address extends ConsumerStatefulWidget {
  const _Address({required this.deal});
  final Deal deal;

  @override
  ConsumerState<_Address> createState() => _AddressState();
}

class _AddressState extends ConsumerState<_Address> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    final addresses = ref.watch(creatorProvider).value?.addresses ?? const [];
    final d = widget.deal;
    return _Gap([
      _OkBar(
        '✓ ${d.type == CampaignType.drop ? 'Request' : 'Application'} '
        'approved by ${d.brandName}',
      ),
      const _Title('Confirm your delivery address'),
      const _Para(
        'Required before you continue. The brand ships the product '
        'here.',
      ),
      for (final a in addresses)
        Semantics(
          selected: _selected == a.id,
          child: Material(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: _selected == a.id ? TmColors.ink : TmColors.line2,
                width: _selected == a.id ? 2 : 1.5,
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => setState(() => _selected = a.id),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(top: 1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _selected == a.id ? TmColors.lime : null,
                        border: Border.all(
                          color: _selected == a.id
                              ? TmColors.ink
                              : TmColors.disabled,
                          width: _selected == a.id ? 6 : 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${a.label} · ${a.recipient}',
                            style: TmText.body(weight: FontWeight.w700),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${a.line} · ${a.phone}',
                            style: TmText.small(
                              color: TmColors.body,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      TmButton.dashed(
        label: '+ Add a new address',
        onPressed: () async {
          final added = await showAddAddressSheet(context);
          if (added != null && mounted) setState(() => _selected = added.id);
        },
      ),
      TmButton(
        label: _selected == null
            ? 'Select an address to continue'
            : 'Confirm this address',
        onPressed: _selected == null
            ? null
            : () => runDealAction(
                context,
                () =>
                    ref.read(confirmDeliveryAddressProvider)(d.id, _selected!),
              ),
      ),
    ]);
  }
}

class _Script extends ConsumerStatefulWidget {
  const _Script({required this.deal, this.campaign});
  final Deal deal;
  final Campaign? campaign;

  @override
  ConsumerState<_Script> createState() => _ScriptState();
}

class _ScriptState extends ConsumerState<_Script> {
  late final _text = TextEditingController(text: widget.deal.scriptText);

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.deal;
    final brief = widget.campaign?.brief;
    return _Gap([
      if (!d.needsFix && d.type.shipsProduct)
        const _OkBar('✓ Delivery address confirmed'),
      _Title(d.needsFix ? 'Rework your script' : 'Write your script'),
      if (brief != null)
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: TmColors.ink, width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Eyebrow("Brand's script brief"),
              const SizedBox(height: 6),
              Text(brief, style: TmText.body(size: 14, height: 1.5)),
            ],
          ),
        ),
      Text(
        'Your script',
        style: TmText.body(size: 14, weight: FontWeight.w700),
      ),
      TextField(
        controller: _text,
        minLines: 5,
        maxLines: 12,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(hintText: 'Scene 1: …\nScene 2: …'),
      ),
      TmButton.dashed(
        label: '+ Attach script doc or storyboard (optional)',
        onPressed: () => showComingSoon(context, 'The file picker'),
      ),
      TmButton(
        label: 'Send script v${d.scriptVersion} to brand',
        onPressed: () => runDealAction(
          context,
          () => ref.read(submitScriptProvider)(d.id, _text.text),
        ),
      ),
    ]);
  }
}

class _InReview extends StatelessWidget {
  const _InReview({required this.deal});
  final Deal deal;

  @override
  Widget build(BuildContext context) {
    final d = deal;
    final script = d.stage == DealStage.scriptReview;
    final steps = [
      (
        script
            ? 'Script v${d.scriptVersion} sent'
            : '${d.contentWordCap} sent (round ${d.contentRound})',
        true,
      ),
      ('Seen by ${d.brandName}', true),
      (
        'Brand decision · ${script ? 'usually within 24 h' : 'usually within 3 days'}',
        false,
      ),
    ];
    return _Gap([
      _Title(script ? 'Script in review' : '${d.contentWordCap} in review'),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: TmColors.cream,
          borderRadius: BorderRadius.circular(16),
        ),
        child: _CheckSteps(steps: steps),
      ),
      const _Para(
        'This can take hours or days. You can leave this page; '
        "we'll notify you on the app and WhatsApp.",
      ),
      Row(
        children: [
          Expanded(
            child: TmButton(
              label: 'My collabs',
              small: true,
              onPressed: () => context.go(Routes.collabs),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TmButton.ghost(
              label: 'Home',
              small: true,
              onPressed: () => context.go(Routes.home),
            ),
          ),
        ],
      ),
      if (kDebugMode)
        const _DevNote(
          'the brand replies in about 4 seconds. A notification '
          'pops up.',
        ),
    ]);
  }
}

/// Vertical list of done / pending steps with round markers.
class _CheckSteps extends StatelessWidget {
  const _CheckSteps({required this.steps, this.current});
  final List<(String, bool)> steps;

  /// Index of the step in progress (lime marker), if any.
  final int? current;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var i = 0; i < steps.length; i++)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: steps[i].$2
                      ? TmColors.ink
                      : i == current
                      ? TmColors.lime
                      : Colors.white,
                  border: steps[i].$2
                      ? null
                      : Border.all(
                          color: i == current ? TmColors.ink : TmColors.line2,
                          width: 2,
                        ),
                ),
                child: steps[i].$2
                    ? const TmIcon(
                        TmIcons.check,
                        size: 12,
                        color: TmColors.lime,
                        strokeWidth: 3,
                      )
                    : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  steps[i].$1,
                  style: TmText.body(
                    size: 14,
                    weight: steps[i].$2 || i == current
                        ? FontWeight.w700
                        : FontWeight.w500,
                    color: steps[i].$2 || i == current
                        ? TmColors.ink
                        : TmColors.disabled,
                  ),
                ),
              ),
            ],
          ),
        ),
    ],
  );
}

class _Delivery extends ConsumerWidget {
  const _Delivery({required this.deal});
  final Deal deal;

  static const _steps = [
    (DeliveryStatus.ready, 'Getting ready'),
    (DeliveryStatus.packed, 'Packed'),
    (DeliveryStatus.shipped, 'Shipped'),
    (DeliveryStatus.outForDelivery, 'Out for delivery'),
    (DeliveryStatus.delivered, 'Delivered'),
  ];

  Future<void> _report(BuildContext context, WidgetRef ref) async {
    final reason = await showTmSheet<String>(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
            child: Text('What went wrong?', style: TmText.display(22)),
          ),
          for (final r in const [
            'Not received',
            'Damaged',
            'Wrong item',
            'Something missing',
          ])
            ListTile(
              title: Text(r, style: TmText.body(weight: FontWeight.w600)),
              onTap: () => Navigator.pop(context, r),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
    if (reason != null && context.mounted) {
      await runDealAction(
        context,
        () => ref.read(reportDeliveryProblemProvider)(deal.id, reason),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final d = deal;
    final v = d.delivery;
    final addresses = ref.watch(creatorProvider).value?.addresses ?? const [];
    final addr = addresses.where((a) => a.id == d.addressId).firstOrNull;
    if (v == null) return const _Para('Waiting for delivery details.');

    if (v.status == DeliveryStatus.issue) {
      return _Gap([
        _OkBar('Delivery problem reported: ${v.issue ?? ''}', warn: true),
        _Title('${d.brandName.split(' ').first} is sorting it out'),
        const _Para(
          "The brand's logistics team sees your report and will "
          'reship. Your deadlines move if the delivery is late.',
        ),
        if (kDebugMode) const _DevNote('the brand reships in a few seconds.'),
      ]);
    }

    final si = v.status == DeliveryStatus.hold
        ? -1
        : _steps.indexWhere((s) => s.$1 == v.status);
    final shipped = si >= 2;
    final late = v.eta != null && v.eta!.isAfter(v.deliverBy);
    final now = DateTime.now();

    return _Gap([
      _OkBar(
        d.type == CampaignType.drop
            ? '✓ Address confirmed'
            : '✓ Script approved by the brand',
      ),
      _Title(switch (v.status) {
        DeliveryStatus.delivered => 'Delivered. Did you get it?',
        DeliveryStatus.shipped ||
        DeliveryStatus.outForDelivery => 'Your order is on its way',
        _ => 'The brand is preparing your order',
      }),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: TmColors.cream,
          borderRadius: BorderRadius.circular(16),
        ),
        child: _CheckSteps(
          steps: [
            for (var i = 0; i < _steps.length; i++)
              (_steps[i].$2, i < si || v.status == DeliveryStatus.delivered),
          ],
          current: si < 0 ? null : si,
        ),
      ),
      Text.rich(
        TextSpan(
          children: [
            const TextSpan(text: 'Deliver by '),
            TextSpan(
              text: TmDates.short(v.deliverBy),
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            TextSpan(text: ' (${TmDates.relative(v.deliverBy, now)})'),
            if (addr != null) ...[
              const TextSpan(text: ' to '),
              TextSpan(
                text: addr.short,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
            if (v.trackingNo != null) ...[
              TextSpan(text: '\n${v.courier} · tracking '),
              TextSpan(
                text: v.trackingNo,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
            if (v.eta != null) ...[
              const TextSpan(text: ' · ETA '),
              TextSpan(
                text: TmDates.short(v.eta!),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ],
        ),
        style: TmText.body(size: 14, height: 1.5),
      ),
      if (v.trackingNo == null)
        Text(
          'Tracking appears here once the brand ships.',
          style: TmText.small(),
        ),
      if (late)
        Text(
          'Running late. The brand has been told.',
          style: TmText.body(
            size: 14,
            weight: FontWeight.w700,
            color: TmColors.warnText,
          ),
        ),
      if (v.trackingNo != null)
        TmButton.ghost(
          label: 'Track delivery',
          small: true,
          onPressed: () => context.push(Routes.tracking(d.id)),
        ),
      if (shipped) ...[
        TmButton(
          label: "I've received it",
          onPressed: () => runDealAction(
            context,
            () => ref.read(markReceivedProvider)(d.id),
          ),
        ),
        TmButton.ghost(
          label: 'Report a delivery problem',
          small: true,
          onPressed: () => _report(context, ref),
        ),
      ],
    ]);
  }
}

class _Choose extends ConsumerWidget {
  const _Choose({required this.deal});
  final Deal deal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final choose = ref.read(chooseContentProvider);
    return _Gap([
      const Eyebrow('Enjoy it'),
      const _Title('Will you make content with it?'),
      TmButton(
        label: "Yes, I'll upload content",
        onPressed: () =>
            runDealAction(context, () => choose(deal.id, makeContent: true)),
      ),
      TmButton.ghost(
        label: 'No, finish without content',
        small: true,
        onPressed: () =>
            runDealAction(context, () => choose(deal.id, makeContent: false)),
      ),
      Text(
        'Both are fine. The brand just sees your choice.',
        style: TmText.small(),
      ),
      _UndoReceived(deal: deal),
    ]);
  }
}

class _Shoot extends ConsumerWidget {
  const _Shoot({required this.deal, this.campaign});
  final Deal deal;
  final Campaign? campaign;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final d = deal;
    final proposeDate = ref.read(proposeShootDateProvider);
    final shootDone = ref.read(markShootDoneProvider);
    final today = TmDates.dateOnly(DateTime.now());
    final from = campaign?.dateOf(KeyDateKind.shootFrom);
    final to = campaign?.dateOf(KeyDateKind.shootTo) ?? from;
    final options = [
      ('Today', today),
      ('Tomorrow', today.add(const Duration(days: 1))),
      (
        TmDates.withWeekday(today.add(const Duration(days: 2))),
        today.add(const Duration(days: 2)),
      ),
    ];
    final picked = d.shootDate == null ? null : TmDates.dateOnly(d.shootDate!);
    final isCustom = picked != null && !options.any((o) => o.$2 == picked);

    Future<void> propose(DateTime date) =>
        runDealAction(context, () => proposeDate(d.id, date));

    return _Gap([
      _OkBar(
        d.type == CampaignType.barter
            ? '✓ Kit received'
            : '✓ Script approved by ${d.brandName}',
      ),
      _Title('Shoot your ${d.contentWord}'),
      Text(
        from == null
            ? 'Propose a shoot date'
            : 'Propose a shoot date · window ${TmDates.short(from)}'
                  '${to != null && to != from ? '–${TmDates.short(to)}' : ''}',
        style: TmText.body(size: 13, weight: FontWeight.w700),
      ),
      GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3.4,
        children: [
          for (final (label, date) in options)
            TmFilterChip(
              label,
              selected: picked == date,
              onTap: () => propose(date),
            ),
          TmFilterChip(
            isCustom ? TmDates.short(picked) : 'Pick a date',
            selected: isCustom,
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: today,
                lastDate: today.add(const Duration(days: 90)),
                initialDate: picked ?? today,
              );
              if (date != null) await propose(date);
            },
          ),
        ],
      ),
      TmButton(
        label: 'Shoot done',
        onPressed: () => runDealAction(context, () => shootDone(d.id)),
      ),
      if (d.type == CampaignType.barter) _UndoReceived(deal: d),
    ]);
  }
}

class _Upload extends ConsumerStatefulWidget {
  const _Upload({required this.deal});
  final Deal deal;

  @override
  ConsumerState<_Upload> createState() => _UploadState();
}

class _UploadState extends ConsumerState<_Upload> {
  final _files = <String>[];
  final _link = TextEditingController();

  @override
  void dispose() {
    _link.dispose();
    super.dispose();
  }

  /// Stand-in for the real picker (added with the backend in step 5).
  void _addFile() {
    final d = widget.deal;
    final n = _files.length + 1;
    final base = d.title.split(' ').first;
    setState(
      () => _files.add(
        '${base}_${d.contentWord}${d.contentRound > 1 ? '_v${d.contentRound}' : ''}_$n.mp4',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.deal;
    final drop = d.type == CampaignType.drop;
    return _Gap([
      _Title(
        d.needsFix
            ? 'Re-upload after the fix'
            : drop
            ? 'Upload your content'
            : 'Upload your deliverables for review',
      ),
      for (final f in _files)
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: TmColors.cream,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: TmColors.lime,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TmIcon(TmIcons.video, size: 16),
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
              IconButton(
                tooltip: 'Remove',
                onPressed: () => setState(() => _files.remove(f)),
                icon: const TmIcon(TmIcons.close, size: 16),
              ),
            ],
          ),
        ),
      TmButton.dashed(
        label: drop
            ? '+ Add videos or photos'
            : '+ Add reels, videos or posters',
        onPressed: _addFile,
      ),
      if (drop) ...[
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Post link '),
              TextSpan(
                text: '(optional)',
                style: TmText.body(size: 14, color: TmColors.sub),
              ),
            ],
          ),
          style: TmText.body(size: 14, weight: FontWeight.w700),
        ),
        TextField(
          controller: _link,
          keyboardType: TextInputType.url,
          decoration: const InputDecoration(
            hintText: 'https://instagram.com/reel/…',
          ),
        ),
      ],
      TmButton(
        label: drop
            ? 'Submit and finish'
            : d.needsFix
            ? 'Send round ${d.contentRound} to brand'
            : 'Send for brand review',
        onPressed: _files.isEmpty
            ? null
            : () => runDealAction(
                context,
                () => ref.read(submitContentProvider)(
                  d.id,
                  List.of(_files),
                  postLink: _link.text.trim().isEmpty
                      ? null
                      : _link.text.trim(),
                ),
              ),
      ),
      if (drop)
        Text(
          'No review step. The deal finishes as soon as you submit.',
          style: TmText.small(),
        ),
    ]);
  }
}

class _Voucher extends ConsumerWidget {
  const _Voucher({required this.deal});
  final Deal deal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final d = deal;
    final code = d.code;
    if (code == null) return const _Para('Your code is being generated.');
    final kind = code.kind.label;
    return _Gap([
      _OkBar('✓ ${d.contentWordCap} approved by ${d.brandName}'),
      _Title('Your $kind is ready'),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: TmColors.ink,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Eyebrow(kind, color: TmColors.lime),
                  const SizedBox(height: 2),
                  Text(
                    code.code,
                    style: TmText.display(
                      22,
                      color: TmColors.cream,
                    ).copyWith(letterSpacing: 1.3),
                  ),
                ],
              ),
            ),
            const TmIcon(
              TmIcons.qr,
              size: 40,
              color: TmColors.lime,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
      _Para(code.howToUse),
      if (code.validUntil != null)
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Valid until '),
              TextSpan(
                text: TmDates.short(code.validUntil!),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text:
                    '. ${d.brandName} scans it when you visit, then this '
                    'collab completes by itself.',
              ),
            ],
          ),
          style: TmText.small(color: TmColors.ink, height: 1.45),
        ),
      TmButton(
        label: 'Show QR',
        onPressed: () => context.push(Routes.voucher(d.id)),
      ),
      if (kDebugMode)
        TmButton.dashed(
          label: 'Prototype: brand scans the code',
          onPressed: () =>
              ref.read(devBrandControlsProvider)?.brandRedeemCode(d.id),
        ),
    ]);
  }
}

class _Done extends ConsumerStatefulWidget {
  const _Done({required this.deal, this.campaign});
  final Deal deal;
  final Campaign? campaign;

  @override
  ConsumerState<_Done> createState() => _DoneState();
}

class _DoneState extends ConsumerState<_Done> {
  late final _link = TextEditingController(text: widget.deal.postLink);

  @override
  void dispose() {
    _link.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.deal;
    final c = widget.campaign;
    final postFrom = c?.dateOf(KeyDateKind.postFrom);
    final postTo = c?.dateOf(KeyDateKind.postTo);
    final drop = d.type == CampaignType.drop;
    return _Gap([
      Row(
        children: [
          const CompletedBadge(),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  drop ? 'Finished!' : 'Completed!',
                  style: TmText.display(26),
                ),
                const SizedBox(height: 4),
                Text(
                  '${d.summary} This collab moves to Done.',
                  style: TmText.body(size: 14, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
      if (!drop && postFrom != null && postTo != null)
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: TmColors.cream,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Post between ${TmDates.short(postFrom)} and '
                '${TmDates.short(postTo)}',
                style: TmText.body(size: 14, weight: FontWeight.w700),
              ),
              Text('Keep it up for at least 30 days.', style: TmText.small()),
              const SizedBox(height: 10),
              TextField(
                controller: _link,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  hintText: 'https://instagram.com/reel/…',
                ),
              ),
              const SizedBox(height: 8),
              TmButton(
                label: d.postLink == null
                    ? 'Send link to brand'
                    : 'Update link',
                small: true,
                onPressed: () {
                  final messenger = ScaffoldMessenger.of(context);
                  runDealAction(context, () async {
                    await ref.read(sendPostLinkProvider)(d.id, _link.text);
                    messenger.showSnackBar(
                      const SnackBar(
                        content: Text('Post link sent to the brand'),
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
    ]);
  }
}

class _Closed extends StatelessWidget {
  const _Closed({required this.deal});
  final Deal deal;

  @override
  Widget build(BuildContext context) {
    final d = deal;
    final title = switch (d.stage) {
      DealStage.notApproved => '${d.brandName} picked other creators',
      DealStage.withdrawn => 'You withdrew',
      DealStage.ended => '${d.brandName} ended this collaboration',
      _ => 'This collab expired',
    };
    return _Gap([
      _Title(title),
      if (d.endReason != null)
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: TmColors.warnBg,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'Reason: ',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: d.endReason),
              ],
            ),
            style: TmText.body(size: 14, height: 1.45),
          ),
        ),
      if (d.strike)
        const _Para(
          'The brand added a strike to your account. At 3 strikes '
          'your account is frozen. If you think this is wrong, contact '
          'TagMe support.',
        ),
      Text(d.summary, style: TmText.small()),
      Row(
        children: [
          Expanded(
            child: TmButton(
              label: 'My collabs',
              small: true,
              onPressed: () => context.go(Routes.collabs),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TmButton.ghost(
              label: 'Get help',
              small: true,
              onPressed: () => showComingSoon(context, 'Support chat'),
            ),
          ),
        ],
      ),
    ]);
  }
}
