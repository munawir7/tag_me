import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tag_me/app/mock/seed_data.dart';
import 'package:tag_me/features/campaigns/data/dto/campaign_dto.dart';
import 'package:tag_me/features/deals/data/dto/deal_dto.dart';
import 'package:tag_me/features/deals/domain/deal.dart';
import 'package:tag_me/features/notifications/data/dto/notification_dto.dart';
import 'package:tag_me/features/profile/data/dto/creator_dto.dart';
import 'package:tag_me/features/wallet/data/dto/wallet_dto.dart';

/// Encodes to a JSON string and back, like a real network round trip.
Map<String, dynamic> _wire(Map<String, dynamic> json) =>
    jsonDecode(jsonEncode(json)) as Map<String, dynamic>;

void main() {
  final seed = SeedData(DateTime(2026, 11, 26, 10));

  group('round trip: domain → DTO → JSON → DTO → domain', () {
    test('campaigns', () {
      for (final c in seed.campaigns) {
        final json = _wire(CampaignDto.fromDomain(c).toJson());
        expect(CampaignDto.fromJson(json).toDomain(), c);
      }
    });

    test('deals', () {
      for (final d in seed.deals) {
        final json = _wire(DealDto.fromDomain(d).toJson());
        expect(DealDto.fromJson(json).toDomain(), d);
      }
    });

    test('wallet, creator, notifications', () {
      final w = seed.wallet;
      expect(
        WalletDto.fromJson(_wire(WalletDto.fromDomain(w).toJson())).toDomain(),
        w,
      );
      final c = seed.creator;
      expect(
        CreatorDto.fromJson(
          _wire(CreatorDto.fromDomain(c).toJson()),
        ).toDomain(),
        c,
      );
      for (final n in seed.notifications) {
        expect(
          NotificationDto.fromJson(
            _wire(NotificationDto.fromDomain(n).toJson()),
          ).toDomain(),
          n,
        );
      }
    });
  });

  test('JSON uses the API shape: snake_case keys and enum values', () {
    final deal = seed.deals.firstWhere(
      (d) => d.stage == DealStage.contentReview,
    );
    final json = _wire(DealDto.fromDomain(deal).toJson());
    expect(json['campaign_id'], deal.campaignId);
    expect(json['brand_name'], deal.brandName);
    expect(json['stage'], 'content_review');
    expect(json.containsKey('campaignId'), isFalse);
  });

  test('unknown values from a newer API do not crash', () {
    final json = _wire(DealDto.fromDomain(seed.deals.first).toJson())
      ..['stage'] = 'some_future_stage'
      ..['type'] = 'some_future_type';
    final deal = DealDto.fromJson(json).toDomain();
    expect(deal.stage, DealStage.applied);

    final campaign = seed.campaigns.first;
    final cJson = _wire(CampaignDto.fromDomain(campaign).toJson());
    (cJson['timeline'] as List).add({
      'kind': 'some_future_date',
      'label': 'New',
      'date': '2026-12-01T00:00:00.000',
    });
    expect(
      CampaignDto.fromJson(cJson).toDomain().timeline.length,
      campaign.timeline.length,
      reason: 'unknown date kinds are skipped',
    );
  });
}
