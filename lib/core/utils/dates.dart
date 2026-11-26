/// Date formatting in the style the prototype uses ("20 Nov", "in 3 days").
class TmDates {
  TmDates._();

  static const _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  static const _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  static DateTime dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

  /// "20 Nov".
  static String short(DateTime d) => '${d.day} ${_months[d.month - 1]}';

  /// "Sat 22 Nov".
  static String withWeekday(DateTime d) =>
      '${_weekdays[d.weekday - 1]} ${short(d)}';

  /// "5 Nov 2027".
  static String long(DateTime d) => '${short(d)} ${d.year}';

  /// Whole days from [now] to [d], ignoring time of day.
  static int daysUntil(DateTime d, DateTime now) =>
      dateOnly(d).difference(dateOnly(now)).inDays;

  /// "today", "tomorrow", "in 3 days", "yesterday", "2 days ago".
  static String relative(DateTime d, DateTime now) {
    final n = daysUntil(d, now);
    return switch (n) {
      0 => 'today',
      1 => 'tomorrow',
      -1 => 'yesterday',
      > 0 => 'in $n days',
      _ => '${-n} days ago',
    };
  }

  /// Timeline style: "Just now", "5 min ago", "2h ago", "Yesterday", "12 Nov".
  static String ago(DateTime at, DateTime now) {
    final diff = now.difference(at);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inHours < 1) return '${diff.inMinutes} min ago';
    if (diff.inDays < 1 && dateOnly(at) == dateOnly(now)) {
      return '${diff.inHours}h ago';
    }
    if (daysUntil(at, now) == -1) return 'Yesterday';
    return short(at);
  }
}
