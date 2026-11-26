import '../../../campaigns/domain/campaign.dart';
import '../../../profile/domain/profile_repository.dart';
import '../../../wallet/domain/wallet_repository.dart';
import '../apply_eligibility.dart';
import '../deal.dart';
import '../deal_repository.dart';

// ---------------------------------------------------------------------------
// Queries
// ---------------------------------------------------------------------------

class WatchDeals {
  const WatchDeals(this._deals);
  final DealRepository _deals;
  Stream<List<Deal>> call() => _deals.watchAll();
}

class WatchDeal {
  const WatchDeal(this._deals);
  final DealRepository _deals;
  Stream<Deal?> call(String dealId) => _deals.watch(dealId);
}

// ---------------------------------------------------------------------------
// Applying
// ---------------------------------------------------------------------------

/// Applies to (or requests) a campaign after checking [ApplyEligibility].
/// Throws [ApplyNotAllowedError] when blocked.
class ApplyToCampaign {
  const ApplyToCampaign({
    required DealRepository deals,
    required WalletRepository wallet,
    required ProfileRepository profile,
    required bool Function() isVerified,
  }) : _deals = deals,
       _wallet = wallet,
       _profile = profile,
       _isVerified = isVerified;

  final DealRepository _deals;
  final WalletRepository _wallet;
  final ProfileRepository _profile;
  final bool Function() _isVerified;

  Future<Deal> call(Campaign campaign, {String? note}) async {
    final deals = await _deals.watchAll().first;
    final wallet = await _wallet.watch().first;
    final creator = await _profile.watch().first;
    final block = ApplyEligibility.check(
      campaign: campaign,
      activeDeal: ApplyEligibility.activeDealFor(deals, campaign.id),
      verified: _isVerified(),
      online: creator.online,
      available: wallet.available,
    );
    if (block != null) throw ApplyNotAllowedError(block);
    final trimmed = note?.trim();
    return _deals.apply(
      campaign,
      note: trimmed == null || trimmed.isEmpty ? null : trimmed,
    );
  }
}

class WithdrawFromDeal {
  const WithdrawFromDeal(this._deals);
  final DealRepository _deals;
  Future<void> call(String dealId) => _deals.withdraw(dealId);
}

// ---------------------------------------------------------------------------
// Deal steps
// ---------------------------------------------------------------------------

class ConfirmDeliveryAddress {
  const ConfirmDeliveryAddress(this._deals);
  final DealRepository _deals;
  Future<void> call(String dealId, String addressId) =>
      _deals.confirmAddress(dealId, addressId);
}

class SubmitScript {
  const SubmitScript(this._deals);
  final DealRepository _deals;

  Future<void> call(String dealId, String text) {
    final script = text.trim();
    if (script.isEmpty) {
      throw DealActionError('Write your script first');
    }
    return _deals.submitScript(dealId, script);
  }
}

class MarkReceived {
  const MarkReceived(this._deals);
  final DealRepository _deals;
  Future<void> call(String dealId) => _deals.markReceived(dealId);
}

class UndoReceived {
  const UndoReceived(this._deals);
  final DealRepository _deals;
  Future<void> call(String dealId) => _deals.undoReceived(dealId);
}

class ReportDeliveryProblem {
  const ReportDeliveryProblem(this._deals);
  final DealRepository _deals;
  Future<void> call(String dealId, String issue) =>
      _deals.reportDeliveryProblem(dealId, issue);
}

class ChooseContent {
  const ChooseContent(this._deals);
  final DealRepository _deals;
  Future<void> call(String dealId, {required bool makeContent}) =>
      _deals.chooseContent(dealId, makeContent: makeContent);
}

class ProposeShootDate {
  const ProposeShootDate(this._deals, {required DateTime Function() now})
    : _now = now;
  final DealRepository _deals;
  final DateTime Function() _now;

  Future<void> call(String dealId, DateTime date) {
    final n = _now();
    final today = DateTime(n.year, n.month, n.day);
    if (date.isBefore(today)) {
      throw DealActionError('Pick today or a later date');
    }
    return _deals.proposeShootDate(dealId, date);
  }
}

class MarkShootDone {
  const MarkShootDone(this._deals);
  final DealRepository _deals;
  Future<void> call(String dealId) => _deals.shootDone(dealId);
}

class SubmitContent {
  const SubmitContent(this._deals);
  final DealRepository _deals;

  Future<void> call(String dealId, List<String> files, {String? postLink}) {
    if (files.isEmpty) throw DealActionError('Add at least one file');
    final link = postLink?.trim();
    if (link != null && link.isNotEmpty && !isValidPostLink(link)) {
      throw DealActionError('That post link doesn\'t look right');
    }
    return _deals.submitContent(
      dealId,
      files,
      postLink: link == null || link.isEmpty ? null : link,
    );
  }
}

class SendDealMessage {
  const SendDealMessage(this._deals);
  final DealRepository _deals;

  Future<void> call(String dealId, String text, {String? attachment}) {
    final t = text.trim();
    if (t.isEmpty && attachment == null) return Future.value();
    return _deals.sendMessage(dealId, t, attachment: attachment);
  }
}

class SendPostLink {
  const SendPostLink(this._deals);
  final DealRepository _deals;

  Future<void> call(String dealId, String link) {
    final l = link.trim();
    if (!isValidPostLink(l)) {
      throw DealActionError(
        'Paste the full link, e.g. https://instagram.com/…',
      );
    }
    return _deals.sendPostLink(dealId, l);
  }
}

/// A link to a live post: http(s) with a host.
bool isValidPostLink(String link) {
  final uri = Uri.tryParse(link);
  return uri != null &&
      (uri.scheme == 'https' || uri.scheme == 'http') &&
      uri.host.contains('.');
}
