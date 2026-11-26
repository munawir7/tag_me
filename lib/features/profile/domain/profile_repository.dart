import 'creator.dart';

abstract interface class ProfileRepository {
  Stream<Creator> watch();
  Future<void> setOnline(bool online);
  Future<Address> addAddress(Address address);
}
