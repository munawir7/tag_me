// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletDto {

 int get available; int get onHold; int get holds; int? get nextExpiryAmount; DateTime? get nextExpiryDate; String get referralCode; List<CreditTxnDto> get history;
/// Create a copy of WalletDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletDtoCopyWith<WalletDto> get copyWith => _$WalletDtoCopyWithImpl<WalletDto>(this as WalletDto, _$identity);

  /// Serializes this WalletDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletDto&&(identical(other.available, available) || other.available == available)&&(identical(other.onHold, onHold) || other.onHold == onHold)&&(identical(other.holds, holds) || other.holds == holds)&&(identical(other.nextExpiryAmount, nextExpiryAmount) || other.nextExpiryAmount == nextExpiryAmount)&&(identical(other.nextExpiryDate, nextExpiryDate) || other.nextExpiryDate == nextExpiryDate)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&const DeepCollectionEquality().equals(other.history, history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,available,onHold,holds,nextExpiryAmount,nextExpiryDate,referralCode,const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'WalletDto(available: $available, onHold: $onHold, holds: $holds, nextExpiryAmount: $nextExpiryAmount, nextExpiryDate: $nextExpiryDate, referralCode: $referralCode, history: $history)';
}


}

/// @nodoc
abstract mixin class $WalletDtoCopyWith<$Res>  {
  factory $WalletDtoCopyWith(WalletDto value, $Res Function(WalletDto) _then) = _$WalletDtoCopyWithImpl;
@useResult
$Res call({
 int available, int onHold, int holds, int? nextExpiryAmount, DateTime? nextExpiryDate, String referralCode, List<CreditTxnDto> history
});




}
/// @nodoc
class _$WalletDtoCopyWithImpl<$Res>
    implements $WalletDtoCopyWith<$Res> {
  _$WalletDtoCopyWithImpl(this._self, this._then);

  final WalletDto _self;
  final $Res Function(WalletDto) _then;

/// Create a copy of WalletDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? available = null,Object? onHold = null,Object? holds = null,Object? nextExpiryAmount = freezed,Object? nextExpiryDate = freezed,Object? referralCode = null,Object? history = null,}) {
  return _then(_self.copyWith(
available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,onHold: null == onHold ? _self.onHold : onHold // ignore: cast_nullable_to_non_nullable
as int,holds: null == holds ? _self.holds : holds // ignore: cast_nullable_to_non_nullable
as int,nextExpiryAmount: freezed == nextExpiryAmount ? _self.nextExpiryAmount : nextExpiryAmount // ignore: cast_nullable_to_non_nullable
as int?,nextExpiryDate: freezed == nextExpiryDate ? _self.nextExpiryDate : nextExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<CreditTxnDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletDto].
extension WalletDtoPatterns on WalletDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletDto value)  $default,){
final _that = this;
switch (_that) {
case _WalletDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletDto value)?  $default,){
final _that = this;
switch (_that) {
case _WalletDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int available,  int onHold,  int holds,  int? nextExpiryAmount,  DateTime? nextExpiryDate,  String referralCode,  List<CreditTxnDto> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletDto() when $default != null:
return $default(_that.available,_that.onHold,_that.holds,_that.nextExpiryAmount,_that.nextExpiryDate,_that.referralCode,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int available,  int onHold,  int holds,  int? nextExpiryAmount,  DateTime? nextExpiryDate,  String referralCode,  List<CreditTxnDto> history)  $default,) {final _that = this;
switch (_that) {
case _WalletDto():
return $default(_that.available,_that.onHold,_that.holds,_that.nextExpiryAmount,_that.nextExpiryDate,_that.referralCode,_that.history);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int available,  int onHold,  int holds,  int? nextExpiryAmount,  DateTime? nextExpiryDate,  String referralCode,  List<CreditTxnDto> history)?  $default,) {final _that = this;
switch (_that) {
case _WalletDto() when $default != null:
return $default(_that.available,_that.onHold,_that.holds,_that.nextExpiryAmount,_that.nextExpiryDate,_that.referralCode,_that.history);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletDto extends WalletDto {
  const _WalletDto({required this.available, required this.onHold, this.holds = 0, this.nextExpiryAmount, this.nextExpiryDate, required this.referralCode, final  List<CreditTxnDto> history = const []}): _history = history,super._();
  factory _WalletDto.fromJson(Map<String, dynamic> json) => _$WalletDtoFromJson(json);

@override final  int available;
@override final  int onHold;
@override@JsonKey() final  int holds;
@override final  int? nextExpiryAmount;
@override final  DateTime? nextExpiryDate;
@override final  String referralCode;
 final  List<CreditTxnDto> _history;
@override@JsonKey() List<CreditTxnDto> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of WalletDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletDtoCopyWith<_WalletDto> get copyWith => __$WalletDtoCopyWithImpl<_WalletDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletDto&&(identical(other.available, available) || other.available == available)&&(identical(other.onHold, onHold) || other.onHold == onHold)&&(identical(other.holds, holds) || other.holds == holds)&&(identical(other.nextExpiryAmount, nextExpiryAmount) || other.nextExpiryAmount == nextExpiryAmount)&&(identical(other.nextExpiryDate, nextExpiryDate) || other.nextExpiryDate == nextExpiryDate)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&const DeepCollectionEquality().equals(other._history, _history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,available,onHold,holds,nextExpiryAmount,nextExpiryDate,referralCode,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'WalletDto(available: $available, onHold: $onHold, holds: $holds, nextExpiryAmount: $nextExpiryAmount, nextExpiryDate: $nextExpiryDate, referralCode: $referralCode, history: $history)';
}


}

/// @nodoc
abstract mixin class _$WalletDtoCopyWith<$Res> implements $WalletDtoCopyWith<$Res> {
  factory _$WalletDtoCopyWith(_WalletDto value, $Res Function(_WalletDto) _then) = __$WalletDtoCopyWithImpl;
@override @useResult
$Res call({
 int available, int onHold, int holds, int? nextExpiryAmount, DateTime? nextExpiryDate, String referralCode, List<CreditTxnDto> history
});




}
/// @nodoc
class __$WalletDtoCopyWithImpl<$Res>
    implements _$WalletDtoCopyWith<$Res> {
  __$WalletDtoCopyWithImpl(this._self, this._then);

  final _WalletDto _self;
  final $Res Function(_WalletDto) _then;

/// Create a copy of WalletDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? available = null,Object? onHold = null,Object? holds = null,Object? nextExpiryAmount = freezed,Object? nextExpiryDate = freezed,Object? referralCode = null,Object? history = null,}) {
  return _then(_WalletDto(
available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,onHold: null == onHold ? _self.onHold : onHold // ignore: cast_nullable_to_non_nullable
as int,holds: null == holds ? _self.holds : holds // ignore: cast_nullable_to_non_nullable
as int,nextExpiryAmount: freezed == nextExpiryAmount ? _self.nextExpiryAmount : nextExpiryAmount // ignore: cast_nullable_to_non_nullable
as int?,nextExpiryDate: freezed == nextExpiryDate ? _self.nextExpiryDate : nextExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<CreditTxnDto>,
  ));
}


}


/// @nodoc
mixin _$CreditTxnDto {

 String get id; String get kind; int get amount; String get title; String get note; DateTime get at; DateTime? get expiresAt; String? get dealId;
/// Create a copy of CreditTxnDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditTxnDtoCopyWith<CreditTxnDto> get copyWith => _$CreditTxnDtoCopyWithImpl<CreditTxnDto>(this as CreditTxnDto, _$identity);

  /// Serializes this CreditTxnDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditTxnDto&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.title, title) || other.title == title)&&(identical(other.note, note) || other.note == note)&&(identical(other.at, at) || other.at == at)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.dealId, dealId) || other.dealId == dealId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,amount,title,note,at,expiresAt,dealId);

@override
String toString() {
  return 'CreditTxnDto(id: $id, kind: $kind, amount: $amount, title: $title, note: $note, at: $at, expiresAt: $expiresAt, dealId: $dealId)';
}


}

/// @nodoc
abstract mixin class $CreditTxnDtoCopyWith<$Res>  {
  factory $CreditTxnDtoCopyWith(CreditTxnDto value, $Res Function(CreditTxnDto) _then) = _$CreditTxnDtoCopyWithImpl;
@useResult
$Res call({
 String id, String kind, int amount, String title, String note, DateTime at, DateTime? expiresAt, String? dealId
});




}
/// @nodoc
class _$CreditTxnDtoCopyWithImpl<$Res>
    implements $CreditTxnDtoCopyWith<$Res> {
  _$CreditTxnDtoCopyWithImpl(this._self, this._then);

  final CreditTxnDto _self;
  final $Res Function(CreditTxnDto) _then;

/// Create a copy of CreditTxnDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? amount = null,Object? title = null,Object? note = null,Object? at = null,Object? expiresAt = freezed,Object? dealId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dealId: freezed == dealId ? _self.dealId : dealId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditTxnDto].
extension CreditTxnDtoPatterns on CreditTxnDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditTxnDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditTxnDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditTxnDto value)  $default,){
final _that = this;
switch (_that) {
case _CreditTxnDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditTxnDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreditTxnDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  int amount,  String title,  String note,  DateTime at,  DateTime? expiresAt,  String? dealId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditTxnDto() when $default != null:
return $default(_that.id,_that.kind,_that.amount,_that.title,_that.note,_that.at,_that.expiresAt,_that.dealId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  int amount,  String title,  String note,  DateTime at,  DateTime? expiresAt,  String? dealId)  $default,) {final _that = this;
switch (_that) {
case _CreditTxnDto():
return $default(_that.id,_that.kind,_that.amount,_that.title,_that.note,_that.at,_that.expiresAt,_that.dealId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  int amount,  String title,  String note,  DateTime at,  DateTime? expiresAt,  String? dealId)?  $default,) {final _that = this;
switch (_that) {
case _CreditTxnDto() when $default != null:
return $default(_that.id,_that.kind,_that.amount,_that.title,_that.note,_that.at,_that.expiresAt,_that.dealId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditTxnDto extends CreditTxnDto {
  const _CreditTxnDto({required this.id, required this.kind, required this.amount, required this.title, required this.note, required this.at, this.expiresAt, this.dealId}): super._();
  factory _CreditTxnDto.fromJson(Map<String, dynamic> json) => _$CreditTxnDtoFromJson(json);

@override final  String id;
@override final  String kind;
@override final  int amount;
@override final  String title;
@override final  String note;
@override final  DateTime at;
@override final  DateTime? expiresAt;
@override final  String? dealId;

/// Create a copy of CreditTxnDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditTxnDtoCopyWith<_CreditTxnDto> get copyWith => __$CreditTxnDtoCopyWithImpl<_CreditTxnDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditTxnDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditTxnDto&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.title, title) || other.title == title)&&(identical(other.note, note) || other.note == note)&&(identical(other.at, at) || other.at == at)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.dealId, dealId) || other.dealId == dealId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,amount,title,note,at,expiresAt,dealId);

@override
String toString() {
  return 'CreditTxnDto(id: $id, kind: $kind, amount: $amount, title: $title, note: $note, at: $at, expiresAt: $expiresAt, dealId: $dealId)';
}


}

/// @nodoc
abstract mixin class _$CreditTxnDtoCopyWith<$Res> implements $CreditTxnDtoCopyWith<$Res> {
  factory _$CreditTxnDtoCopyWith(_CreditTxnDto value, $Res Function(_CreditTxnDto) _then) = __$CreditTxnDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, int amount, String title, String note, DateTime at, DateTime? expiresAt, String? dealId
});




}
/// @nodoc
class __$CreditTxnDtoCopyWithImpl<$Res>
    implements _$CreditTxnDtoCopyWith<$Res> {
  __$CreditTxnDtoCopyWithImpl(this._self, this._then);

  final _CreditTxnDto _self;
  final $Res Function(_CreditTxnDto) _then;

/// Create a copy of CreditTxnDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? amount = null,Object? title = null,Object? note = null,Object? at = null,Object? expiresAt = freezed,Object? dealId = freezed,}) {
  return _then(_CreditTxnDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dealId: freezed == dealId ? _self.dealId : dealId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreditPackDto {

 String get id; int get credits; int? get priceAed; String? get tag;
/// Create a copy of CreditPackDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditPackDtoCopyWith<CreditPackDto> get copyWith => _$CreditPackDtoCopyWithImpl<CreditPackDto>(this as CreditPackDto, _$identity);

  /// Serializes this CreditPackDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditPackDto&&(identical(other.id, id) || other.id == id)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.priceAed, priceAed) || other.priceAed == priceAed)&&(identical(other.tag, tag) || other.tag == tag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,credits,priceAed,tag);

@override
String toString() {
  return 'CreditPackDto(id: $id, credits: $credits, priceAed: $priceAed, tag: $tag)';
}


}

/// @nodoc
abstract mixin class $CreditPackDtoCopyWith<$Res>  {
  factory $CreditPackDtoCopyWith(CreditPackDto value, $Res Function(CreditPackDto) _then) = _$CreditPackDtoCopyWithImpl;
@useResult
$Res call({
 String id, int credits, int? priceAed, String? tag
});




}
/// @nodoc
class _$CreditPackDtoCopyWithImpl<$Res>
    implements $CreditPackDtoCopyWith<$Res> {
  _$CreditPackDtoCopyWithImpl(this._self, this._then);

  final CreditPackDto _self;
  final $Res Function(CreditPackDto) _then;

/// Create a copy of CreditPackDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? credits = null,Object? priceAed = freezed,Object? tag = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,priceAed: freezed == priceAed ? _self.priceAed : priceAed // ignore: cast_nullable_to_non_nullable
as int?,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditPackDto].
extension CreditPackDtoPatterns on CreditPackDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditPackDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditPackDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditPackDto value)  $default,){
final _that = this;
switch (_that) {
case _CreditPackDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditPackDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreditPackDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int credits,  int? priceAed,  String? tag)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditPackDto() when $default != null:
return $default(_that.id,_that.credits,_that.priceAed,_that.tag);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int credits,  int? priceAed,  String? tag)  $default,) {final _that = this;
switch (_that) {
case _CreditPackDto():
return $default(_that.id,_that.credits,_that.priceAed,_that.tag);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int credits,  int? priceAed,  String? tag)?  $default,) {final _that = this;
switch (_that) {
case _CreditPackDto() when $default != null:
return $default(_that.id,_that.credits,_that.priceAed,_that.tag);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditPackDto extends CreditPackDto {
  const _CreditPackDto({required this.id, required this.credits, this.priceAed, this.tag}): super._();
  factory _CreditPackDto.fromJson(Map<String, dynamic> json) => _$CreditPackDtoFromJson(json);

@override final  String id;
@override final  int credits;
@override final  int? priceAed;
@override final  String? tag;

/// Create a copy of CreditPackDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditPackDtoCopyWith<_CreditPackDto> get copyWith => __$CreditPackDtoCopyWithImpl<_CreditPackDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditPackDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditPackDto&&(identical(other.id, id) || other.id == id)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.priceAed, priceAed) || other.priceAed == priceAed)&&(identical(other.tag, tag) || other.tag == tag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,credits,priceAed,tag);

@override
String toString() {
  return 'CreditPackDto(id: $id, credits: $credits, priceAed: $priceAed, tag: $tag)';
}


}

/// @nodoc
abstract mixin class _$CreditPackDtoCopyWith<$Res> implements $CreditPackDtoCopyWith<$Res> {
  factory _$CreditPackDtoCopyWith(_CreditPackDto value, $Res Function(_CreditPackDto) _then) = __$CreditPackDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, int credits, int? priceAed, String? tag
});




}
/// @nodoc
class __$CreditPackDtoCopyWithImpl<$Res>
    implements _$CreditPackDtoCopyWith<$Res> {
  __$CreditPackDtoCopyWithImpl(this._self, this._then);

  final _CreditPackDto _self;
  final $Res Function(_CreditPackDto) _then;

/// Create a copy of CreditPackDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? credits = null,Object? priceAed = freezed,Object? tag = freezed,}) {
  return _then(_CreditPackDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,priceAed: freezed == priceAed ? _self.priceAed : priceAed // ignore: cast_nullable_to_non_nullable
as int?,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
