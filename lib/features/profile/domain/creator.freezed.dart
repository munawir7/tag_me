// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SocialAccount {

/// "Instagram", "TikTok", "YouTube", … or a custom platform.
 String get platform; String get handle; bool get verified; int? get followers;/// Engagement rate in percent, e.g. 4.1.
 double? get engagement;
/// Create a copy of SocialAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialAccountCopyWith<SocialAccount> get copyWith => _$SocialAccountCopyWithImpl<SocialAccount>(this as SocialAccount, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialAccount&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.engagement, engagement) || other.engagement == engagement));
}


@override
int get hashCode => Object.hash(runtimeType,platform,handle,verified,followers,engagement);

@override
String toString() {
  return 'SocialAccount(platform: $platform, handle: $handle, verified: $verified, followers: $followers, engagement: $engagement)';
}


}

/// @nodoc
abstract mixin class $SocialAccountCopyWith<$Res>  {
  factory $SocialAccountCopyWith(SocialAccount value, $Res Function(SocialAccount) _then) = _$SocialAccountCopyWithImpl;
@useResult
$Res call({
 String platform, String handle, bool verified, int? followers, double? engagement
});




}
/// @nodoc
class _$SocialAccountCopyWithImpl<$Res>
    implements $SocialAccountCopyWith<$Res> {
  _$SocialAccountCopyWithImpl(this._self, this._then);

  final SocialAccount _self;
  final $Res Function(SocialAccount) _then;

/// Create a copy of SocialAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = null,Object? handle = null,Object? verified = null,Object? followers = freezed,Object? engagement = freezed,}) {
  return _then(_self.copyWith(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,handle: null == handle ? _self.handle : handle // ignore: cast_nullable_to_non_nullable
as String,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,followers: freezed == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int?,engagement: freezed == engagement ? _self.engagement : engagement // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SocialAccount].
extension SocialAccountPatterns on SocialAccount {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialAccount() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialAccount value)  $default,){
final _that = this;
switch (_that) {
case _SocialAccount():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialAccount value)?  $default,){
final _that = this;
switch (_that) {
case _SocialAccount() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String platform,  String handle,  bool verified,  int? followers,  double? engagement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialAccount() when $default != null:
return $default(_that.platform,_that.handle,_that.verified,_that.followers,_that.engagement);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String platform,  String handle,  bool verified,  int? followers,  double? engagement)  $default,) {final _that = this;
switch (_that) {
case _SocialAccount():
return $default(_that.platform,_that.handle,_that.verified,_that.followers,_that.engagement);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String platform,  String handle,  bool verified,  int? followers,  double? engagement)?  $default,) {final _that = this;
switch (_that) {
case _SocialAccount() when $default != null:
return $default(_that.platform,_that.handle,_that.verified,_that.followers,_that.engagement);case _:
  return null;

}
}

}

/// @nodoc


class _SocialAccount implements SocialAccount {
  const _SocialAccount({required this.platform, required this.handle, this.verified = false, this.followers, this.engagement});
  

/// "Instagram", "TikTok", "YouTube", … or a custom platform.
@override final  String platform;
@override final  String handle;
@override@JsonKey() final  bool verified;
@override final  int? followers;
/// Engagement rate in percent, e.g. 4.1.
@override final  double? engagement;

/// Create a copy of SocialAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialAccountCopyWith<_SocialAccount> get copyWith => __$SocialAccountCopyWithImpl<_SocialAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialAccount&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.engagement, engagement) || other.engagement == engagement));
}


@override
int get hashCode => Object.hash(runtimeType,platform,handle,verified,followers,engagement);

@override
String toString() {
  return 'SocialAccount(platform: $platform, handle: $handle, verified: $verified, followers: $followers, engagement: $engagement)';
}


}

/// @nodoc
abstract mixin class _$SocialAccountCopyWith<$Res> implements $SocialAccountCopyWith<$Res> {
  factory _$SocialAccountCopyWith(_SocialAccount value, $Res Function(_SocialAccount) _then) = __$SocialAccountCopyWithImpl;
@override @useResult
$Res call({
 String platform, String handle, bool verified, int? followers, double? engagement
});




}
/// @nodoc
class __$SocialAccountCopyWithImpl<$Res>
    implements _$SocialAccountCopyWith<$Res> {
  __$SocialAccountCopyWithImpl(this._self, this._then);

  final _SocialAccount _self;
  final $Res Function(_SocialAccount) _then;

/// Create a copy of SocialAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = null,Object? handle = null,Object? verified = null,Object? followers = freezed,Object? engagement = freezed,}) {
  return _then(_SocialAccount(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,handle: null == handle ? _self.handle : handle // ignore: cast_nullable_to_non_nullable
as String,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,followers: freezed == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int?,engagement: freezed == engagement ? _self.engagement : engagement // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$Address {

 String get id;/// "Home", "Work".
 String get label; String get recipient;/// Full line: "Villa 12, Street 4, Al Barsha 2, Dubai".
 String get line;/// Short form: "Home, Al Barsha".
 String get short; String get phone;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCopyWith<Address> get copyWith => _$AddressCopyWithImpl<Address>(this as Address, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Address&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.line, line) || other.line == line)&&(identical(other.short, short) || other.short == short)&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,recipient,line,short,phone);

@override
String toString() {
  return 'Address(id: $id, label: $label, recipient: $recipient, line: $line, short: $short, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) = _$AddressCopyWithImpl;
@useResult
$Res call({
 String id, String label, String recipient, String line, String short, String phone
});




}
/// @nodoc
class _$AddressCopyWithImpl<$Res>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? recipient = null,Object? line = null,Object? short = null,Object? phone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String,short: null == short ? _self.short : short // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Address].
extension AddressPatterns on Address {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Address value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Address value)  $default,){
final _that = this;
switch (_that) {
case _Address():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Address value)?  $default,){
final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String recipient,  String line,  String short,  String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.label,_that.recipient,_that.line,_that.short,_that.phone);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String recipient,  String line,  String short,  String phone)  $default,) {final _that = this;
switch (_that) {
case _Address():
return $default(_that.id,_that.label,_that.recipient,_that.line,_that.short,_that.phone);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String recipient,  String line,  String short,  String phone)?  $default,) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.id,_that.label,_that.recipient,_that.line,_that.short,_that.phone);case _:
  return null;

}
}

}

/// @nodoc


class _Address implements Address {
  const _Address({required this.id, required this.label, required this.recipient, required this.line, required this.short, required this.phone});
  

@override final  String id;
/// "Home", "Work".
@override final  String label;
@override final  String recipient;
/// Full line: "Villa 12, Street 4, Al Barsha 2, Dubai".
@override final  String line;
/// Short form: "Home, Al Barsha".
@override final  String short;
@override final  String phone;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressCopyWith<_Address> get copyWith => __$AddressCopyWithImpl<_Address>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Address&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.line, line) || other.line == line)&&(identical(other.short, short) || other.short == short)&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,recipient,line,short,phone);

@override
String toString() {
  return 'Address(id: $id, label: $label, recipient: $recipient, line: $line, short: $short, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) = __$AddressCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String recipient, String line, String short, String phone
});




}
/// @nodoc
class __$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? recipient = null,Object? line = null,Object? short = null,Object? phone = null,}) {
  return _then(_Address(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as String,short: null == short ? _self.short : short // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Licence {

 String get number; DateTime? get expiresAt; String? get fileName;
/// Create a copy of Licence
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LicenceCopyWith<Licence> get copyWith => _$LicenceCopyWithImpl<Licence>(this as Licence, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Licence&&(identical(other.number, number) || other.number == number)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}


@override
int get hashCode => Object.hash(runtimeType,number,expiresAt,fileName);

@override
String toString() {
  return 'Licence(number: $number, expiresAt: $expiresAt, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class $LicenceCopyWith<$Res>  {
  factory $LicenceCopyWith(Licence value, $Res Function(Licence) _then) = _$LicenceCopyWithImpl;
@useResult
$Res call({
 String number, DateTime? expiresAt, String? fileName
});




}
/// @nodoc
class _$LicenceCopyWithImpl<$Res>
    implements $LicenceCopyWith<$Res> {
  _$LicenceCopyWithImpl(this._self, this._then);

  final Licence _self;
  final $Res Function(Licence) _then;

/// Create a copy of Licence
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? expiresAt = freezed,Object? fileName = freezed,}) {
  return _then(_self.copyWith(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Licence].
extension LicencePatterns on Licence {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Licence value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Licence() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Licence value)  $default,){
final _that = this;
switch (_that) {
case _Licence():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Licence value)?  $default,){
final _that = this;
switch (_that) {
case _Licence() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  DateTime? expiresAt,  String? fileName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Licence() when $default != null:
return $default(_that.number,_that.expiresAt,_that.fileName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  DateTime? expiresAt,  String? fileName)  $default,) {final _that = this;
switch (_that) {
case _Licence():
return $default(_that.number,_that.expiresAt,_that.fileName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  DateTime? expiresAt,  String? fileName)?  $default,) {final _that = this;
switch (_that) {
case _Licence() when $default != null:
return $default(_that.number,_that.expiresAt,_that.fileName);case _:
  return null;

}
}

}

/// @nodoc


class _Licence implements Licence {
  const _Licence({required this.number, this.expiresAt, this.fileName});
  

@override final  String number;
@override final  DateTime? expiresAt;
@override final  String? fileName;

/// Create a copy of Licence
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LicenceCopyWith<_Licence> get copyWith => __$LicenceCopyWithImpl<_Licence>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Licence&&(identical(other.number, number) || other.number == number)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}


@override
int get hashCode => Object.hash(runtimeType,number,expiresAt,fileName);

@override
String toString() {
  return 'Licence(number: $number, expiresAt: $expiresAt, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class _$LicenceCopyWith<$Res> implements $LicenceCopyWith<$Res> {
  factory _$LicenceCopyWith(_Licence value, $Res Function(_Licence) _then) = __$LicenceCopyWithImpl;
@override @useResult
$Res call({
 String number, DateTime? expiresAt, String? fileName
});




}
/// @nodoc
class __$LicenceCopyWithImpl<$Res>
    implements _$LicenceCopyWith<$Res> {
  __$LicenceCopyWithImpl(this._self, this._then);

  final _Licence _self;
  final $Res Function(_Licence) _then;

/// Create a copy of Licence
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? expiresAt = freezed,Object? fileName = freezed,}) {
  return _then(_Licence(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$Creator {

 String get id; String get name; String get country; String get city; String get whatsapp;/// Up to 3.
 List<String> get categories; List<SocialAccount> get socials; List<Address> get addresses; Licence? get licence;/// Offline creators are hidden from brands and can't apply.
 bool get online;/// 3 strikes freezes the account.
 int get strikes;/// e.g. "TM-CR-20481", encoded in the profile QR.
 String get creatorCode;
/// Create a copy of Creator
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatorCopyWith<Creator> get copyWith => _$CreatorCopyWithImpl<Creator>(this as Creator, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Creator&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.whatsapp, whatsapp) || other.whatsapp == whatsapp)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.socials, socials)&&const DeepCollectionEquality().equals(other.addresses, addresses)&&(identical(other.licence, licence) || other.licence == licence)&&(identical(other.online, online) || other.online == online)&&(identical(other.strikes, strikes) || other.strikes == strikes)&&(identical(other.creatorCode, creatorCode) || other.creatorCode == creatorCode));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,country,city,whatsapp,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(socials),const DeepCollectionEquality().hash(addresses),licence,online,strikes,creatorCode);

@override
String toString() {
  return 'Creator(id: $id, name: $name, country: $country, city: $city, whatsapp: $whatsapp, categories: $categories, socials: $socials, addresses: $addresses, licence: $licence, online: $online, strikes: $strikes, creatorCode: $creatorCode)';
}


}

/// @nodoc
abstract mixin class $CreatorCopyWith<$Res>  {
  factory $CreatorCopyWith(Creator value, $Res Function(Creator) _then) = _$CreatorCopyWithImpl;
@useResult
$Res call({
 String id, String name, String country, String city, String whatsapp, List<String> categories, List<SocialAccount> socials, List<Address> addresses, Licence? licence, bool online, int strikes, String creatorCode
});


$LicenceCopyWith<$Res>? get licence;

}
/// @nodoc
class _$CreatorCopyWithImpl<$Res>
    implements $CreatorCopyWith<$Res> {
  _$CreatorCopyWithImpl(this._self, this._then);

  final Creator _self;
  final $Res Function(Creator) _then;

/// Create a copy of Creator
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? country = null,Object? city = null,Object? whatsapp = null,Object? categories = null,Object? socials = null,Object? addresses = null,Object? licence = freezed,Object? online = null,Object? strikes = null,Object? creatorCode = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,whatsapp: null == whatsapp ? _self.whatsapp : whatsapp // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,socials: null == socials ? _self.socials : socials // ignore: cast_nullable_to_non_nullable
as List<SocialAccount>,addresses: null == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<Address>,licence: freezed == licence ? _self.licence : licence // ignore: cast_nullable_to_non_nullable
as Licence?,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,strikes: null == strikes ? _self.strikes : strikes // ignore: cast_nullable_to_non_nullable
as int,creatorCode: null == creatorCode ? _self.creatorCode : creatorCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Creator
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LicenceCopyWith<$Res>? get licence {
    if (_self.licence == null) {
    return null;
  }

  return $LicenceCopyWith<$Res>(_self.licence!, (value) {
    return _then(_self.copyWith(licence: value));
  });
}
}


/// Adds pattern-matching-related methods to [Creator].
extension CreatorPatterns on Creator {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Creator value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Creator() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Creator value)  $default,){
final _that = this;
switch (_that) {
case _Creator():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Creator value)?  $default,){
final _that = this;
switch (_that) {
case _Creator() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String country,  String city,  String whatsapp,  List<String> categories,  List<SocialAccount> socials,  List<Address> addresses,  Licence? licence,  bool online,  int strikes,  String creatorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Creator() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.city,_that.whatsapp,_that.categories,_that.socials,_that.addresses,_that.licence,_that.online,_that.strikes,_that.creatorCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String country,  String city,  String whatsapp,  List<String> categories,  List<SocialAccount> socials,  List<Address> addresses,  Licence? licence,  bool online,  int strikes,  String creatorCode)  $default,) {final _that = this;
switch (_that) {
case _Creator():
return $default(_that.id,_that.name,_that.country,_that.city,_that.whatsapp,_that.categories,_that.socials,_that.addresses,_that.licence,_that.online,_that.strikes,_that.creatorCode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String country,  String city,  String whatsapp,  List<String> categories,  List<SocialAccount> socials,  List<Address> addresses,  Licence? licence,  bool online,  int strikes,  String creatorCode)?  $default,) {final _that = this;
switch (_that) {
case _Creator() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.city,_that.whatsapp,_that.categories,_that.socials,_that.addresses,_that.licence,_that.online,_that.strikes,_that.creatorCode);case _:
  return null;

}
}

}

/// @nodoc


class _Creator extends Creator {
  const _Creator({required this.id, required this.name, required this.country, required this.city, required this.whatsapp, final  List<String> categories = const [], final  List<SocialAccount> socials = const [], final  List<Address> addresses = const [], this.licence, this.online = true, this.strikes = 0, required this.creatorCode}): _categories = categories,_socials = socials,_addresses = addresses,super._();
  

@override final  String id;
@override final  String name;
@override final  String country;
@override final  String city;
@override final  String whatsapp;
/// Up to 3.
 final  List<String> _categories;
/// Up to 3.
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<SocialAccount> _socials;
@override@JsonKey() List<SocialAccount> get socials {
  if (_socials is EqualUnmodifiableListView) return _socials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_socials);
}

 final  List<Address> _addresses;
@override@JsonKey() List<Address> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}

@override final  Licence? licence;
/// Offline creators are hidden from brands and can't apply.
@override@JsonKey() final  bool online;
/// 3 strikes freezes the account.
@override@JsonKey() final  int strikes;
/// e.g. "TM-CR-20481", encoded in the profile QR.
@override final  String creatorCode;

/// Create a copy of Creator
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatorCopyWith<_Creator> get copyWith => __$CreatorCopyWithImpl<_Creator>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Creator&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.whatsapp, whatsapp) || other.whatsapp == whatsapp)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._socials, _socials)&&const DeepCollectionEquality().equals(other._addresses, _addresses)&&(identical(other.licence, licence) || other.licence == licence)&&(identical(other.online, online) || other.online == online)&&(identical(other.strikes, strikes) || other.strikes == strikes)&&(identical(other.creatorCode, creatorCode) || other.creatorCode == creatorCode));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,country,city,whatsapp,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_socials),const DeepCollectionEquality().hash(_addresses),licence,online,strikes,creatorCode);

@override
String toString() {
  return 'Creator(id: $id, name: $name, country: $country, city: $city, whatsapp: $whatsapp, categories: $categories, socials: $socials, addresses: $addresses, licence: $licence, online: $online, strikes: $strikes, creatorCode: $creatorCode)';
}


}

/// @nodoc
abstract mixin class _$CreatorCopyWith<$Res> implements $CreatorCopyWith<$Res> {
  factory _$CreatorCopyWith(_Creator value, $Res Function(_Creator) _then) = __$CreatorCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String country, String city, String whatsapp, List<String> categories, List<SocialAccount> socials, List<Address> addresses, Licence? licence, bool online, int strikes, String creatorCode
});


@override $LicenceCopyWith<$Res>? get licence;

}
/// @nodoc
class __$CreatorCopyWithImpl<$Res>
    implements _$CreatorCopyWith<$Res> {
  __$CreatorCopyWithImpl(this._self, this._then);

  final _Creator _self;
  final $Res Function(_Creator) _then;

/// Create a copy of Creator
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? country = null,Object? city = null,Object? whatsapp = null,Object? categories = null,Object? socials = null,Object? addresses = null,Object? licence = freezed,Object? online = null,Object? strikes = null,Object? creatorCode = null,}) {
  return _then(_Creator(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,whatsapp: null == whatsapp ? _self.whatsapp : whatsapp // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,socials: null == socials ? _self._socials : socials // ignore: cast_nullable_to_non_nullable
as List<SocialAccount>,addresses: null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<Address>,licence: freezed == licence ? _self.licence : licence // ignore: cast_nullable_to_non_nullable
as Licence?,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,strikes: null == strikes ? _self.strikes : strikes // ignore: cast_nullable_to_non_nullable
as int,creatorCode: null == creatorCode ? _self.creatorCode : creatorCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Creator
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LicenceCopyWith<$Res>? get licence {
    if (_self.licence == null) {
    return null;
  }

  return $LicenceCopyWith<$Res>(_self.licence!, (value) {
    return _then(_self.copyWith(licence: value));
  });
}
}

// dart format on
