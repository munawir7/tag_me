import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/widgets/widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.paddingOf(context);
    return Scaffold(
      backgroundColor: TmColors.ink,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(32, pad.top + 40, 32, 8),
              child: const Center(
                child: SizedBox(width: 320, child: TagLogo()),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: ScallopEdge.up()),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: TmColors.cream,
              padding: EdgeInsets.fromLTRB(28, 22, 28, pad.bottom + 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Collabs for every creator.', style: TmText.display(36)),
                  const SizedBox(height: 16),
                  Text(
                    'Barter deals, product drops, event entry and exclusive '
                    'offers from brands near you.',
                    style: TmText.body(
                      size: 16,
                      color: TmColors.sub,
                      height: 1.45,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 24),
                  TmButton(
                    label: 'Get started',
                    onPressed: () => context.push(Routes.intro),
                  ),
                  const SizedBox(height: 8),
                  TmLinkButton(
                    label: 'I already have an account',
                    onPressed: () => context.push(Routes.register),
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
