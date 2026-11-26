import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/creator.dart';
import '../domain/profile_repository.dart';
import '../domain/usecases/profile_usecases.dart';

/// Port: provided by the app's composition root (see app/providers.dart).
final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => throw UnimplementedError('profileRepositoryProvider not provided'),
);

final setOnlineProvider = Provider(
  (ref) => SetOnline(ref.watch(profileRepositoryProvider)),
);
final addAddressProvider = Provider(
  (ref) => AddAddress(ref.watch(profileRepositoryProvider)),
);

final creatorProvider = StreamProvider<Creator>(
  (ref) => WatchCreator(ref.watch(profileRepositoryProvider))(),
);
