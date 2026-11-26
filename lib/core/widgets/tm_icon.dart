import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// TagMe's custom line icons (24×24 stroke paths from the prototype).
enum TmIcons {
  back('M15 18l-6-6 6-6'),
  home('M4 10.5L12 4l8 6.5V20H4z'),
  collabs('M5 4h14v17H5zM9 9h6M9 13h6M9 17h3'),
  credits('M3 6h18v14H3zM16 13h2M3 10h18'),
  me(
    'M12 12.5a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM4.5 20c1.5-4 4.3-5.5 7.5-5.5s6 1.5 7.5 5.5',
  ),
  barter('M7 7h12l-3-3M17 17H5l3 3'),
  drop('M3 7.5L12 3l9 4.5-9 4.5-9-4.5zM3 7.5V17l9 4 9-4V7.5M12 12v9'),
  event('M3 7h18v3a2 2 0 0 0 0 4v3H3v-3a2 2 0 0 0 0-4zM14.5 7v10'),
  offer(
    'M19 5L5 19M9 7a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM19 17a2 2 0 1 1-4 0 2 2 0 0 1 4 0z',
  ),
  bell('M6 16V11a6 6 0 0 1 12 0v5l1.5 2h-15zM10 20.5a2 2 0 0 0 4 0'),
  clock('M12 21a9 9 0 1 0 0-18 9 9 0 0 0 0 18zM12 7v5l3 2'),
  check('M5 12.5l4.5 4.5L19 7.5'),
  lock('M5 11h14v10H5zM8 11V8a4 4 0 0 1 8 0v3'),
  qr(
    'M3 3h7v7H3zM14 3h7v7h-7zM3 14h7v7H3zM14 14h3v3h-3zM20 14v.01M14 20h.01M17 20h4v-3',
  ),
  video('M4 6h11v12H4zM15 10l5-3v10l-5-3'),
  send('M5 12h14M13 6l6 6-6 6'),
  pin(
    'M12 21s-7-6.2-7-11.5A7 7 0 0 1 19 9.5C19 14.8 12 21 12 21zM12 12a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z',
  ),
  close('M6 6l12 12M18 6L6 18'),
  photo('M3 5h18v14H3zM21 16l-5-5-8 8');

  const TmIcons(this.path);
  final String path;
}

/// Renders a [TmIcons] path as a stroked line icon.
class TmIcon extends StatelessWidget {
  const TmIcon(
    this.icon, {
    super.key,
    this.size = 20,
    this.color,
    this.strokeWidth = 2.2,
  });

  final TmIcons icon;
  final double size;

  /// Defaults to the ambient [IconTheme] colour.
  final Color? color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final c = color ?? IconTheme.of(context).color ?? Colors.black;
    final hex =
        '#${(c.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0')}';
    final svg =
        '<svg width="24" height="24" viewBox="0 0 24 24" fill="none" '
        'stroke="$hex" stroke-opacity="${c.a}" stroke-width="$strokeWidth" '
        'stroke-linecap="round" stroke-linejoin="round">'
        '<path d="${icon.path}"/></svg>';
    return SvgPicture.string(svg, width: size, height: size);
  }
}
