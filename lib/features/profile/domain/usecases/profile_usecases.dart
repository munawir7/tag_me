import '../creator.dart';
import '../profile_repository.dart';

class WatchCreator {
  const WatchCreator(this._profile);
  final ProfileRepository _profile;
  Stream<Creator> call() => _profile.watch();
}

/// Offline creators are hidden from brands and can't apply; ongoing
/// collabs continue.
class SetOnline {
  const SetOnline(this._profile);
  final ProfileRepository _profile;
  Future<void> call(bool online) => _profile.setOnline(online);
}

/// Which fields of a new address are wrong.
enum AddressField { line, area, phone }

class InvalidAddressError implements Exception {
  InvalidAddressError(this.fields);
  final Set<AddressField> fields;
  @override
  String toString() => 'InvalidAddressError(${fields.map((f) => f.name)})';
}

/// Saves a delivery address. Builds the short form ("Home, Al Barsha")
/// from [label] and [area]; throws [InvalidAddressError].
class AddAddress {
  const AddAddress(this._profile);
  final ProfileRepository _profile;

  Future<Address> call({
    required String label,
    required String recipient,
    required String line,
    required String area,
    required String phone,
  }) {
    final errors = validate(line: line, area: area, phone: phone);
    if (errors.isNotEmpty) throw InvalidAddressError(errors);
    final a = area.trim();
    return _profile.addAddress(
      Address(
        id: '',
        label: label.trim(),
        recipient: recipient.trim(),
        line: '${line.trim()}, $a',
        short: '${label.trim()}, $a',
        phone: phone.trim(),
      ),
    );
  }

  /// Empty when the input is valid.
  static Set<AddressField> validate({
    required String line,
    required String area,
    required String phone,
  }) {
    final digits = phone.replaceAll(RegExp(r'[^0-9]'), '');
    return {
      if (line.trim().length < 5) AddressField.line,
      if (area.trim().isEmpty) AddressField.area,
      // International numbers: 8–15 digits.
      if (digits.length < 8 || digits.length > 15) AddressField.phone,
    };
  }
}
