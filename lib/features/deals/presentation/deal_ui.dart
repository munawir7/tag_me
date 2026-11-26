import 'package:flutter/material.dart';

import '../../../core/widgets/widgets.dart';
import '../../campaigns/domain/campaign.dart';
import '../domain/deal.dart';
import '../domain/deal_repository.dart';

/// Wording for a deal's state, shared by My collabs and the deal screen.
extension DealUi on Deal {
  String get contentWord => type.contentWord;
  String get contentWordCap =>
      contentWord[0].toUpperCase() + contentWord.substring(1);

  /// Pill on cards and in the deal header.
  (String, TmPillStyle) get statusPill {
    if (needsFix) {
      return (
        stage == DealStage.script
            ? '✕ Script rejected'
            : '✕ ${contentWordCap.toUpperCase()} rejected',
        TmPillStyle.rejected,
      );
    }
    return switch (stage) {
      DealStage.applied ||
      DealStage.scriptReview ||
      DealStage.contentReview => ('Waiting on brand', TmPillStyle.brand),
      DealStage.delivery when !hasShipped => (
        'Waiting on brand',
        TmPillStyle.brand,
      ),
      DealStage.voucher => (
        '${code?.kind.label ?? 'Code'} ready',
        TmPillStyle.you,
      ),
      DealStage.done => (
        type == CampaignType.drop ? 'Finished' : 'Completed',
        TmPillStyle.dark,
      ),
      DealStage.notApproved => ('✕ Not approved', TmPillStyle.grey),
      DealStage.withdrawn => ('Withdrawn', TmPillStyle.grey),
      DealStage.ended =>
        strike
            ? ('⚑ Ended · strike', TmPillStyle.rejected)
            : ('✕ Closed by brand', TmPillStyle.rejected),
      DealStage.expired => ('Expired', TmPillStyle.grey),
      _ => ('Your turn', TmPillStyle.you),
    };
  }

  /// One-line summary on the collab card.
  String get summary => switch (stage) {
    DealStage.applied => 'Brand decides soon. $credits credits on hold.',
    DealStage.address =>
      type == CampaignType.drop
          ? 'Approved! Confirm your address so the brand can ship.'
          : 'Approved! Confirm your delivery address, then write your script.',
    DealStage.script =>
      needsFix
          ? 'Your turn: rework the script and send v$scriptVersion.'
          : 'Write your script for the brand.',
    DealStage.scriptReview =>
      'Script v$scriptVersion in review. Usually within 24 h.',
    DealStage.delivery => switch (delivery?.status) {
      DeliveryStatus.issue =>
        'Delivery problem reported. The brand will reship.',
      DeliveryStatus.delivered => 'Delivered. Did you get it?',
      DeliveryStatus.shipped ||
      DeliveryStatus.outForDelivery => 'On its way. Confirm when it arrives.',
      _ => 'The brand is preparing your order.',
    },
    DealStage.choose => 'Received! Make content, or finish without.',
    DealStage.shoot => 'Shoot your $contentWord.',
    DealStage.upload =>
      needsFix
          ? 'Your turn: fix the $contentWord and re-upload.'
          : type == CampaignType.drop
          ? 'Upload your content to finish. No review.'
          : 'Upload your $contentWord for review.',
    DealStage.contentReview =>
      type.issuesCode
          ? '$contentWordCap in review. ${_codeCap()} after approval.'
          : '$contentWordCap in review. Usually within 3 days.',
    DealStage.voucher =>
      'Your ${code?.kind.label ?? 'code'} is ready. Show the QR at the venue.',
    DealStage.done => switch (type) {
      CampaignType.drop =>
        madeContent == false
            ? 'Finished without content.'
            : 'Content sent. No approval needed.',
      CampaignType.barter => 'Approved. Product kept.',
      _ =>
        code?.redeemedAt != null
            ? '${_codeCap()} used. Thanks for the collab!'
            : 'Completed.',
    },
    DealStage.notApproved => 'Brand picked other creators. Credits refunded.',
    DealStage.withdrawn => 'You withdrew from this collab.',
    DealStage.ended =>
      strike
          ? 'Closed by the brand with a strike. Credits not refunded.'
          : 'Closed by the brand. Credits not refunded.',
    DealStage.expired => "A deadline passed. Credits not refunded.",
  };

  /// Main button on the collab card; null when there's nothing to do.
  String? get actionLabel => switch (stage) {
    DealStage.address => 'Confirm address',
    DealStage.script => needsFix ? 'Fix script and resend' : 'Write script',
    DealStage.delivery => hasShipped ? "Confirm it's arrived" : 'Track order',
    DealStage.choose => 'Choose',
    DealStage.shoot => 'Shoot',
    DealStage.upload => needsFix ? 'Re-upload' : 'Upload',
    DealStage.voucher => 'Show QR',
    DealStage.applied ||
    DealStage.scriptReview ||
    DealStage.contentReview => 'Open collab',
    _ => null,
  };

  /// The brand's latest message, e.g. the reason for a rejection.
  ChatMessage? get lastBrandMessage {
    for (final m in chat.reversed) {
      if (m.from == Actor.brand) return m;
    }
    return null;
  }

  String _codeCap() {
    final k =
        (code?.kind ??
                (type == CampaignType.event
                    ? CodeKind.entryCode
                    : CodeKind.coupon))
            .label;
    return k[0].toUpperCase() + k.substring(1);
  }
}

/// Runs a creator action and shows the error, if any, as a message.
Future<void> runDealAction(
  BuildContext context,
  Future<void> Function() action,
) async {
  final messenger = ScaffoldMessenger.of(context);
  try {
    await action();
  } on DealActionError catch (e) {
    messenger.showSnackBar(SnackBar(content: Text(e.message)));
  } catch (_) {
    messenger.showSnackBar(
      const SnackBar(content: Text('Something went wrong. Try again.')),
    );
  }
}

void showComingSoon(BuildContext context, String what) => ScaffoldMessenger.of(
  context,
).showSnackBar(SnackBar(content: Text('$what opens here')));
