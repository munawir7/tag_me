import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../app/routes.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/widgets/widgets.dart';
import '../../collabs/application/collabs_providers.dart';
import '../../deals/application/deal_providers.dart';
import '../../deals/domain/apply_eligibility.dart';
import '../../deals/domain/deal.dart';
import '../../deals/domain/deal_repository.dart';
import '../../wallet/application/wallet_providers.dart';
import '../application/campaign_providers.dart';
import '../domain/campaign.dart';
import 'campaign_ui.dart';

class ApplyPage extends ConsumerWidget {
  const ApplyPage({super.key, required this.campaignId});
  final String campaignId;

  @override
  Widget build(BuildContext context, WidgetRef ref) => ref
      .watch(campaignProvider(campaignId))
      .when(
        loading: () => const Scaffold(body: TmLoading()),
        error: (_, _) => const Scaffold(body: Center(child: TmErrorView())),
        data: (c) => c == null
            ? const Scaffold(
                body: Center(
                  child: TmErrorView(
                    message: 'This campaign is no longer available.',
                  ),
                ),
              )
            : _ApplyForm(campaign: c),
      );
}

class _ApplyForm extends ConsumerStatefulWidget {
  const _ApplyForm({required this.campaign});
  final Campaign campaign;

  @override
  ConsumerState<_ApplyForm> createState() => _ApplyFormState();
}

class _ApplyFormState extends ConsumerState<_ApplyForm> {
  final _note = TextEditingController();
  var _agreed = true;
  var _busy = false;
  var _done = false;

  @override
  void dispose() {
    _note.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _busy = true);
    final messenger = ScaffoldMessenger.of(context);
    try {
      await ref.read(applyToCampaignProvider)(
        widget.campaign,
        note: _note.text,
      );
      if (mounted) setState(() => _done = true);
    } on InsufficientCreditsError catch (e) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            'You need ${e.needed} credits but have ${e.available}. Top up first.',
          ),
        ),
      );
    } on ApplyNotAllowedError catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(applyBlockMessage(e.reason))),
      );
    } on DealActionError catch (e) {
      messenger.showSnackBar(SnackBar(content: Text(e.message)));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.campaign;
    if (_done) return _AppliedView(campaign: c);

    final isRequest = c.type == CampaignType.drop;
    final available = ref.watch(walletProvider).value?.available ?? 0;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 30),
          children: [
            Row(
              children: [
                TmBackButton(
                  label: 'Campaign',
                  onPressed: () => context.popOrGo(),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    isRequest ? 'Confirm request' : 'Confirm application',
                    style: TmText.body(weight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TicketCard(
              topColor: Colors.white,
              radius: 22,
              notchSize: 22,
              topPadding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
              bottomPadding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              top: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${c.brand.name} · ${c.type.label}',
                    style: TmText.small(),
                  ),
                  const SizedBox(height: 6),
                  Text(c.title, style: TmText.display(26)),
                  const SizedBox(height: 6),
                  Text(c.contentShort, style: TmText.small()),
                ],
              ),
              bottom: Column(
                children: [
                  _Line('Your balance', '$available credits'),
                  const SizedBox(height: 10),
                  _Line(
                    'This ${isRequest ? 'request' : 'application'}',
                    '− ${c.credits} credits',
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Left after',
                          style: TmText.body(weight: FontWeight.w700),
                        ),
                      ),
                      Text(
                        '${available - c.credits}',
                        style: TmText.display(20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (c.type.shipsProduct) ...[
              const SizedBox(height: 16),
              DashedBorder(
                color: TmColors.sandDark,
                strokeWidth: 2,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TmIcon(TmIcons.drop, size: 22),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text.rich(
                          const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Delivery address: ',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              TextSpan(
                                text:
                                    "if approved, you'll confirm where the "
                                    "brand ships the product. It's the first "
                                    'step after approval.',
                              ),
                            ],
                          ),
                          style: TmText.body(size: 14, height: 1.45),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Note to the brand '),
                  TextSpan(
                    text: '(optional)',
                    style: TmText.body(size: 14, color: TmColors.sub),
                  ),
                ],
              ),
              style: TmText.body(size: 14, weight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _note,
              minLines: 2,
              maxLines: 4,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                hintText: "Why you'd be a great fit",
              ),
            ),
            const SizedBox(height: 16),
            TmCheckbox(
              value: _agreed,
              onChanged: (v) => setState(() => _agreed = v),
              label: c.agreement,
            ),
            const SizedBox(height: 16),
            Text(
              'Credits are held until the brand decides. Not approved? They '
              'come back.',
              textAlign: TextAlign.center,
              style: TmText.small(),
            ),
            const SizedBox(height: 12),
            TmButton(
              label: _busy
                  ? 'Sending…'
                  : 'Spend ${c.credits} credits and ${c.type.applyVerb}',
              onPressed: _agreed && !_busy ? _submit : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Text(label, style: TmText.body(color: TmColors.sub)),
      ),
      Text(value, style: TmText.body(weight: FontWeight.w700)),
    ],
  );
}

/// Full-screen "Applied!" confirmation.
class _AppliedView extends ConsumerWidget {
  const _AppliedView({required this.campaign});
  final Campaign campaign;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = campaign;
    return Scaffold(
      backgroundColor: TmColors.ink,
      body: LayoutBuilder(
        builder: (context, box) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: box.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 380 + MediaQuery.paddingOf(context).top,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.paddingOf(context).top,
                        ),
                        child: Rosette(
                          size: 290,
                          lobes: 20,
                          ringColor: TmColors.inkLine,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const TmIcon(
                                TmIcons.check,
                                size: 52,
                                color: TmColors.ink,
                                strokeWidth: 2.6,
                              ),
                              Text(
                                c.type == CampaignType.drop
                                    ? 'Requested!'
                                    : 'Applied!',
                                style: TmText.display(42),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const ScallopEdge.up(),
                  Expanded(
                    child: Container(
                      color: TmColors.cream,
                      padding: EdgeInsets.fromLTRB(
                        24,
                        22,
                        24,
                        24 + MediaQuery.paddingOf(context).bottom,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Fingers crossed.', style: TmText.display(30)),
                          const SizedBox(height: 12),
                          Text(
                            c.afterApply,
                            style: TmText.body(
                              color: TmColors.sub,
                              height: 1.5,
                            ),
                          ),
                          const Spacer(),
                          const SizedBox(height: 20),
                          if (kDebugMode) ...[
                            DashedBorder(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Prototype: the brand replies in about 4 '
                                  'seconds. A notification pops up.',
                                  style: TmText.small(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                          TmButton(
                            label: 'Track my application',
                            onPressed: () {
                              ref
                                  .read(collabsTabProvider.notifier)
                                  .select(CollabBucket.applied);
                              ref
                                  .read(collabsTypeFilterProvider.notifier)
                                  .select(null);
                              context.go(Routes.collabs);
                            },
                          ),
                          TmLinkButton(
                            label: 'Keep browsing',
                            onPressed: () => context.go(Routes.home),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
