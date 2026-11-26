import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/tm_colors.dart';
import '../theme/tm_text.dart';

/// The "tagme" label hanging on a string, tilted, from the splash screen.
/// Scales to the width it's given.
class TagLogo extends StatelessWidget {
  const TagLogo({super.key});

  // Tag shape + hole + string from the prototype. The view box is padded so
  // the string, which leaves the tag to the top-left, isn't clipped.
  static const _svg = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="-40 -200 345 345">
  <path d="M46 70 C 10 30, -30 -40, -10 -190" fill="none" stroke="#D2FF4D" stroke-width="3"/>
  <path d="M70 0 H276 Q300 0 300 24 V116 Q300 140 276 140 H70 Q60 140 52 133 L8 82 Q0 70 8 58 L52 7 Q60 0 70 0 Z" fill="#D2FF4D"/>
  <circle cx="46" cy="70" r="11" fill="#141414"/>
</svg>''';

  @override
  Widget build(BuildContext context) => Semantics(
    label: 'tagme',
    image: true,
    child: AspectRatio(
      aspectRatio: 1,
      child: Transform.rotate(
        angle: -8 * math.pi / 180,
        child: LayoutBuilder(
          builder: (context, box) {
            final unit = box.maxWidth / 345; // svg units → pixels
            return Stack(
              children: [
                Positioned.fill(child: SvgPicture.string(_svg)),
                // The text area of the tag (right of the hole); the word
                // shrinks to fit so it never runs past the tag's edge.
                Positioned(
                  left: (40 + 76) * unit,
                  top: (200 + 14) * unit,
                  width: 208 * unit,
                  height: 112 * unit,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'tagme',
                      style: TmText.display(82 * unit, color: TmColors.ink),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}
