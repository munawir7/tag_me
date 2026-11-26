import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tag_me/app/mock/seed_data.dart';
import 'package:tag_me/app/routes.dart';
import 'package:tag_me/features/notifications/domain/notification_groups.dart';

import '../helpers.dart';

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  test('NotificationGroups: unread urgent need you, the rest are earlier', () {
    final all = SeedData(DateTime(2026, 11, 26)).notifications;
    final g = NotificationGroups.of(all);
    expect(g.needsYou.map((n) => n.id), ['n-1', 'n-2']);
    expect(g.earlier, hasLength(all.length - 2));

    final read = [for (final n in all) n.copyWith(read: true)];
    expect(NotificationGroups.of(read).needsYou, isEmpty);
  });

  testWidgets('lists sections; tapping one marks it read and opens it', (
    t,
  ) async {
    final b = await pumpApp(t);
    await openRoute(t, Routes.notifications);
    expect(find.text('NEEDS YOU · 2'), findsOneWidget);
    expect(find.text('EARLIER'), findsOneWidget);

    await tapText(t, 'Kora Studio rejected your script');
    expect(find.text('Rework your script'), findsOneWidget);
    expect(
      b.notifications.current.firstWhere((n) => n.id == 'n-2').read,
      isTrue,
    );
  });

  testWidgets('mark all as read empties "Needs you"', (t) async {
    final b = await pumpApp(t);
    await openRoute(t, Routes.notifications);
    await tapText(t, 'Mark all as read');
    expect(find.textContaining('NEEDS YOU'), findsNothing);
    expect(b.notifications.current.every((n) => n.read), isTrue);
    expect(find.text('Mark all as read'), findsNothing);
  });

  testWidgets('a voucher notification opens that voucher', (t) async {
    await pumpApp(t);
    await openRoute(t, Routes.notifications);
    await tapText(t, 'Brew Lab approved your reel. Voucher ready');
    expect(find.text('BREW-TM-5520'), findsOneWidget);
  });
}
