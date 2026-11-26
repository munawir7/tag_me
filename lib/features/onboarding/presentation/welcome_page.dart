import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/widgets/widgets.dart';
import '../../profile/application/profile_providers.dart';
import '../../wallet/application/wallet_providers.dart';
import '../../wallet/domain/wallet_repository.dart';

/// Step 1: claim the AED 50 joining bonus. Step 2 (optional): a friend's
/// referral code.
class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  var _step = 1;
  var _claimed = false;
  var _busy = false;

  Future<void> _claim() async {
    setState(() => _busy = true);
    try {
      await ref.read(claimWelcomeBonusProvider)();
      setState(() => _claimed = true);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) =>
      _step == 1 ? _bonus(context) : const _Referral();

  Widget _bonus(BuildContext context) {
    final first = ref.watch(creatorProvider).value?.firstName;
    final pad = MediaQuery.paddingOf(context);
    return Scaffold(
      backgroundColor: TmColors.ink,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(28, pad.top + 30, 28, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Eyebrow('Welcome bonus', color: TmColors.lime),
                  const SizedBox(height: 8),
                  Text(
                    "You're in,\n${first ?? 'creator'}!",
                    style: TmText.display(
                      52,
                      color: TmColors.cream,
                      height: 0.92,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Rosette(
                      size: 290,
                      lobes: 20,
                      ringColor: TmColors.inkLine,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'AED',
                            style: TmText.body(
                              size: 16,
                              weight: FontWeight.w700,
                            ).copyWith(letterSpacing: 1.6),
                          ),
                          Text('50', style: TmText.display(96, height: 1)),
                          Text(
                            _claimed ? 'added as credits ✓' : 'joining bonus',
                            style: TmText.body(weight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: ScallopEdge.up()),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: TmColors.cream,
              padding: EdgeInsets.fromLTRB(24, 22, 24, pad.bottom + 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _claimed
                        ? 'AED 50 in credits is in your wallet, valid for 1 '
                              'year. Use it on your first collabs.'
                        : 'Claim your AED 50 welcome bonus in credits. Enough '
                              'for your first small collabs, valid for 1 year.',
                    style: TmText.body(
                      size: 16,
                      color: TmColors.sub,
                      height: 1.45,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 20),
                  const _StepDots(step: 1),
                  const SizedBox(height: 14),
                  if (_claimed)
                    TmButton(
                      label: 'Continue',
                      onPressed: () => setState(() => _step = 2),
                    )
                  else
                    TmButton(
                      label: _busy ? 'Claiming…' : 'Claim AED 50 bonus',
                      onPressed: _busy ? null : _claim,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Referral extends ConsumerStatefulWidget {
  const _Referral();

  @override
  ConsumerState<_Referral> createState() => _ReferralState();
}

class _ReferralState extends ConsumerState<_Referral> {
  final _code = TextEditingController();
  String? _added;
  String? _error;
  var _busy = false;

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  Future<void> _add() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final code = _code.text.trim().toUpperCase();
      await ref.read(addReferrerProvider)(code);
      setState(() => _added = code);
    } on InvalidPromoCodeError {
      setState(() => _error = 'Check the code, e.g. MAYA-TM25');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.paddingOf(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                pad.top + 24,
                20,
                pad.bottom + 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Eyebrow('Step 2 of 2 · optional'),
                  const SizedBox(height: 8),
                  Text(
                    'Invited by\na friend?',
                    style: TmText.display(40, height: 0.98),
                  ),
                  const SizedBox(height: 14),
                  if (_added != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: TmColors.lime,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '✓ Code added. $_added gets their referral reward.',
                        style: TmText.body(size: 13, weight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Thanks! Your own code to invite friends is in Credits.',
                      style: TmText.body(color: TmColors.sub),
                    ),
                  ] else ...[
                    Text(
                      'Enter their referral code so they get their reward. '
                      "You've already received your AED 50 welcome bonus, so "
                      "there's no second bonus for you.",
                      style: TmText.body(
                        size: 16,
                        color: TmColors.sub,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Friend's referral code",
                      style: TmText.body(size: 14, weight: FontWeight.w700),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _code,
                      textCapitalization: TextCapitalization.characters,
                      onSubmitted: (_) => _add(),
                      decoration: InputDecoration(
                        hintText: 'e.g. MAYA-TM25',
                        errorText: _error,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TmButton.ghost(
                      label: _busy ? 'Adding…' : 'Add code',
                      onPressed: _busy ? null : _add,
                    ),
                  ],
                  const Spacer(),
                  const SizedBox(height: 20),
                  const _StepDots(step: 2),
                  const SizedBox(height: 14),
                  TmButton(
                    label: _added != null
                        ? 'Find my first collab'
                        : 'Skip and find my first collab',
                    onPressed: () => context.go(Routes.home),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepDots extends StatelessWidget {
  const _StepDots({required this.step});
  final int step;

  @override
  Widget build(BuildContext context) => Semantics(
    label: 'Step $step of 2',
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 1; i <= 2; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: i == step ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: i == step ? TmColors.ink : TmColors.sandDark,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
      ],
    ),
  );
}
