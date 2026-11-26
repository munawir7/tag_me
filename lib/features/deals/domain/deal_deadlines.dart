import '../../campaigns/domain/campaign.dart';
import 'deal.dart';
import 'deal_rules.dart';

enum KeyDateState {
  /// The stages this date belongs to are finished.
  done,

  /// The date the creator is working towards now.
  current,

  /// [current], but already passed.
  late,

  upcoming,
}

class KeyDateRow {
  const KeyDateRow({
    required this.kind,
    required this.label,
    required this.date,
    required this.state,
    required this.daysFromNow,
  });

  final KeyDateKind kind;
  final String label;
  final DateTime date;
  final KeyDateState state;

  /// Negative when the date has passed.
  final int daysFromNow;
}

/// Which brand dates matter for a deal right now.
class DealDeadlines {
  DealDeadlines._();

  /// Stages each date is "owned" by: once the deal moves past all of them,
  /// the date is done.
  static const _owners = {
    KeyDateKind.scriptDue: [
      DealStage.address,
      DealStage.script,
      DealStage.scriptReview,
    ],
    KeyDateKind.dispatchBy: [DealStage.address],
    KeyDateKind.deliverBy: [DealStage.delivery],
    KeyDateKind.shootFrom: [DealStage.shoot],
    KeyDateKind.shootTo: [DealStage.shoot],
    KeyDateKind.contentDue: [DealStage.upload, DealStage.contentReview],
  };

  /// The kind of date the current stage is working towards, resolved
  /// against what this campaign actually has (events have no shoot window,
  /// so their "shoot" date is the event day).
  static KeyDateKind? currentKind(Deal deal, Campaign campaign) {
    final kind = DealRules.dueDateFor(deal.stage);
    if (kind == null) return null;
    if (campaign.dateOf(kind) != null) return kind;
    if (campaign.dateOf(KeyDateKind.shootFrom) != null &&
        (kind == KeyDateKind.shootTo)) {
      return KeyDateKind.shootFrom;
    }
    return null;
  }

  /// The date the creator is working towards now, if any.
  static DateTime? currentDue(Deal deal, Campaign? campaign) {
    if (deal.isClosed) return null;
    if (deal.stage == DealStage.voucher) return deal.code?.validUntil;
    if (campaign == null) return null;
    final kind = currentKind(deal, campaign);
    return kind == null ? null : campaign.dateOf(kind);
  }

  static bool isDone(Deal deal, KeyDateKind kind) {
    if (kind == KeyDateKind.applyBy) return true;
    if (deal.stage == DealStage.done) return true;
    final order = DealRules.stageOrder(deal.type);
    final at = order.indexOf(deal.stage);
    final own = (_owners[kind] ?? const <DealStage>[])
        .map(order.indexOf)
        .where((i) => i >= 0)
        .toList();
    if (own.isEmpty || at < 0) return false;
    return at > own.reduce((a, b) => a > b ? a : b);
  }

  /// Every campaign date with its state, in timeline order.
  static List<KeyDateRow> rows(Deal deal, Campaign campaign, DateTime now) {
    final current = deal.isClosed ? null : currentKind(deal, campaign);
    final today = DateTime(now.year, now.month, now.day);
    return [
      for (final kd in campaign.timeline)
        () {
          final day = DateTime(kd.date.year, kd.date.month, kd.date.day);
          final days = day.difference(today).inDays;
          final done = isDone(deal, kd.kind);
          final state = done
              ? KeyDateState.done
              : kd.kind == current
              ? (days < 0 ? KeyDateState.late : KeyDateState.current)
              : KeyDateState.upcoming;
          return KeyDateRow(
            kind: kd.kind,
            label: kd.label,
            date: kd.date,
            state: state,
            daysFromNow: days,
          );
        }(),
    ];
  }
}
