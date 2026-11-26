import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../app/routes.dart';
import '../../../core/theme/tm_colors.dart';
import '../../../core/theme/tm_text.dart';
import '../../../core/widgets/widgets.dart';

/// Two intro slides: how campaigns work, then how credits work.
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _pages = PageController();
  var _index = 0;

  static const _slides = [
    (
      'Brands post.\nYou pick.',
      'Barter deals, product drops, event entry and exclusive offers, posted '
          'every day. See what you get and the criteria, then apply.',
    ),
    (
      'Spend credits.\nLand collabs.',
      'Each campaign shows its credit cost before you apply. Your first '
          'credits are on us.',
    ),
  ];

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  void _next() => _index == _slides.length - 1
      ? context.push(Routes.register)
      : _pages.nextPage(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
        );

  @override
  Widget build(BuildContext context) {
    final pad = MediaQuery.paddingOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pages,
                  onPageChanged: (i) => setState(() => _index = i),
                  children: [
                    for (final (i, (title, body)) in _slides.indexed)
                      _Slide(
                        art: i == 0 ? const _CardsArt() : const _CreditsArt(),
                        title: title,
                        body: body,
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 8, 20, pad.bottom + 24),
                child: Column(
                  children: [
                    _Dots(count: _slides.length, index: _index),
                    const SizedBox(height: 16),
                    TmButton(
                      label: _index == _slides.length - 1
                          ? 'Create my account'
                          : 'Next',
                      onPressed: _next,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: pad.top + 14,
            left: 20,
            right: 12,
            child: Row(
              children: [
                TmBackButton(
                  onInk: true,
                  onPressed: () => context.popOrGo(Routes.splash),
                ),
                const Spacer(),
                TmLinkButton(
                  label: 'Skip',
                  color: TmColors.cream,
                  onPressed: () => context.push(Routes.register),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({required this.art, required this.title, required this.body});
  final Widget art;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: TmColors.ink,
          height: 400 + MediaQuery.paddingOf(context).top,
          padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
          child: art,
        ),
        const ScallopEdge.down(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TmText.display(46, height: 0.95)),
              const SizedBox(height: 16),
              Text(
                body,
                style: TmText.body(size: 16, color: TmColors.sub, height: 1.45),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// Two tilted campaign cards.
class _CardsArt extends StatelessWidget {
  const _CardsArt();

  Widget _card(String eyebrow, String title, String? brand, double width) =>
      SizedBox(
        width: width,
        child: TmCard(
          padding: const EdgeInsets.fromLTRB(40, 18, 18, 18),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: -24,
                top: 4,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: TmColors.ink,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Eyebrow(eyebrow),
                  const SizedBox(height: 8),
                  Text(title, style: TmText.display(23)),
                  if (brand != null) ...[
                    const SizedBox(height: 6),
                    Text(brand, style: TmText.small()),
                  ],
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => ExcludeSemantics(
    child: Stack(
      children: [
        Positioned(
          left: 30,
          top: 90,
          child: Transform.rotate(
            angle: -7 * math.pi / 180,
            child: _card('Barter', 'Vitamin C kit', 'Glowhaus Skincare', 240),
          ),
        ),
        Positioned(
          right: 24,
          top: 240,
          child: Transform.rotate(
            angle: 6 * math.pi / 180,
            child: _card('Event entry', 'Rooftop Jazz Night', null, 220),
          ),
        ),
      ],
    ),
  );
}

/// The welcome-gift rosette.
class _CreditsArt extends StatelessWidget {
  const _CreditsArt();

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Rosette(
        size: 280,
        lobes: 18,
        ringColor: TmColors.inkLine,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'WELCOME GIFT',
              style: TmText.small(color: TmColors.ink, weight: FontWeight.w700),
            ),
            Text('+50', style: TmText.display(66)),
            Text('free credits', style: TmText.body(weight: FontWeight.w700)),
          ],
        ),
      ),
    ),
  );
}

class _Dots extends StatelessWidget {
  const _Dots({required this.count, required this.index});
  final int count;
  final int index;

  @override
  Widget build(BuildContext context) => Semantics(
    label: 'Page ${index + 1} of $count',
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: i == index ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: i == index ? TmColors.ink : TmColors.sandDark,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
      ],
    ),
  );
}
