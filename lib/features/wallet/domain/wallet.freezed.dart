// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreditTxn {

 String get id; TxnKind get kind;/// Signed: negative = credits out, positive = credits in.
 int get amount; String get title;/// e.g. "on hold", "valid till 6 Nov 2027".
 String get note; DateTime get at;/// Credits expire 1 year after they're added.
 DateTime? get expiresAt; String? get dealId;
/// Create a copy of CreditTxn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditTxnCopyWith<CreditTxn> get copyWith => _$CreditTxnCopyWithImpl<CreditTxn>(this as CreditTxn, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditTxn&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.title, title) || other.title == title)&&(identical(other.note, note) || other.note == note)&&(identical(other.at, at) || other.at == at)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.dealId, dealId) || other.dealId == dealId));
}


@override
int get hashCode => Object.hash(runtimeType,id,kind,amount,title,note,at,expiresAt,dealId);

@override
String toString() {
  return 'CreditTxn(id: $id, kind: $kind, amount: $amount, title: $title, note: $note, at: $at, expiresAt: $expiresAt, dealId: $dealId)';
}


}

/// @nodoc
abstract mixin class $CreditTxnCopyWith<$Res>  {
  factory $CreditTxnCopyWith(CreditTxn value, $Res Function(CreditTxn) _then) = _$CreditTxnCopyWithImpl;
@useResult
$Res call({
 String id, TxnKind kind, int amount, String title, String note, DateTime at, DateTime? expiresAt, String? dealId
});




}
/// @nodoc
class _$CreditTxnCopyWithImpl<$Res>
    implements $CreditTxnCopyWith<$Res> {
  _$CreditTxnCopyWithImpl(this._self, this._then);

  final CreditTxn _self;
  final $Res Function(CreditTxn) _then;

/// Create a copy of CreditTxn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? amount = null,Object? title = null,Object? note = null,Object? at = null,Object? expiresAt = freezed,Object? dealId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TxnKind,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dealId: freezed == dealId ? _self.dealId : dealId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditTxn].
extension CreditTxnPatterns on CreditTxn {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditTxn value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditTxn() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditTxn value)  $default,){
final _that = this;
switch (_that) {
case _CreditTxn():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditTxn value)?  $default,){
final _that = this;
switch (_that) {
case _CreditTxn() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TxnKind kind,  int amount,  String title,  String note,  DateTime at,  DateTime? expiresAt,  String? dealId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditTxn() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TxnKind kind,  int amount,  String title,  String note,  DateTime at,  DateTime? expiresAt,  String? dealId)  $default,) {final _that = this;
switch (_that) {
case _CreditTxn():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TxnKind kind,  int amount,  String title,  String note,  DateTime at,  DateTime? expiresAt,  String? dealId)?  $default,) {final _that = this;
switch (_that) {
case _CreditTxn() when $default != null:
return $default(_that.id,_that.kind,_that.amount,_that.title,_that.note,_that.at,_that.expiresAt,_that.dealId);case _:
  return null;

}
}

}

/// @nodoc


class _CreditTxn implements CreditTxn {
  const _CreditTxn({required this.id, required this.kind, required this.amount, required this.title, required this.note, required this.at, this.expiresAt, this.dealId});
  

@override final  String id;
@override final  TxnKind kind;
/// Signed: negative = credits out, positive = credits in.
@override final  int amount;
@override final  String title;
/// e.g. "on hold", "valid till 6 Nov 2027".
@override final  String note;
@override final  DateTime at;
/// Credits expire 1 year after they're added.
@override final  DateTime? expiresAt;
@override final  String? dealId;

/// Create a copy of CreditTxn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditTxnCopyWith<_CreditTxn> get copyWith => __$CreditTxnCopyWithImpl<_CreditTxn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditTxn&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.title, title) || other.title == title)&&(identical(other.note, note) || other.note == note)&&(identical(other.at, at) || other.at == at)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.dealId, dealId) || other.dealId == dealId));
}


@override
int get hashCode => Object.hash(runtimeType,id,kind,amount,title,note,at,expiresAt,dealId);

@override
String toString() {
  return 'CreditTxn(id: $id, kind: $kind, amount: $amount, title: $title, note: $note, at: $at, expiresAt: $expiresAt, dealId: $dealId)';
}


}

/// @nodoc
abstract mixin class _$CreditTxnCopyWith<$Res> implements $CreditTxnCopyWith<$Res> {
  factory _$CreditTxnCopyWith(_CreditTxn value, $Res Function(_CreditTxn) _then) = __$CreditTxnCopyWithImpl;
@override @useResult
$Res call({
 String id, TxnKind kind, int amount, String title, String note, DateTime at, DateTime? expiresAt, String? dealId
});




}
/// @nodoc
class __$CreditTxnCopyWithImpl<$Res>
    implements _$CreditTxnCopyWith<$Res> {
  __$CreditTxnCopyWithImpl(this._self, this._then);

  final _CreditTxn _self;
  final $Res Function(_CreditTxn) _then;

/// Create a copy of CreditTxn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? amount = null,Object? title = null,Object? note = null,Object? at = null,Object? expiresAt = freezed,Object? dealId = freezed,}) {
  return _then(_CreditTxn(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as TxnKind,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
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
mixin _$Wallet {

 int get available; int get onHold;/// How many applications the [onHold] credits belong to.
 int get holds; int? get nextExpiryAmount; DateTime? get nextExpiryDate; String get referralCode;/// Newest first.
 List<CreditTxn> get history;
/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletCopyWith<Wallet> get copyWith => _$WalletCopyWithImpl<Wallet>(this as Wallet, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Wallet&&(identical(other.available, available) || other.available == available)&&(identical(other.onHold, onHold) || other.onHold == onHold)&&(identical(other.holds, holds) || other.holds == holds)&&(identical(other.nextExpiryAmount, nextExpiryAmount) || other.nextExpiryAmount == nextExpiryAmount)&&(identical(other.nextExpiryDate, nextExpiryDate) || other.nextExpiryDate == nextExpiryDate)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&const DeepCollectionEquality().equals(other.history, history));
}


@override
int get hashCode => Object.hash(runtimeType,available,onHold,holds,nextExpiryAmount,nextExpiryDate,referralCode,const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'Wallet(available: $available, onHold: $onHold, holds: $holds, nextExpiryAmount: $nextExpiryAmount, nextExpiryDate: $nextExpiryDate, referralCode: $referralCode, history: $history)';
}


}

/// @nodoc
abstract mixin class $WalletCopyWith<$Res>  {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) _then) = _$WalletCopyWithImpl;
@useResult
$Res call({
 int available, int onHold, int holds, int? nextExpiryAmount, DateTime? nextExpiryDate, String referralCode, List<CreditTxn> history
});




}
/// @nodoc
class _$WalletCopyWithImpl<$Res>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._self, this._then);

  final Wallet _self;
  final $Res Function(Wallet) _then;

/// Create a copy of Wallet
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
as List<CreditTxn>,
  ));
}

}


/// Adds pattern-matching-related methods to [Wallet].
extension WalletPatterns on Wallet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Wallet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Wallet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Wallet value)  $default,){
final _that = this;
switch (_that) {
case _Wallet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Wallet value)?  $default,){
final _that = this;
switch (_that) {
case _Wallet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int available,  int onHold,  int holds,  int? nextExpiryAmount,  DateTime? nextExpiryDate,  String referralCode,  List<CreditTxn> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Wallet() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int available,  int onHold,  int holds,  int? nextExpiryAmount,  DateTime? nextExpiryDate,  String referralCode,  List<CreditTxn> history)  $default,) {final _that = this;
switch (_that) {
case _Wallet():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int available,  int onHold,  int holds,  int? nextExpiryAmount,  DateTime? nextExpiryDate,  String referralCode,  List<CreditTxn> history)?  $default,) {final _that = this;
switch (_that) {
case _Wallet() when $default != null:
return $default(_that.available,_that.onHold,_that.holds,_that.nextExpiryAmount,_that.nextExpiryDate,_that.referralCode,_that.history);case _:
  return null;

}
}

}

/// @nodoc


class _Wallet implements Wallet {
  const _Wallet({required this.available, required this.onHold, this.holds = 0, this.nextExpiryAmount, this.nextExpiryDate, required this.referralCode, final  List<CreditTxn> history = const []}): _history = history;
  

@override final  int available;
@override final  int onHold;
/// How many applications the [onHold] credits belong to.
@override@JsonKey() final  int holds;
@override final  int? nextExpiryAmount;
@override final  DateTime? nextExpiryDate;
@override final  String referralCode;
/// Newest first.
 final  List<CreditTxn> _history;
/// Newest first.
@override@JsonKey() List<CreditTxn> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletCopyWith<_Wallet> get copyWith => __$WalletCopyWithImpl<_Wallet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Wallet&&(identical(other.available, available) || other.available == available)&&(identical(other.onHold, onHold) || other.onHold == onHold)&&(identical(other.holds, holds) || other.holds == holds)&&(identical(other.nextExpiryAmount, nextExpiryAmount) || other.nextExpiryAmount == nextExpiryAmount)&&(identical(other.nextExpiryDate, nextExpiryDate) || other.nextExpiryDate == nextExpiryDate)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&const DeepCollectionEquality().equals(other._history, _history));
}


@override
int get hashCode => Object.hash(runtimeType,available,onHold,holds,nextExpiryAmount,nextExpiryDate,referralCode,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'Wallet(available: $available, onHold: $onHold, holds: $holds, nextExpiryAmount: $nextExpiryAmount, nextExpiryDate: $nextExpiryDate, referralCode: $referralCode, history: $history)';
}


}

/// @nodoc
abstract mixin class _$WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$WalletCopyWith(_Wallet value, $Res Function(_Wallet) _then) = __$WalletCopyWithImpl;
@override @useResult
$Res call({
 int available, int onHold, int holds, int? nextExpiryAmount, DateTime? nextExpiryDate, String referralCode, List<CreditTxn> history
});




}
/// @nodoc
class __$WalletCopyWithImpl<$Res>
    implements _$WalletCopyWith<$Res> {
  __$WalletCopyWithImpl(this._self, this._then);

  final _Wallet _self;
  final $Res Function(_Wallet) _then;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? available = null,Object? onHold = null,Object? holds = null,Object? nextExpiryAmount = freezed,Object? nextExpiryDate = freezed,Object? referralCode = null,Object? history = null,}) {
  return _then(_Wallet(
available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,onHold: null == onHold ? _self.onHold : onHold // ignore: cast_nullable_to_non_nullable
as int,holds: null == holds ? _self.holds : holds // ignore: cast_nullable_to_non_nullable
as int,nextExpiryAmount: freezed == nextExpiryAmount ? _self.nextExpiryAmount : nextExpiryAmount // ignore: cast_nullable_to_non_nullable
as int?,nextExpiryDate: freezed == nextExpiryDate ? _self.nextExpiryDate : nextExpiryDate // ignore: cast_nullable_to_non_nullable
as DateTime?,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<CreditTxn>,
  ));
}


}

/// @nodoc
mixin _$CreditPack {

 String get id; int get credits;/// Null until pricing is decided (shown as "AED [XX]").
 int? get priceAed;/// "POPULAR", "BEST VALUE".
 String? get tag;
/// Create a copy of CreditPack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditPackCopyWith<CreditPack> get copyWith => _$CreditPackCopyWithImpl<CreditPack>(this as CreditPack, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditPack&&(identical(other.id, id) || other.id == id)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.priceAed, priceAed) || other.priceAed == priceAed)&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,id,credits,priceAed,tag);

@override
String toString() {
  return 'CreditPack(id: $id, credits: $credits, priceAed: $priceAed, tag: $tag)';
}


}

/// @nodoc
abstract mixin class $CreditPackCopyWith<$Res>  {
  factory $CreditPackCopyWith(CreditPack value, $Res Function(CreditPack) _then) = _$CreditPackCopyWithImpl;
@useResult
$Res call({
 String id, int credits, int? priceAed, String? tag
});




}
/// @nodoc
class _$CreditPackCopyWithImpl<$Res>
    implements $CreditPackCopyWith<$Res> {
  _$CreditPackCopyWithImpl(this._self, this._then);

  final CreditPack _self;
  final $Res Function(CreditPack) _then;

/// Create a copy of CreditPack
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


/// Adds pattern-matching-related methods to [CreditPack].
extension CreditPackPatterns on CreditPack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditPack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditPack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditPack value)  $default,){
final _that = this;
switch (_that) {
case _CreditPack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditPack value)?  $default,){
final _that = this;
switch (_that) {
case _CreditPack() when $default != null:
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
case _CreditPack() when $default != null:
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
case _CreditPack():
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
case _CreditPack() when $default != null:
return $default(_that.id,_that.credits,_that.priceAed,_that.tag);case _:
  return null;

}
}

}

/// @nodoc


class _CreditPack implements CreditPack {
  const _CreditPack({required this.id, required this.credits, this.priceAed, this.tag});
  

@override final  String id;
@override final  int credits;
/// Null until pricing is decided (shown as "AED [XX]").
@override final  int? priceAed;
/// "POPULAR", "BEST VALUE".
@override final  String? tag;

/// Create a copy of CreditPack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditPackCopyWith<_CreditPack> get copyWith => __$CreditPackCopyWithImpl<_CreditPack>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditPack&&(identical(other.id, id) || other.id == id)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.priceAed, priceAed) || other.priceAed == priceAed)&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,id,credits,priceAed,tag);

@override
String toString() {
  return 'CreditPack(id: $id, credits: $credits, priceAed: $priceAed, tag: $tag)';
}


}

/// @nodoc
abstract mixin class _$CreditPackCopyWith<$Res> implements $CreditPackCopyWith<$Res> {
  factory _$CreditPackCopyWith(_CreditPack value, $Res Function(_CreditPack) _then) = __$CreditPackCopyWithImpl;
@override @useResult
$Res call({
 String id, int credits, int? priceAed, String? tag
});




}
/// @nodoc
class __$CreditPackCopyWithImpl<$Res>
    implements _$CreditPackCopyWith<$Res> {
  __$CreditPackCopyWithImpl(this._self, this._then);

  final _CreditPack _self;
  final $Res Function(_CreditPack) _then;

/// Create a copy of CreditPack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? credits = null,Object? priceAed = freezed,Object? tag = freezed,}) {
  return _then(_CreditPack(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,priceAed: freezed == priceAed ? _self.priceAed : priceAed // ignore: cast_nullable_to_non_nullable
as int?,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
