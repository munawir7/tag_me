import 'package:flutter/material.dart';

import '../../../app/router.dart';
import '../../../app/routes.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/widgets/widgets.dart';

/// Developer screen that shows every shared widget. Not part of the
/// shipped app; remove it from the routes before release.
class UiKitPage extends StatefulWidget {
  const UiKitPage({super.key});

  @override
  State<UiKitPage> createState() => _UiKitPageState();
}

class _UiKitPageState extends State<UiKitPage> {
  TmTab _tab = TmTab.home;
  String _filter = 'All';
  bool _food = true;

  void _snack(String m) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          HeroHeader(
            eyebrow: 'Barter · Glowhaus Skincare',
            title: 'Vitamin C serum kit',
            backLabel: 'My collabs',
            onBack: () => context.popOrGo(Routes.profile),
            trailing: const TurnPill('Your turn', waiting: false),
            bottom: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StepBars(total: 8, current: 2),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Script review',
                      style: TmText.small(
                        color: TmColors.lime,
                        weight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Step 3 of 8',
                      style: TmText.small(color: TmColors.onInkMuted),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 6, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _section('Typography'),
                Text(
                  'Test every flow',
                  style: TmText.display(40, height: 0.95),
                ),
                const SizedBox(height: 6),
                Text(
                  'Collabs for every creator.',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 6),
                Text(
                  'Barter deals, product drops, event entry and exclusive '
                  'offers from brands near you.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 6),
                const Eyebrow('You get'),

                _section('Buttons'),
                TmButton(
                  label: 'Apply now',
                  onPressed: () => _snack('Primary'),
                ),
                const SizedBox(height: 8),
                TmButton.ghost(label: 'Track delivery', onPressed: () {}),
                const SizedBox(height: 8),
                TmButton.lime(label: 'Top up credits', onPressed: () {}),
                const SizedBox(height: 8),
                TmButton.dashed(label: '+ Add a new address', onPressed: () {}),
                const SizedBox(height: 8),
                const TmButton(
                  label: 'Select an address to continue',
                  onPressed: null,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    TmButton(
                      label: 'Apply',
                      small: true,
                      expand: false,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8),
                    TmButton.lime(
                      label: 'My QR',
                      small: true,
                      expand: false,
                      icon: const TmIcon(TmIcons.qr, size: 18),
                      onPressed: () {},
                    ),
                  ],
                ),
                TmLinkButton(
                  label: 'I already have an account',
                  onPressed: () {},
                ),

                _section('Pills and chips'),
                const Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  children: [
                    TmPill('Your turn', style: TmPillStyle.you),
                    TmPill('Waiting on brand', style: TmPillStyle.brand),
                    TmPill('Not approved', style: TmPillStyle.grey),
                    TmPill('Completed', style: TmPillStyle.dark),
                    TmPill('✕ Script rejected', style: TmPillStyle.rejected),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    const TmChip('UAE address'),
                    TmChip(
                      'Food',
                      selected: _food,
                      onTap: () => setState(() => _food = !_food),
                    ),
                    TmChip('+ TikTok', dashed: true, onTap: () {}),
                  ],
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (final f in [
                        'All',
                        'Barter',
                        'Product drop',
                        'Event',
                      ])
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: TmFilterChip(
                            f,
                            selected: _filter == f,
                            onTap: () => setState(() => _filter = f),
                          ),
                        ),
                    ],
                  ),
                ),

                _section('Icons'),
                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    for (final i in TmIcons.values) TmIcon(i, size: 22),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    TmIconButton(
                      icon: TmIcons.bell,
                      tooltip: 'Notifications',
                      badgeCount: 2,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 12),
                    const TmBackButton(),
                  ],
                ),

                _section('Cards'),
                TmCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Eyebrow('You get'),
                      const SizedBox(height: 8),
                      Text(
                        'The full Vitamin C kit (serum, toner, SPF), yours to keep.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TmCard(
                  borderColor: TmColors.ink,
                  onTap: () {},
                  child: const Text('Outlined, tappable card'),
                ),
                const SizedBox(height: 8),
                const TmCard(
                  child: StepBars(
                    total: 8,
                    current: 5,
                    tone: StepBarsTone.onLight,
                  ),
                ),

                _section('Rosettes'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CompletedBadge(),
                    Rosette(
                      size: 124,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('[XX]', style: TmText.display(32)),
                          Text(
                            'available',
                            style: TmText.small(
                              color: TmColors.ink,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                _section('Timeline'),
                const TmCard(
                  child: TimelineList(
                    entries: [
                      TimelineEntry(
                        actor: TimelineActor.brand,
                        when: '1h ago',
                        text: 'Rejected script v1 · see chat',
                      ),
                      TimelineEntry(
                        actor: TimelineActor.you,
                        when: 'Yesterday',
                        text: 'Sent script v1',
                      ),
                      TimelineEntry(
                        actor: TimelineActor.brand,
                        when: '12 Nov',
                        text: 'Approved your application',
                      ),
                    ],
                  ),
                ),

                _section('Ticket'),
                TicketCard(
                  top: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'EVENT ENTRY · ENTRY CODE',
                              overflow: TextOverflow.ellipsis,
                              style: TmText.eyebrow(color: TmColors.lime),
                            ),
                          ),
                          Text(
                            'tagme',
                            style: TmText.display(16, color: TmColors.lime),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Rooftop Jazz Night',
                        style: TmText.display(30, color: TmColors.cream),
                      ),
                      Text(
                        'Skyline Lounge',
                        style: TmText.small(color: TmColors.onInkMuted),
                      ),
                    ],
                  ),
                  bottom: Column(
                    children: [
                      const TmIcon(TmIcons.qr, size: 120, strokeWidth: 1.4),
                      const SizedBox(height: 10),
                      Text(
                        'TM-EVT-1907',
                        style: TmText.display(22).copyWith(letterSpacing: 1.8),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: TmColors.ink,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              'Ink block',
              style: TmText.body(color: TmColors.onInkMuted),
            ),
          ),
          const ScallopEdge.up(),
          const SizedBox(height: 24),
        ],
      ),
      bottomNavigationBar: TmBottomNav(
        current: _tab,
        onSelect: (t) => setState(() => _tab = t),
      ),
    );
  }

  Widget _section(String title) => Padding(
    padding: const EdgeInsets.only(top: 28, bottom: 12),
    child: Text(title, style: TmText.display(22)),
  );
}
