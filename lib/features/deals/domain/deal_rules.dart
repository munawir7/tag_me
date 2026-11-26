import '../../campaigns/domain/campaign.dart';
import 'deal.dart';

/// The deal "state machine": which stages each campaign type goes
/// through, in order, and what they're called.
class DealRules {
  DealRules._();

  static const _barter = [
    DealStage.address,
    DealStage.script,
    DealStage.scriptReview,
    DealStage.delivery,
    DealStage.shoot,
    DealStage.upload,
    DealStage.contentReview,
    DealStage.done,
  ];
  static const _codeFlow = [
    DealStage.script,
    DealStage.scriptReview,
    DealStage.shoot,
    DealStage.upload,
    DealStage.contentReview,
    DealStage.voucher,
    DealStage.done,
  ];
  static const _drop = [
    DealStage.address,
    DealStage.delivery,
    DealStage.choose,
    DealStage.upload,
    DealStage.done,
  ];

  /// Stages after approval, in order.
  static List<DealStage> stageOrder(CampaignType type) => switch (type) {
    CampaignType.barter => _barter,
    CampaignType.drop => _drop,
    CampaignType.event || CampaignType.offer => _codeFlow,
  };

  /// First stage once the brand approves the application.
  static DealStage firstStage(CampaignType type) => stageOrder(type).first;

  /// The stage after [stage]; throws if [stage] isn't in the flow or is last.
  static DealStage next(CampaignType type, DealStage stage) {
    final order = stageOrder(type);
    final i = order.indexOf(stage);
    if (i < 0 || i == order.length - 1) {
      throw StateError('No stage after $stage for $type');
    }
    return order[i + 1];
  }

  /// Short names under the step bars, one per [stageOrder] entry.
  static List<String> stepLabels(CampaignType type) => switch (type) {
    CampaignType.barter => const [
      'Address',
      'Script',
      'Script review',
      'Delivery',
      'Shoot',
      'Upload',
      'Reel review',
      'Done',
    ],
    CampaignType.drop => const [
      'Address',
      'Delivery',
      'Content',
      'Upload',
      'Done',
    ],
    CampaignType.event => const [
      'Script',
      'Script review',
      'Shoot',
      'Upload',
      'Video review',
      'Entry code',
      'Done',
    ],
    CampaignType.offer => const [
      'Script',
      'Script review',
      'Shoot',
      'Upload',
      'Reel review',
      'Coupon',
      'Done',
    ],
  };

  /// Which brand date a stage is working towards (for "due" badges and
  /// highlighting in Key dates).
  static KeyDateKind? dueDateFor(DealStage stage) => switch (stage) {
    DealStage.address ||
    DealStage.script ||
    DealStage.scriptReview => KeyDateKind.scriptDue,
    DealStage.delivery => KeyDateKind.deliverBy,
    DealStage.shoot => KeyDateKind.shootTo,
    DealStage.upload || DealStage.contentReview => KeyDateKind.contentDue,
    DealStage.voucher => KeyDateKind.validTo,
    _ => null,
  };

  /// Order on "My collabs": rejections first, then your turn, then waiting
  /// on the brand; most recently updated first within each group.
  static int compareForList(Deal a, Deal b) {
    int rank(Deal d) => d.needsFix ? 0 : (d.isBrandsTurn ? 2 : 1);
    final r = rank(a).compareTo(rank(b));
    return r != 0 ? r : b.updatedAt.compareTo(a.updatedAt);
  }

  /// The kind of code issued for [type], if any.
  static CodeKind? codeKind(CampaignType type) => switch (type) {
    CampaignType.event => CodeKind.entryCode,
    CampaignType.offer => CodeKind.coupon,
    _ => null,
  };
}
