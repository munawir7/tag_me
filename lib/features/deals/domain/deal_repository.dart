import '../../campaigns/domain/campaign.dart';
import 'deal.dart';

/// Thrown when an action doesn't fit the deal's current stage,
/// e.g. sending a script while the brand is reviewing it.
class DealActionError implements Exception {
  DealActionError(this.message);
  final String message;
  @override
  String toString() => 'DealActionError: $message';
}

/// Thrown by [DealRepository.apply] when the balance is too low.
class InsufficientCreditsError implements Exception {
  InsufficientCreditsError({required this.needed, required this.available});
  final int needed;
  final int available;
  @override
  String toString() => 'Need $needed credits, have $available';
}

/// Everything the creator can do in a collab. The brand's side
/// (approvals, shipping, codes) happens on the server and arrives through
/// [watchAll] / [watch].
abstract interface class DealRepository {
  /// All the creator's collabs, updated live.
  Stream<List<Deal>> watchAll();

  /// One collab, updated live; emits null if it doesn't exist.
  Stream<Deal?> watch(String id);

  /// Apply for / request [campaign]. Holds its credits.
  Future<Deal> apply(Campaign campaign, {String? note});

  /// Withdraw. Credits come back only if the brand hasn't approved yet.
  Future<void> withdraw(String dealId);

  Future<void> confirmAddress(String dealId, String addressId);
  Future<void> submitScript(String dealId, String text);

  Future<void> markReceived(String dealId);

  /// Tapped "received" by mistake.
  Future<void> undoReceived(String dealId);
  Future<void> reportDeliveryProblem(String dealId, String issue);

  /// Drop only: make content (true) or finish without (false).
  Future<void> chooseContent(String dealId, {required bool makeContent});

  Future<void> proposeShootDate(String dealId, DateTime date);
  Future<void> shootDone(String dealId);
  Future<void> submitContent(
    String dealId,
    List<String> files, {
    String? postLink,
  });

  Future<void> sendMessage(String dealId, String text, {String? attachment});

  /// After completion: link to the live post.
  Future<void> sendPostLink(String dealId, String link);
}
