import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/widgets/widgets.dart';
import '../../profile/application/profile_providers.dart';
import '../application/session_controller.dart';

/// "We're checking" after sign-up; becomes "You're verified!" once the
/// TagMe team approves.
class ReviewPage extends ConsumerWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verified = ref.watch(sessionProvider) == SessionStatus.verified;
    final creator = ref.watch(creatorProvider).value;
    final first = creator?.firstName;
    final hasLicence = creator?.licence != null;
    final top = MediaQuery.paddingOf(context).top;

    // (label, sub, state) — state: 1 done, 2 in progress, 0 waiting.
    final steps = [
      ('Account created', 'Just now', 1),
      ('Handles and followers check', 'TagMe team', verified ? 1 : 2),
      (
        hasLicence ? 'Licence check' : 'Licence check (if added)',
        hasLicence ? 'TagMe team' : 'Skipped, add it any time',
        verified ? 1 : 0,
      ),
      (
        'Account live · welcome bonus unlocked',
        verified ? 'Approved' : 'Usually within 24–48 hours',
        verified ? 1 : 0,
      ),
    ];

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: TmColors.ink,
            padding: EdgeInsets.fromLTRB(24, top + 30, 24, 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Eyebrow(
                  verified ? 'Verified' : 'Account under review',
                  color: TmColors.lime,
                ),
                const SizedBox(height: 12),
                Text(
                  verified
                      ? "You're verified!"
                      : 'Thanks${first == null ? '' : ', $first'}.\n'
                            "We're checking.",
                  style: TmText.display(
                    42,
                    color: TmColors.cream,
                    height: 0.95,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  verified
                      ? 'The TagMe team approved your profile. Your account '
                            'is live.'
                      : 'Every creator is checked by the TagMe team before '
                            'going live. You can browse campaigns meanwhile; '
                            'applying unlocks after approval.',
                  style: TmText.body(color: TmColors.onInkMuted, height: 1.45),
                ),
              ],
            ),
          ),
          const ScallopEdge.down(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TmCard(
                  child: Column(
                    children: [
                      for (final (i, (label, sub, state)) in steps.indexed)
                        _Step(
                          label: label,
                          sub: sub,
                          state: state,
                          last: i == steps.length - 1,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                if (verified)
                  TmButton(
                    label: 'Claim my welcome bonus',
                    onPressed: () => context.go(Routes.welcome),
                  )
                else ...[
                  Text(
                    "We'll notify you on the app and WhatsApp. If something's "
                    "missing, we'll tell you exactly what to fix.",
                    style: TmText.small(height: 1.45),
                  ),
                  const SizedBox(height: 14),
                  TmButton(
                    label: 'Browse campaigns',
                    onPressed: () => context.go(Routes.home),
                  ),
                  if (kDebugMode) ...[
                    const SizedBox(height: 10),
                    TmButton.dashed(
                      label: 'Prototype: TagMe team approves →',
                      onPressed: () =>
                          ref.read(sessionProvider.notifier).approve(),
                    ),
                  ],
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({
    required this.label,
    required this.sub,
    required this.state,
    required this.last,
  });

  final String label;
  final String sub;
  final int state;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final done = state == 1;
    final now = state == 2;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: done
                      ? TmColors.ink
                      : now
                      ? TmColors.lime
                      : Colors.white,
                  border: done
                      ? null
                      : Border.all(
                          color: now ? TmColors.ink : TmColors.disabled,
                          width: 2,
                        ),
                ),
                child: done
                    ? const TmIcon(
                        TmIcons.check,
                        size: 12,
                        color: TmColors.lime,
                        strokeWidth: 3,
                      )
                    : null,
              ),
              if (!last)
                Expanded(
                  child: Container(
                    width: 2,
                    color: done ? TmColors.ink : TmColors.line,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: last ? 0 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TmText.body(
                      weight: state == 0 ? FontWeight.w500 : FontWeight.w700,
                      color: state == 0 ? TmColors.muted : TmColors.ink,
                    ),
                  ),
                  Text(sub, style: TmText.small()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
