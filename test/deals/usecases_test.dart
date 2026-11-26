import 'package:flutter_test/flutter_test.dart';
import 'package:tag_me/app/mock/mock_backend.dart';
import 'package:tag_me/features/deals/data/mock_deal_repository.dart';
import 'package:tag_me/features/deals/domain/apply_eligibility.dart';
import 'package:tag_me/features/deals/domain/deal.dart';
import 'package:tag_me/features/deals/domain/deal_repository.dart';
import 'package:tag_me/features/deals/domain/usecases/deal_usecases.dart';

void main() {
  late MockBackend b;
  var verified = true;

  setUp(() {
    verified = true;
    b = MockBackend(simulation: BrandSimulation()..enabled = false);
  });
  tearDown(() => b.dispose());

  ApplyToCampaign apply() => ApplyToCampaign(
    deals: b.deals,
    wallet: b.wallet,
    profile: b.profile,
    isVerified: () => verified,
  );

  group('ApplyToCampaign', () {
    test('applies when eligible', () async {
      final deal = await apply()(b.campaigns.find('marina-food')!, note: '  ');
      expect(deal.stage, DealStage.applied);
      expect(b.wallet.current.available, 42 - 15);
    });

    test('refuses with the reason, and changes nothing', () async {
      verified = false;
      await expectLater(
        apply()(b.campaigns.find('marina-food')!),
        throwsA(
          isA<ApplyNotAllowedError>().having(
            (e) => e.reason,
            'reason',
            ApplyBlock.notVerified,
          ),
        ),
      );
      expect(b.wallet.current.available, 42);

      verified = true;
      await b.profile.setOnline(false);
      await expectLater(
        apply()(b.campaigns.find('marina-food')!),
        throwsA(
          isA<ApplyNotAllowedError>().having(
            (e) => e.reason,
            'reason',
            ApplyBlock.offline,
          ),
        ),
      );

      await b.profile.setOnline(true);
      await expectLater(
        apply()(b.campaigns.find('aero-earbuds')!),
        throwsA(
          isA<ApplyNotAllowedError>().having(
            (e) => e.reason,
            'reason',
            ApplyBlock.alreadyApplied,
          ),
        ),
      );
    });
  });

  group('deal step validation', () {
    test('script must not be empty', () {
      expect(
        () => SubmitScript(b.deals)('d-skyline-jazz', '   '),
        throwsA(isA<DealActionError>()),
      );
    });

    test('content needs a file and a real post link', () {
      final submit = SubmitContent(b.deals);
      expect(
        () => submit('d-verde-brush', []),
        throwsA(isA<DealActionError>()),
      );
      expect(
        () => submit('d-verde-brush', ['a.mp4'], postLink: 'not a link'),
        throwsA(isA<DealActionError>()),
      );
    });

    test('post link must be http(s) with a host', () {
      expect(isValidPostLink('https://instagram.com/reel/abc'), isTrue);
      expect(isValidPostLink('instagram.com/reel/abc'), isFalse);
      expect(isValidPostLink('https://localhost'), isFalse);
    });

    test('shoot date cannot be in the past', () {
      final propose = ProposeShootDate(
        b.deals,
        now: () => DateTime(2026, 11, 26, 15),
      );
      expect(
        () => propose('d-x', DateTime(2026, 11, 25)),
        throwsA(isA<DealActionError>()),
      );
    });

    test('empty chat message is ignored', () async {
      await SendDealMessage(b.deals)('d-skyline-jazz', '   ');
      expect(b.deals.find('d-skyline-jazz')!.chat, isEmpty);
    });
  });
}
