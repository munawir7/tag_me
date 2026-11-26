import '../../../core/mock/live_value.dart';
import '../../onboarding/domain/profile_draft.dart';
import '../domain/creator.dart';
import '../domain/profile_repository.dart';

class MockProfileRepository implements ProfileRepository {
  MockProfileRepository(Creator initial) : _creator = LiveValue(initial);

  final LiveValue<Creator> _creator;
  var _seq = 0;

  Creator get current => _creator.value;

  @override
  Stream<Creator> watch() => _creator.stream;

  @override
  Future<void> setOnline(bool online) async =>
      _creator.value = _creator.value.copyWith(online: online);

  @override
  Future<Address> addAddress(Address address) async {
    final saved = address.copyWith(id: 'a-new-${++_seq}');
    _creator.value = _creator.value.copyWith(
      addresses: [..._creator.value.addresses, saved],
    );
    return saved;
  }

  /// Server side: the profile submitted during sign-up. Handles stay
  /// unverified until the TagMe team checks them.
  void applyDraft(ProfileDraft d) {
    _creator.value = _creator.value.copyWith(
      name: d.name,
      country: d.country,
      city: d.city,
      whatsapp: d.whatsapp,
      categories: d.categories,
      socials: [
        for (final h in d.handles)
          SocialAccount(platform: h.platform, handle: h.handle),
      ],
      licence: d.hasLicence
          ? Licence(
              number: d.licenceNumber ?? '',
              expiresAt: d.licenceExpiry,
              fileName: d.licenceFile,
            )
          : null,
    );
  }

  /// Server side: a brand ended a collab with a strike.
  void addStrike() =>
      _creator.value = _creator.value.copyWith(strikes: current.strikes + 1);

  Future<void> dispose() => _creator.close();
}
