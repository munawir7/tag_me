import 'package:flutter_test/flutter_test.dart';
import 'package:tag_me/features/campaigns/domain/campaign.dart';
import 'package:tag_me/features/deals/domain/deal.dart';
import 'package:tag_me/features/deals/domain/deal_rules.dart';

void main() {
  test('every type has one step label per stage and ends in done', () {
    for (final t in CampaignType.values) {
      expect(
        DealRules.stepLabels(t).length,
        DealRules.stageOrder(t).length,
        reason: t.name,
      );
      expect(DealRules.stageOrder(t).last, DealStage.done);
    }
  });

  test('shipped types start with the address; others with the script', () {
    expect(DealRules.firstStage(CampaignType.barter), DealStage.address);
    expect(DealRules.firstStage(CampaignType.drop), DealStage.address);
    expect(DealRules.firstStage(CampaignType.event), DealStage.script);
    expect(DealRules.firstStage(CampaignType.offer), DealStage.script);
  });

  test('barter ships after script approval; event issues a code', () {
    expect(
      DealRules.next(CampaignType.barter, DealStage.scriptReview),
      DealStage.delivery,
    );
    expect(
      DealRules.next(CampaignType.event, DealStage.contentReview),
      DealStage.voucher,
    );
    expect(
      DealRules.next(CampaignType.barter, DealStage.contentReview),
      DealStage.done,
    );
  });

  test('drops have no script or review', () {
    final order = DealRules.stageOrder(CampaignType.drop);
    expect(order, isNot(contains(DealStage.script)));
    expect(order, isNot(contains(DealStage.contentReview)));
  });

  test('next() refuses stages outside the flow', () {
    expect(
      () => DealRules.next(CampaignType.drop, DealStage.script),
      throwsStateError,
    );
    expect(
      () => DealRules.next(CampaignType.barter, DealStage.done),
      throwsStateError,
    );
  });
}
