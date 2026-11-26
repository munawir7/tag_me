import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../campaigns/application/campaign_providers.dart';
import '../../deals/application/deal_providers.dart';
import '../domain/usecases/voucher_usecases.dart';
import '../domain/voucher.dart';

final watchUsableVouchersProvider = Provider(
  (ref) => WatchUsableVouchers(
    deals: ref.watch(dealRepositoryProvider),
    campaigns: ref.watch(campaignRepositoryProvider),
    now: DateTime.now,
  ),
);

/// Entry codes, coupons and vouchers that can still be used.
final vouchersProvider = StreamProvider<List<Voucher>>(
  (ref) => ref.watch(watchUsableVouchersProvider)(),
);
