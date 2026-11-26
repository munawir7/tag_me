import 'package:flutter_test/flutter_test.dart';
import 'package:tag_me/app/mock/seed_data.dart';
import 'package:tag_me/features/campaigns/domain/campaign.dart';
import 'package:tag_me/features/deals/domain/apply_eligibility.dart';
import 'package:tag_me/features/deals/domain/deal.dart';
import 'package:tag_me/features/deals/domain/deal_deadlines.dart';
import 'package:tag_me/features/deals/domain/deal_rules.dart';

void main() {
  final now = DateTime(2026, 11, 26, 10);
  final seed = SeedData(now);
  Deal deal(String campaignId) =>
      seed.deals.firstWhere((d) => d.campaignId == campaignId);

  group('ApplyEligibility', () {
    final c = seed.campaign('marina-food'); // 15 credits

    ApplyBlock? check({
      Deal? active,
      bool verified = true,
      bool online = true,
      int available = 42,
    }) => ApplyEligibility.check(
      campaign: c,
      activeDeal: active,
      verified: verified,
      online: online,
      available: available,
    );

    test('allows a verified, online creator with enough credits', () {
      expect(check(), isNull);
      expect(check(available: 15), isNull, reason: 'exactly enough');
    });

    test('checks in order: applied, verified, online, credits', () {
      expect(
        check(active: deal('aero-earbuds'), verified: false),
        ApplyBlock.alreadyApplied,
      );
      expect(check(verified: false, online: false), ApplyBlock.notVerified);
      expect(check(online: false, available: 0), ApplyBlock.offline);
      expect(check(available: 14), ApplyBlock.notEnoughCredits);
    });

    test('closed collabs do not count as applied', () {
      expect(
        ApplyEligibility.activeDealFor(seed.deals, 'hydra-bottle'),
        isNull,
      );
      expect(
        ApplyEligibility.activeDealFor(seed.deals, 'aero-earbuds'),
        isNotNull,
      );
    });
  });

  group('DealDeadlines', () {
    test('current date is the one the stage works towards', () {
      final d = deal('kora-tote'); // script rework, closed campaign
      final c = seed.campaign('kora-tote');
      final rows = DealDeadlines.rows(d, c, now);
      final current = rows.where(
        (r) => r.state == KeyDateState.current || r.state == KeyDateState.late,
      );
      expect(current.single.kind, KeyDateKind.scriptDue);
      expect(
        rows.firstWhere((r) => r.kind == KeyDateKind.applyBy).state,
        KeyDateState.done,
      );
    });

    test('passed current date is flagged late', () {
      final d = deal('kora-tote');
      final c = seed.campaign('kora-tote');
      final later = now.add(const Duration(days: 5));
      final row = DealDeadlines.rows(
        d,
        c,
        later,
      ).firstWhere((r) => r.kind == KeyDateKind.scriptDue);
      expect(row.state, KeyDateState.late);
      expect(row.daysFromNow, lessThan(0));
    });

    test('events use the event day for the shoot', () {
      final c = seed.campaign('skyline-jazz');
      final d = deal('skyline-jazz').copyWith(stage: DealStage.shoot);
      expect(DealDeadlines.currentDue(d, c), c.dateOf(KeyDateKind.shootFrom));
    });

    test('voucher due date is the code expiry; closed has none', () {
      final v = deal('brewlab-coffee');
      expect(DealDeadlines.currentDue(v, null), v.code!.validUntil);
      expect(DealDeadlines.currentDue(deal('fitbite-box'), null), isNull);
    });
  });

  test('My collabs order: rejections, your turn, waiting', () {
    final ongoing =
        seed.deals.where((d) => d.bucket == CollabBucket.ongoing).toList()
          ..sort(DealRules.compareForList);
    final ranks = ongoing
        .map((d) => d.needsFix ? 0 : (d.isBrandsTurn ? 2 : 1))
        .toList();
    expect(ranks, [...ranks]..sort());
    expect(ongoing.first.needsFix, isTrue);
    expect(ongoing.last.isBrandsTurn, isTrue);
  });
}
