import 'package:flutter/material.dart';

import '../../../../core/theme/tm_colors.dart';
import '../../../../core/theme/tm_text.dart';
import '../../../../core/widgets/widgets.dart';
import '../../domain/campaign.dart';
import '../campaign_ui.dart';

/// Campaign card in the Home feed.
class CampaignCard extends StatelessWidget {
  const CampaignCard({super.key, required this.campaign, required this.onOpen});

  final Campaign campaign;
  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    final c = campaign;
    return TmCard(
      padding: const EdgeInsets.all(8),
      onTap: onOpen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PhotoPlaceholder(
            imageUrl: c.photoUrl,
            overlay: [
              Positioned(top: 10, right: 10, child: TmPill(c.spotsLabel)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 14, 10, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InitialAvatar(c.brand.initial),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            c.brand.name,
                            style: TmText.body(
                              size: 14,
                              weight: FontWeight.w700,
                            ),
                          ),
                          if (c.meta != null)
                            Text(c.meta!, style: TmText.small()),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(c.title, style: TmText.display(24)),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _Fact('You get', c.youGetShort)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _Fact(c.type.contentHeading, c.contentShort),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const DashedLine(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 14, 10, 6),
            child: Row(
              children: [
                Text('${c.credits}', style: TmText.display(26)),
                const SizedBox(width: 4),
                Text('credits', style: TmText.small()),
                const Spacer(),
                TmButton(
                  label: c.type.cta,
                  small: true,
                  expand: false,
                  onPressed: onOpen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Eyebrow(label),
      const SizedBox(height: 3),
      Text(
        value,
        style: TmText.body(
          size: 14,
          weight: FontWeight.w700,
          color: TmColors.ink,
          height: 1.3,
        ),
      ),
    ],
  );
}
