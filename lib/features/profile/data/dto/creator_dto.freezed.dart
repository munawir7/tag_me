// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creator_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatorDto {

 String get id; String get name; String get country; String get city; String get whatsapp; List<String> get categories; List<SocialAccountDto> get socials; List<AddressDto> get addresses; LicenceDto? get licence; bool get online; int get strikes; String get creatorCode;
/// Create a copy of CreatorDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatorDtoCopyWith<CreatorDto> get copyWith => _$CreatorDtoCopyWithImpl<CreatorDto>(this as CreatorDto, _$identity);

  /// Serializes this CreatorDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatorDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.whatsapp, whatsapp) || other.whatsapp == whatsapp)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.socials, socials)&&const DeepCollectionEquality().equals(other.addresses, addresses)&&(identical(other.licence, licence) || other.licence == licence)&&(identical(other.online, online) || other.online == online)&&(identical(other.strikes, strikes) || other.strikes == strikes)&&(identical(other.creatorCode, creatorCode) || other.creatorCode == creatorCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,country,city,whatsapp,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(socials),const DeepCollectionEquality().hash(addresses),licence,online,strikes,creatorCode);

@override
String toString() {
  return 'CreatorDto(id: $id, name: $name, country: $country, city: $city, whatsapp: $whatsapp, categories: $categories, socials: $socials, addresses: $addresses, licence: $licence, online: $online, strikes: $strikes, creatorCode: $creatorCode)';
}


}

/// @nodoc
abstract mixin class $CreatorDtoCopyWith<$Res>  {
  factory $CreatorDtoCopyWith(CreatorDto value, $Res Function(CreatorDto) _then) = _$CreatorDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String country, String city, String whatsapp, List<String> categories, List<SocialAccountDto> socials, List<AddressDto> addresses, LicenceDto? licence, bool online, int strikes, String creatorCode
});


$LicenceDtoCopyWith<$Res>? get licence;

}
/// @nodoc
class _$CreatorDtoCopyWithImpl<$Res>
    implements $CreatorDtoCopyWith<$Res> {
  _$CreatorDtoCopyWithImpl(this._self, this._then);

  final CreatorDto _self;
  final $Res Function(CreatorDto) _then;

/// Create a copy of CreatorDto
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
as List<SocialAccountDto>,addresses: null == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<AddressDto>,licence: freezed == licence ? _self.licence : licence // ignore: cast_nullable_to_non_nullable
as LicenceDto?,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,strikes: null == strikes ? _self.strikes : strikes // ignore: cast_nullable_to_non_nullable
as int,creatorCode: null == creatorCode ? _self.creatorCode : creatorCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CreatorDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LicenceDtoCopyWith<$Res>? get licence {
    if (_self.licence == null) {
    return null;
  }

  return $LicenceDtoCopyWith<$Res>(_self.licence!, (value) {
    return _then(_self.copyWith(licence: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreatorDto].
extension CreatorDtoPatterns on CreatorDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatorDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatorDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatorDto value)  $default,){
final _that = this;
switch (_that) {
case _CreatorDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatorDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreatorDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String country,  String city,  String whatsapp,  List<String> categories,  List<SocialAccountDto> socials,  List<AddressDto> addresses,  LicenceDto? licence,  bool online,  int strikes,  String creatorCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatorDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String country,  String city,  String whatsapp,  List<String> categories,  List<SocialAccountDto> socials,  List<AddressDto> addresses,  LicenceDto? licence,  bool online,  int strikes,  String creatorCode)  $default,) {final _that = this;
switch (_that) {
case _CreatorDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String country,  String city,  String whatsapp,  List<String> categories,  List<SocialAccountDto> socials,  List<AddressDto> addresses,  LicenceDto? licence,  bool online,  int strikes,  String creatorCode)?  $default,) {final _that = this;
switch (_that) {
case _CreatorDto() when $default != null:
return $default(_that.id,_that.name,_that.country,_that.city,_that.whatsapp,_that.categories,_that.socials,_that.addresses,_that.licence,_that.online,_that.strikes,_that.creatorCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatorDto extends CreatorDto {
  const _CreatorDto({required this.id, required this.name, required this.country, required this.city, required this.whatsapp, final  List<String> categories = const [], final  List<SocialAccountDto> socials = const [], final  List<AddressDto> addresses = const [], this.licence, this.online = true, this.strikes = 0, required this.creatorCode}): _categories = categories,_socials = socials,_addresses = addresses,super._();
  factory _CreatorDto.fromJson(Map<String, dynamic> json) => _$CreatorDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String country;
@override final  String city;
@override final  String whatsapp;
 final  List<String> _categories;
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<SocialAccountDto> _socials;
@override@JsonKey() List<SocialAccountDto> get socials {
  if (_socials is EqualUnmodifiableListView) return _socials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_socials);
}

 final  List<AddressDto> _addresses;
@override@JsonKey() List<AddressDto> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}

@override final  LicenceDto? licence;
@override@JsonKey() final  bool online;
@override@JsonKey() final  int strikes;
@override final  String creatorCode;

/// Create a copy of CreatorDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatorDtoCopyWith<_CreatorDto> get copyWith => __$CreatorDtoCopyWithImpl<_CreatorDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatorDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatorDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.whatsapp, whatsapp) || other.whatsapp == whatsapp)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._socials, _socials)&&const DeepCollectionEquality().equals(other._addresses, _addresses)&&(identical(other.licence, licence) || other.licence == licence)&&(identical(other.online, online) || other.online == online)&&(identical(other.strikes, strikes) || other.strikes == strikes)&&(identical(other.creatorCode, creatorCode) || other.creatorCode == creatorCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,country,city,whatsapp,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_socials),const DeepCollectionEquality().hash(_addresses),licence,online,strikes,creatorCode);

@override
String toString() {
  return 'CreatorDto(id: $id, name: $name, country: $country, city: $city, whatsapp: $whatsapp, categories: $categories, socials: $socials, addresses: $addresses, licence: $licence, online: $online, strikes: $strikes, creatorCode: $creatorCode)';
}


}

/// @nodoc
abstract mixin class _$CreatorDtoCopyWith<$Res> implements $CreatorDtoCopyWith<$Res> {
  factory _$CreatorDtoCopyWith(_CreatorDto value, $Res Function(_CreatorDto) _then) = __$CreatorDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String country, String city, String whatsapp, List<String> categories, List<SocialAccountDto> socials, List<AddressDto> addresses, LicenceDto? licence, bool online, int strikes, String creatorCode
});


@override $LicenceDtoCopyWith<$Res>? get licence;

}
/// @nodoc
class __$CreatorDtoCopyWithImpl<$Res>
    implements _$CreatorDtoCopyWith<$Res> {
  __$CreatorDtoCopyWithImpl(this._self, this._then);

  final _CreatorDto _self;
  final $Res Function(_CreatorDto) _then;

/// Create a copy of CreatorDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? country = null,Object? city = null,Object? whatsapp = null,Object? categories = null,Object? socials = null,Object? addresses = null,Object? licence = freezed,Object? online = null,Object? strikes = null,Object? creatorCode = null,}) {
  return _then(_CreatorDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,whatsapp: null == whatsapp ? _self.whatsapp : whatsapp // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,socials: null == socials ? _self._socials : socials // ignore: cast_nullable_to_non_nullable
as List<SocialAccountDto>,addresses: null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<AddressDto>,licence: freezed == licence ? _self.licence : licence // ignore: cast_nullable_to_non_nullable
as LicenceDto?,online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,strikes: null == strikes ? _self.strikes : strikes // ignore: cast_nullable_to_non_nullable
as int,creatorCode: null == creatorCode ? _self.creatorCode : creatorCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CreatorDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LicenceDtoCopyWith<$Res>? get licence {
    if (_self.licence == null) {
    return null;
  }

  return $LicenceDtoCopyWith<$Res>(_self.licence!, (value) {
    return _then(_self.copyWith(licence: value));
  });
}
}


/// @nodoc
mixin _$SocialAccountDto {

 String get platform; String get handle; bool get verified; int? get followers; double? get engagement;
/// Create a copy of SocialAccountDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialAccountDtoCopyWith<SocialAccountDto> get copyWith => _$SocialAccountDtoCopyWithImpl<SocialAccountDto>(this as SocialAccountDto, _$identity);

  /// Serializes this SocialAccountDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialAccountDto&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.engagement, engagement) || other.engagement == engagement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,platform,handle,verified,followers,engagement);

@override
String toString() {
  return 'SocialAccountDto(platform: $platform, handle: $handle, verified: $verified, followers: $followers, engagement: $engagement)';
}


}

/// @nodoc
abstract mixin class $SocialAccountDtoCopyWith<$Res>  {
  factory $SocialAccountDtoCopyWith(SocialAccountDto value, $Res Function(SocialAccountDto) _then) = _$SocialAccountDtoCopyWithImpl;
@useResult
$Res call({
 String platform, String handle, bool verified, int? followers, double? engagement
});




}
/// @nodoc
class _$SocialAccountDtoCopyWithImpl<$Res>
    implements $SocialAccountDtoCopyWith<$Res> {
  _$SocialAccountDtoCopyWithImpl(this._self, this._then);

  final SocialAccountDto _self;
  final $Res Function(SocialAccountDto) _then;

/// Create a copy of SocialAccountDto
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


/// Adds pattern-matching-related methods to [SocialAccountDto].
extension SocialAccountDtoPatterns on SocialAccountDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialAccountDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialAccountDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialAccountDto value)  $default,){
final _that = this;
switch (_that) {
case _SocialAccountDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialAccountDto value)?  $default,){
final _that = this;
switch (_that) {
case _SocialAccountDto() when $default != null:
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
case _SocialAccountDto() when $default != null:
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
case _SocialAccountDto():
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
case _SocialAccountDto() when $default != null:
return $default(_that.platform,_that.handle,_that.verified,_that.followers,_that.engagement);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocialAccountDto extends SocialAccountDto {
  const _SocialAccountDto({required this.platform, required this.handle, this.verified = false, this.followers, this.engagement}): super._();
  factory _SocialAccountDto.fromJson(Map<String, dynamic> json) => _$SocialAccountDtoFromJson(json);

@override final  String platform;
@override final  String handle;
@override@JsonKey() final  bool verified;
@override final  int? followers;
@override final  double? engagement;

/// Create a copy of SocialAccountDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialAccountDtoCopyWith<_SocialAccountDto> get copyWith => __$SocialAccountDtoCopyWithImpl<_SocialAccountDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialAccountDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialAccountDto&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.engagement, engagement) || other.engagement == engagement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,platform,handle,verified,followers,engagement);

@override
String toString() {
  return 'SocialAccountDto(platform: $platform, handle: $handle, verified: $verified, followers: $followers, engagement: $engagement)';
}


}

/// @nodoc
abstract mixin class _$SocialAccountDtoCopyWith<$Res> implements $SocialAccountDtoCopyWith<$Res> {
  factory _$SocialAccountDtoCopyWith(_SocialAccountDto value, $Res Function(_SocialAccountDto) _then) = __$SocialAccountDtoCopyWithImpl;
@override @useResult
$Res call({
 String platform, String handle, bool verified, int? followers, double? engagement
});




}
/// @nodoc
class __$SocialAccountDtoCopyWithImpl<$Res>
    implements _$SocialAccountDtoCopyWith<$Res> {
  __$SocialAccountDtoCopyWithImpl(this._self, this._then);

  final _SocialAccountDto _self;
  final $Res Function(_SocialAccountDto) _then;

/// Create a copy of SocialAccountDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = null,Object? handle = null,Object? verified = null,Object? followers = freezed,Object? engagement = freezed,}) {
  return _then(_SocialAccountDto(
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
mixin _$AddressDto {

 String get id; String get label; String get recipient; String get line; String get short; String get phone;
/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressDtoCopyWith<AddressDto> get copyWith => _$AddressDtoCopyWithImpl<AddressDto>(this as AddressDto, _$identity);

  /// Serializes this AddressDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.line, line) || other.line == line)&&(identical(other.short, short) || other.short == short)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,recipient,line,short,phone);

@override
String toString() {
  return 'AddressDto(id: $id, label: $label, recipient: $recipient, line: $line, short: $short, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $AddressDtoCopyWith<$Res>  {
  factory $AddressDtoCopyWith(AddressDto value, $Res Function(AddressDto) _then) = _$AddressDtoCopyWithImpl;
@useResult
$Res call({
 String id, String label, String recipient, String line, String short, String phone
});




}
/// @nodoc
class _$AddressDtoCopyWithImpl<$Res>
    implements $AddressDtoCopyWith<$Res> {
  _$AddressDtoCopyWithImpl(this._self, this._then);

  final AddressDto _self;
  final $Res Function(AddressDto) _then;

/// Create a copy of AddressDto
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


/// Adds pattern-matching-related methods to [AddressDto].
extension AddressDtoPatterns on AddressDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressDto value)  $default,){
final _that = this;
switch (_that) {
case _AddressDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressDto value)?  $default,){
final _that = this;
switch (_that) {
case _AddressDto() when $default != null:
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
case _AddressDto() when $default != null:
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
case _AddressDto():
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
case _AddressDto() when $default != null:
return $default(_that.id,_that.label,_that.recipient,_that.line,_that.short,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressDto extends AddressDto {
  const _AddressDto({required this.id, required this.label, required this.recipient, required this.line, required this.short, required this.phone}): super._();
  factory _AddressDto.fromJson(Map<String, dynamic> json) => _$AddressDtoFromJson(json);

@override final  String id;
@override final  String label;
@override final  String recipient;
@override final  String line;
@override final  String short;
@override final  String phone;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressDtoCopyWith<_AddressDto> get copyWith => __$AddressDtoCopyWithImpl<_AddressDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.line, line) || other.line == line)&&(identical(other.short, short) || other.short == short)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,recipient,line,short,phone);

@override
String toString() {
  return 'AddressDto(id: $id, label: $label, recipient: $recipient, line: $line, short: $short, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$AddressDtoCopyWith<$Res> implements $AddressDtoCopyWith<$Res> {
  factory _$AddressDtoCopyWith(_AddressDto value, $Res Function(_AddressDto) _then) = __$AddressDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String recipient, String line, String short, String phone
});




}
/// @nodoc
class __$AddressDtoCopyWithImpl<$Res>
    implements _$AddressDtoCopyWith<$Res> {
  __$AddressDtoCopyWithImpl(this._self, this._then);

  final _AddressDto _self;
  final $Res Function(_AddressDto) _then;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? recipient = null,Object? line = null,Object? short = null,Object? phone = null,}) {
  return _then(_AddressDto(
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
mixin _$LicenceDto {

 String get number; DateTime? get expiresAt; String? get fileName;
/// Create a copy of LicenceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LicenceDtoCopyWith<LicenceDto> get copyWith => _$LicenceDtoCopyWithImpl<LicenceDto>(this as LicenceDto, _$identity);

  /// Serializes this LicenceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LicenceDto&&(identical(other.number, number) || other.number == number)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,expiresAt,fileName);

@override
String toString() {
  return 'LicenceDto(number: $number, expiresAt: $expiresAt, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class $LicenceDtoCopyWith<$Res>  {
  factory $LicenceDtoCopyWith(LicenceDto value, $Res Function(LicenceDto) _then) = _$LicenceDtoCopyWithImpl;
@useResult
$Res call({
 String number, DateTime? expiresAt, String? fileName
});




}
/// @nodoc
class _$LicenceDtoCopyWithImpl<$Res>
    implements $LicenceDtoCopyWith<$Res> {
  _$LicenceDtoCopyWithImpl(this._self, this._then);

  final LicenceDto _self;
  final $Res Function(LicenceDto) _then;

/// Create a copy of LicenceDto
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


/// Adds pattern-matching-related methods to [LicenceDto].
extension LicenceDtoPatterns on LicenceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LicenceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LicenceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LicenceDto value)  $default,){
final _that = this;
switch (_that) {
case _LicenceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LicenceDto value)?  $default,){
final _that = this;
switch (_that) {
case _LicenceDto() when $default != null:
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
case _LicenceDto() when $default != null:
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
case _LicenceDto():
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
case _LicenceDto() when $default != null:
return $default(_that.number,_that.expiresAt,_that.fileName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LicenceDto extends LicenceDto {
  const _LicenceDto({required this.number, this.expiresAt, this.fileName}): super._();
  factory _LicenceDto.fromJson(Map<String, dynamic> json) => _$LicenceDtoFromJson(json);

@override final  String number;
@override final  DateTime? expiresAt;
@override final  String? fileName;

/// Create a copy of LicenceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LicenceDtoCopyWith<_LicenceDto> get copyWith => __$LicenceDtoCopyWithImpl<_LicenceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LicenceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LicenceDto&&(identical(other.number, number) || other.number == number)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,expiresAt,fileName);

@override
String toString() {
  return 'LicenceDto(number: $number, expiresAt: $expiresAt, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class _$LicenceDtoCopyWith<$Res> implements $LicenceDtoCopyWith<$Res> {
  factory _$LicenceDtoCopyWith(_LicenceDto value, $Res Function(_LicenceDto) _then) = __$LicenceDtoCopyWithImpl;
@override @useResult
$Res call({
 String number, DateTime? expiresAt, String? fileName
});




}
/// @nodoc
class __$LicenceDtoCopyWithImpl<$Res>
    implements _$LicenceDtoCopyWith<$Res> {
  __$LicenceDtoCopyWithImpl(this._self, this._then);

  final _LicenceDto _self;
  final $Res Function(_LicenceDto) _then;

/// Create a copy of LicenceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? expiresAt = freezed,Object? fileName = freezed,}) {
  return _then(_LicenceDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
