import 'package:flutter/material.dart';

import '../theme/tm_colors.dart';
import '../theme/tm_text.dart';
import 'tm_button.dart';
import 'tm_icon.dart';

/// Round avatar showing an initial (brands, creators without a photo).
class InitialAvatar extends StatelessWidget {
  const InitialAvatar(
    this.initial, {
    super.key,
    this.size = 40,
    this.background = TmColors.ink,
    this.foreground = Colors.white,
  });

  final String initial;
  final double size;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    alignment: Alignment.center,
    decoration: BoxDecoration(color: background, shape: BoxShape.circle),
    child: Text(initial, style: TmText.display(size * 0.45, color: foreground)),
  );
}

/// Campaign photo, or a sand-coloured placeholder until brands upload one.
class PhotoPlaceholder extends StatelessWidget {
  const PhotoPlaceholder({
    super.key,
    this.height = 150,
    this.radius = 18,
    this.label = "Brand's campaign photo",
    this.imageUrl,
    this.overlay = const [],
  });

  final double height;
  final double radius;
  final String label;
  final String? imageUrl;

  /// Positioned widgets drawn on top (e.g. a "20 spots left" pill).
  final List<Widget> overlay;

  @override
  Widget build(BuildContext context) {
    final placeholder = Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TmIcon(TmIcons.photo, size: 18, color: TmColors.muted),
          const SizedBox(width: 6),
          Text(label, style: TmText.small(color: TmColors.muted)),
        ],
      ),
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        height: height,
        color: TmColors.sand,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (imageUrl == null)
              placeholder
            else
              Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => placeholder,
              ),
            ...overlay,
          ],
        ),
      ),
    );
  }
}

/// Square lime checkbox with a label, as on the apply screen.
class TmCheckbox extends StatelessWidget {
  const TmCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) => Semantics(
    checked: value,
    child: InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: value ? TmColors.lime : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: TmColors.ink, width: 1.5),
              ),
              child: value
                  ? const Icon(
                      Icons.check_rounded,
                      size: 18,
                      color: TmColors.ink,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label, style: TmText.body(size: 14, height: 1.45)),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Centered ink spinner.
class TmLoading extends StatelessWidget {
  const TmLoading({super.key, this.padding = 40});
  final double padding;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.all(padding),
    child: const Center(
      child: SizedBox.square(
        dimension: 28,
        child: CircularProgressIndicator(strokeWidth: 3, color: TmColors.ink),
      ),
    ),
  );
}

/// Friendly error with a retry button.
class TmErrorView extends StatelessWidget {
  const TmErrorView({super.key, this.message, this.onRetry});
  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          message ?? 'Something went wrong.',
          textAlign: TextAlign.center,
          style: TmText.body(),
        ),
        if (onRetry != null) ...[
          const SizedBox(height: 12),
          TmButton.ghost(
            label: 'Try again',
            small: true,
            expand: false,
            onPressed: onRetry,
          ),
        ],
      ],
    ),
  );
}
