// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Delivery {

 DeliveryStatus get status; String get courier; CourierKind get courierKind; String? get trackingNo; String? get trackingUrl; DateTime? get eta; DateTime get deliverBy;/// Set when [status] is [DeliveryStatus.issue].
 String? get issue;/// How many times it has been shipped.
 int get attempts;
/// Create a copy of Delivery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryCopyWith<Delivery> get copyWith => _$DeliveryCopyWithImpl<Delivery>(this as Delivery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Delivery&&(identical(other.status, status) || other.status == status)&&(identical(other.courier, courier) || other.courier == courier)&&(identical(other.courierKind, courierKind) || other.courierKind == courierKind)&&(identical(other.trackingNo, trackingNo) || other.trackingNo == trackingNo)&&(identical(other.trackingUrl, trackingUrl) || other.trackingUrl == trackingUrl)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.deliverBy, deliverBy) || other.deliverBy == deliverBy)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}


@override
int get hashCode => Object.hash(runtimeType,status,courier,courierKind,trackingNo,trackingUrl,eta,deliverBy,issue,attempts);

@override
String toString() {
  return 'Delivery(status: $status, courier: $courier, courierKind: $courierKind, trackingNo: $trackingNo, trackingUrl: $trackingUrl, eta: $eta, deliverBy: $deliverBy, issue: $issue, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $DeliveryCopyWith<$Res>  {
  factory $DeliveryCopyWith(Delivery value, $Res Function(Delivery) _then) = _$DeliveryCopyWithImpl;
@useResult
$Res call({
 DeliveryStatus status, String courier, CourierKind courierKind, String? trackingNo, String? trackingUrl, DateTime? eta, DateTime deliverBy, String? issue, int attempts
});




}
/// @nodoc
class _$DeliveryCopyWithImpl<$Res>
    implements $DeliveryCopyWith<$Res> {
  _$DeliveryCopyWithImpl(this._self, this._then);

  final Delivery _self;
  final $Res Function(Delivery) _then;

/// Create a copy of Delivery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? courier = null,Object? courierKind = null,Object? trackingNo = freezed,Object? trackingUrl = freezed,Object? eta = freezed,Object? deliverBy = null,Object? issue = freezed,Object? attempts = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DeliveryStatus,courier: null == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
as String,courierKind: null == courierKind ? _self.courierKind : courierKind // ignore: cast_nullable_to_non_nullable
as CourierKind,trackingNo: freezed == trackingNo ? _self.trackingNo : trackingNo // ignore: cast_nullable_to_non_nullable
as String?,trackingUrl: freezed == trackingUrl ? _self.trackingUrl : trackingUrl // ignore: cast_nullable_to_non_nullable
as String?,eta: freezed == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as DateTime?,deliverBy: null == deliverBy ? _self.deliverBy : deliverBy // ignore: cast_nullable_to_non_nullable
as DateTime,issue: freezed == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Delivery].
extension DeliveryPatterns on Delivery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Delivery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Delivery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Delivery value)  $default,){
final _that = this;
switch (_that) {
case _Delivery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Delivery value)?  $default,){
final _that = this;
switch (_that) {
case _Delivery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DeliveryStatus status,  String courier,  CourierKind courierKind,  String? trackingNo,  String? trackingUrl,  DateTime? eta,  DateTime deliverBy,  String? issue,  int attempts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Delivery() when $default != null:
return $default(_that.status,_that.courier,_that.courierKind,_that.trackingNo,_that.trackingUrl,_that.eta,_that.deliverBy,_that.issue,_that.attempts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DeliveryStatus status,  String courier,  CourierKind courierKind,  String? trackingNo,  String? trackingUrl,  DateTime? eta,  DateTime deliverBy,  String? issue,  int attempts)  $default,) {final _that = this;
switch (_that) {
case _Delivery():
return $default(_that.status,_that.courier,_that.courierKind,_that.trackingNo,_that.trackingUrl,_that.eta,_that.deliverBy,_that.issue,_that.attempts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DeliveryStatus status,  String courier,  CourierKind courierKind,  String? trackingNo,  String? trackingUrl,  DateTime? eta,  DateTime deliverBy,  String? issue,  int attempts)?  $default,) {final _that = this;
switch (_that) {
case _Delivery() when $default != null:
return $default(_that.status,_that.courier,_that.courierKind,_that.trackingNo,_that.trackingUrl,_that.eta,_that.deliverBy,_that.issue,_that.attempts);case _:
  return null;

}
}

}

/// @nodoc


class _Delivery implements Delivery {
  const _Delivery({this.status = DeliveryStatus.hold, required this.courier, this.courierKind = CourierKind.thirdParty, this.trackingNo, this.trackingUrl, this.eta, required this.deliverBy, this.issue, this.attempts = 0});
  

@override@JsonKey() final  DeliveryStatus status;
@override final  String courier;
@override@JsonKey() final  CourierKind courierKind;
@override final  String? trackingNo;
@override final  String? trackingUrl;
@override final  DateTime? eta;
@override final  DateTime deliverBy;
/// Set when [status] is [DeliveryStatus.issue].
@override final  String? issue;
/// How many times it has been shipped.
@override@JsonKey() final  int attempts;

/// Create a copy of Delivery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryCopyWith<_Delivery> get copyWith => __$DeliveryCopyWithImpl<_Delivery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Delivery&&(identical(other.status, status) || other.status == status)&&(identical(other.courier, courier) || other.courier == courier)&&(identical(other.courierKind, courierKind) || other.courierKind == courierKind)&&(identical(other.trackingNo, trackingNo) || other.trackingNo == trackingNo)&&(identical(other.trackingUrl, trackingUrl) || other.trackingUrl == trackingUrl)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.deliverBy, deliverBy) || other.deliverBy == deliverBy)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}


@override
int get hashCode => Object.hash(runtimeType,status,courier,courierKind,trackingNo,trackingUrl,eta,deliverBy,issue,attempts);

@override
String toString() {
  return 'Delivery(status: $status, courier: $courier, courierKind: $courierKind, trackingNo: $trackingNo, trackingUrl: $trackingUrl, eta: $eta, deliverBy: $deliverBy, issue: $issue, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class _$DeliveryCopyWith<$Res> implements $DeliveryCopyWith<$Res> {
  factory _$DeliveryCopyWith(_Delivery value, $Res Function(_Delivery) _then) = __$DeliveryCopyWithImpl;
@override @useResult
$Res call({
 DeliveryStatus status, String courier, CourierKind courierKind, String? trackingNo, String? trackingUrl, DateTime? eta, DateTime deliverBy, String? issue, int attempts
});




}
/// @nodoc
class __$DeliveryCopyWithImpl<$Res>
    implements _$DeliveryCopyWith<$Res> {
  __$DeliveryCopyWithImpl(this._self, this._then);

  final _Delivery _self;
  final $Res Function(_Delivery) _then;

/// Create a copy of Delivery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? courier = null,Object? courierKind = null,Object? trackingNo = freezed,Object? trackingUrl = freezed,Object? eta = freezed,Object? deliverBy = null,Object? issue = freezed,Object? attempts = null,}) {
  return _then(_Delivery(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DeliveryStatus,courier: null == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
as String,courierKind: null == courierKind ? _self.courierKind : courierKind // ignore: cast_nullable_to_non_nullable
as CourierKind,trackingNo: freezed == trackingNo ? _self.trackingNo : trackingNo // ignore: cast_nullable_to_non_nullable
as String?,trackingUrl: freezed == trackingUrl ? _self.trackingUrl : trackingUrl // ignore: cast_nullable_to_non_nullable
as String?,eta: freezed == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as DateTime?,deliverBy: null == deliverBy ? _self.deliverBy : deliverBy // ignore: cast_nullable_to_non_nullable
as DateTime,issue: freezed == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$IssuedCode {

 CodeKind get kind; String get code; String get howToUse; DateTime? get validUntil;/// Set when the brand scans it at the venue.
 DateTime? get redeemedAt;
/// Create a copy of IssuedCode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssuedCodeCopyWith<IssuedCode> get copyWith => _$IssuedCodeCopyWithImpl<IssuedCode>(this as IssuedCode, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssuedCode&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.code, code) || other.code == code)&&(identical(other.howToUse, howToUse) || other.howToUse == howToUse)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.redeemedAt, redeemedAt) || other.redeemedAt == redeemedAt));
}


@override
int get hashCode => Object.hash(runtimeType,kind,code,howToUse,validUntil,redeemedAt);

@override
String toString() {
  return 'IssuedCode(kind: $kind, code: $code, howToUse: $howToUse, validUntil: $validUntil, redeemedAt: $redeemedAt)';
}


}

/// @nodoc
abstract mixin class $IssuedCodeCopyWith<$Res>  {
  factory $IssuedCodeCopyWith(IssuedCode value, $Res Function(IssuedCode) _then) = _$IssuedCodeCopyWithImpl;
@useResult
$Res call({
 CodeKind kind, String code, String howToUse, DateTime? validUntil, DateTime? redeemedAt
});




}
/// @nodoc
class _$IssuedCodeCopyWithImpl<$Res>
    implements $IssuedCodeCopyWith<$Res> {
  _$IssuedCodeCopyWithImpl(this._self, this._then);

  final IssuedCode _self;
  final $Res Function(IssuedCode) _then;

/// Create a copy of IssuedCode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? code = null,Object? howToUse = null,Object? validUntil = freezed,Object? redeemedAt = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CodeKind,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,howToUse: null == howToUse ? _self.howToUse : howToUse // ignore: cast_nullable_to_non_nullable
as String,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,redeemedAt: freezed == redeemedAt ? _self.redeemedAt : redeemedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [IssuedCode].
extension IssuedCodePatterns on IssuedCode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssuedCode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssuedCode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssuedCode value)  $default,){
final _that = this;
switch (_that) {
case _IssuedCode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssuedCode value)?  $default,){
final _that = this;
switch (_that) {
case _IssuedCode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CodeKind kind,  String code,  String howToUse,  DateTime? validUntil,  DateTime? redeemedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssuedCode() when $default != null:
return $default(_that.kind,_that.code,_that.howToUse,_that.validUntil,_that.redeemedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CodeKind kind,  String code,  String howToUse,  DateTime? validUntil,  DateTime? redeemedAt)  $default,) {final _that = this;
switch (_that) {
case _IssuedCode():
return $default(_that.kind,_that.code,_that.howToUse,_that.validUntil,_that.redeemedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CodeKind kind,  String code,  String howToUse,  DateTime? validUntil,  DateTime? redeemedAt)?  $default,) {final _that = this;
switch (_that) {
case _IssuedCode() when $default != null:
return $default(_that.kind,_that.code,_that.howToUse,_that.validUntil,_that.redeemedAt);case _:
  return null;

}
}

}

/// @nodoc


class _IssuedCode implements IssuedCode {
  const _IssuedCode({required this.kind, required this.code, required this.howToUse, this.validUntil, this.redeemedAt});
  

@override final  CodeKind kind;
@override final  String code;
@override final  String howToUse;
@override final  DateTime? validUntil;
/// Set when the brand scans it at the venue.
@override final  DateTime? redeemedAt;

/// Create a copy of IssuedCode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssuedCodeCopyWith<_IssuedCode> get copyWith => __$IssuedCodeCopyWithImpl<_IssuedCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssuedCode&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.code, code) || other.code == code)&&(identical(other.howToUse, howToUse) || other.howToUse == howToUse)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.redeemedAt, redeemedAt) || other.redeemedAt == redeemedAt));
}


@override
int get hashCode => Object.hash(runtimeType,kind,code,howToUse,validUntil,redeemedAt);

@override
String toString() {
  return 'IssuedCode(kind: $kind, code: $code, howToUse: $howToUse, validUntil: $validUntil, redeemedAt: $redeemedAt)';
}


}

/// @nodoc
abstract mixin class _$IssuedCodeCopyWith<$Res> implements $IssuedCodeCopyWith<$Res> {
  factory _$IssuedCodeCopyWith(_IssuedCode value, $Res Function(_IssuedCode) _then) = __$IssuedCodeCopyWithImpl;
@override @useResult
$Res call({
 CodeKind kind, String code, String howToUse, DateTime? validUntil, DateTime? redeemedAt
});




}
/// @nodoc
class __$IssuedCodeCopyWithImpl<$Res>
    implements _$IssuedCodeCopyWith<$Res> {
  __$IssuedCodeCopyWithImpl(this._self, this._then);

  final _IssuedCode _self;
  final $Res Function(_IssuedCode) _then;

/// Create a copy of IssuedCode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? code = null,Object? howToUse = null,Object? validUntil = freezed,Object? redeemedAt = freezed,}) {
  return _then(_IssuedCode(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as CodeKind,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,howToUse: null == howToUse ? _self.howToUse : howToUse // ignore: cast_nullable_to_non_nullable
as String,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,redeemedAt: freezed == redeemedAt ? _self.redeemedAt : redeemedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$ChatMessage {

 String get id; Actor get from; String get text; DateTime get sentAt;/// e.g. "Changes requested", "♥ Thank-you".
 String? get tag;/// Point in the video the brand is commenting on, e.g. "0:12".
 String? get videoTimestamp;/// Attached file name / URL.
 String? get attachment;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.from, from) || other.from == from)&&(identical(other.text, text) || other.text == text)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.videoTimestamp, videoTimestamp) || other.videoTimestamp == videoTimestamp)&&(identical(other.attachment, attachment) || other.attachment == attachment));
}


@override
int get hashCode => Object.hash(runtimeType,id,from,text,sentAt,tag,videoTimestamp,attachment);

@override
String toString() {
  return 'ChatMessage(id: $id, from: $from, text: $text, sentAt: $sentAt, tag: $tag, videoTimestamp: $videoTimestamp, attachment: $attachment)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String id, Actor from, String text, DateTime sentAt, String? tag, String? videoTimestamp, String? attachment
});




}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? from = null,Object? text = null,Object? sentAt = null,Object? tag = freezed,Object? videoTimestamp = freezed,Object? attachment = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as Actor,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,videoTimestamp: freezed == videoTimestamp ? _self.videoTimestamp : videoTimestamp // ignore: cast_nullable_to_non_nullable
as String?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Actor from,  String text,  DateTime sentAt,  String? tag,  String? videoTimestamp,  String? attachment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.from,_that.text,_that.sentAt,_that.tag,_that.videoTimestamp,_that.attachment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Actor from,  String text,  DateTime sentAt,  String? tag,  String? videoTimestamp,  String? attachment)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.id,_that.from,_that.text,_that.sentAt,_that.tag,_that.videoTimestamp,_that.attachment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Actor from,  String text,  DateTime sentAt,  String? tag,  String? videoTimestamp,  String? attachment)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.from,_that.text,_that.sentAt,_that.tag,_that.videoTimestamp,_that.attachment);case _:
  return null;

}
}

}

/// @nodoc


class _ChatMessage implements ChatMessage {
  const _ChatMessage({required this.id, required this.from, required this.text, required this.sentAt, this.tag, this.videoTimestamp, this.attachment});
  

@override final  String id;
@override final  Actor from;
@override final  String text;
@override final  DateTime sentAt;
/// e.g. "Changes requested", "♥ Thank-you".
@override final  String? tag;
/// Point in the video the brand is commenting on, e.g. "0:12".
@override final  String? videoTimestamp;
/// Attached file name / URL.
@override final  String? attachment;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.from, from) || other.from == from)&&(identical(other.text, text) || other.text == text)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.videoTimestamp, videoTimestamp) || other.videoTimestamp == videoTimestamp)&&(identical(other.attachment, attachment) || other.attachment == attachment));
}


@override
int get hashCode => Object.hash(runtimeType,id,from,text,sentAt,tag,videoTimestamp,attachment);

@override
String toString() {
  return 'ChatMessage(id: $id, from: $from, text: $text, sentAt: $sentAt, tag: $tag, videoTimestamp: $videoTimestamp, attachment: $attachment)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, Actor from, String text, DateTime sentAt, String? tag, String? videoTimestamp, String? attachment
});




}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? from = null,Object? text = null,Object? sentAt = null,Object? tag = freezed,Object? videoTimestamp = freezed,Object? attachment = freezed,}) {
  return _then(_ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as Actor,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,videoTimestamp: freezed == videoTimestamp ? _self.videoTimestamp : videoTimestamp // ignore: cast_nullable_to_non_nullable
as String?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$DealEvent {

 Actor? get actor; String get text; DateTime get at;
/// Create a copy of DealEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DealEventCopyWith<DealEvent> get copyWith => _$DealEventCopyWithImpl<DealEvent>(this as DealEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealEvent&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.text, text) || other.text == text)&&(identical(other.at, at) || other.at == at));
}


@override
int get hashCode => Object.hash(runtimeType,actor,text,at);

@override
String toString() {
  return 'DealEvent(actor: $actor, text: $text, at: $at)';
}


}

/// @nodoc
abstract mixin class $DealEventCopyWith<$Res>  {
  factory $DealEventCopyWith(DealEvent value, $Res Function(DealEvent) _then) = _$DealEventCopyWithImpl;
@useResult
$Res call({
 Actor? actor, String text, DateTime at
});




}
/// @nodoc
class _$DealEventCopyWithImpl<$Res>
    implements $DealEventCopyWith<$Res> {
  _$DealEventCopyWithImpl(this._self, this._then);

  final DealEvent _self;
  final $Res Function(DealEvent) _then;

/// Create a copy of DealEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? actor = freezed,Object? text = null,Object? at = null,}) {
  return _then(_self.copyWith(
actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as Actor?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DealEvent].
extension DealEventPatterns on DealEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DealEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DealEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DealEvent value)  $default,){
final _that = this;
switch (_that) {
case _DealEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DealEvent value)?  $default,){
final _that = this;
switch (_that) {
case _DealEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Actor? actor,  String text,  DateTime at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DealEvent() when $default != null:
return $default(_that.actor,_that.text,_that.at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Actor? actor,  String text,  DateTime at)  $default,) {final _that = this;
switch (_that) {
case _DealEvent():
return $default(_that.actor,_that.text,_that.at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Actor? actor,  String text,  DateTime at)?  $default,) {final _that = this;
switch (_that) {
case _DealEvent() when $default != null:
return $default(_that.actor,_that.text,_that.at);case _:
  return null;

}
}

}

/// @nodoc


class _DealEvent implements DealEvent {
  const _DealEvent({this.actor, required this.text, required this.at});
  

@override final  Actor? actor;
@override final  String text;
@override final  DateTime at;

/// Create a copy of DealEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DealEventCopyWith<_DealEvent> get copyWith => __$DealEventCopyWithImpl<_DealEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DealEvent&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.text, text) || other.text == text)&&(identical(other.at, at) || other.at == at));
}


@override
int get hashCode => Object.hash(runtimeType,actor,text,at);

@override
String toString() {
  return 'DealEvent(actor: $actor, text: $text, at: $at)';
}


}

/// @nodoc
abstract mixin class _$DealEventCopyWith<$Res> implements $DealEventCopyWith<$Res> {
  factory _$DealEventCopyWith(_DealEvent value, $Res Function(_DealEvent) _then) = __$DealEventCopyWithImpl;
@override @useResult
$Res call({
 Actor? actor, String text, DateTime at
});




}
/// @nodoc
class __$DealEventCopyWithImpl<$Res>
    implements _$DealEventCopyWith<$Res> {
  __$DealEventCopyWithImpl(this._self, this._then);

  final _DealEvent _self;
  final $Res Function(_DealEvent) _then;

/// Create a copy of DealEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? actor = freezed,Object? text = null,Object? at = null,}) {
  return _then(_DealEvent(
actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as Actor?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$Deal {

 String get id; String get campaignId;// Copied from the campaign so lists don't need to load it.
 CampaignType get type; String get title; String get brandName; DealStage get stage;/// Credits spent / held for this collab.
 int get credits; String? get addressId; int get scriptVersion; int get contentRound; int get scriptRejections; int get contentRejections; String? get scriptText; List<String> get contentFiles; String? get postLink; Delivery? get delivery; IssuedCode? get code; DateTime? get shootDate;/// Drop only: whether the creator chose to make content.
 bool? get madeContent; String? get endReason;/// The brand added a strike when ending the collab.
 bool get strike; List<ChatMessage> get chat;/// Newest first.
 List<DealEvent> get log; DateTime get appliedAt; DateTime get updatedAt;
/// Create a copy of Deal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DealCopyWith<Deal> get copyWith => _$DealCopyWithImpl<Deal>(this as Deal, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Deal&&(identical(other.id, id) || other.id == id)&&(identical(other.campaignId, campaignId) || other.campaignId == campaignId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.scriptVersion, scriptVersion) || other.scriptVersion == scriptVersion)&&(identical(other.contentRound, contentRound) || other.contentRound == contentRound)&&(identical(other.scriptRejections, scriptRejections) || other.scriptRejections == scriptRejections)&&(identical(other.contentRejections, contentRejections) || other.contentRejections == contentRejections)&&(identical(other.scriptText, scriptText) || other.scriptText == scriptText)&&const DeepCollectionEquality().equals(other.contentFiles, contentFiles)&&(identical(other.postLink, postLink) || other.postLink == postLink)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.code, code) || other.code == code)&&(identical(other.shootDate, shootDate) || other.shootDate == shootDate)&&(identical(other.madeContent, madeContent) || other.madeContent == madeContent)&&(identical(other.endReason, endReason) || other.endReason == endReason)&&(identical(other.strike, strike) || other.strike == strike)&&const DeepCollectionEquality().equals(other.chat, chat)&&const DeepCollectionEquality().equals(other.log, log)&&(identical(other.appliedAt, appliedAt) || other.appliedAt == appliedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,campaignId,type,title,brandName,stage,credits,addressId,scriptVersion,contentRound,scriptRejections,contentRejections,scriptText,const DeepCollectionEquality().hash(contentFiles),postLink,delivery,code,shootDate,madeContent,endReason,strike,const DeepCollectionEquality().hash(chat),const DeepCollectionEquality().hash(log),appliedAt,updatedAt]);

@override
String toString() {
  return 'Deal(id: $id, campaignId: $campaignId, type: $type, title: $title, brandName: $brandName, stage: $stage, credits: $credits, addressId: $addressId, scriptVersion: $scriptVersion, contentRound: $contentRound, scriptRejections: $scriptRejections, contentRejections: $contentRejections, scriptText: $scriptText, contentFiles: $contentFiles, postLink: $postLink, delivery: $delivery, code: $code, shootDate: $shootDate, madeContent: $madeContent, endReason: $endReason, strike: $strike, chat: $chat, log: $log, appliedAt: $appliedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DealCopyWith<$Res>  {
  factory $DealCopyWith(Deal value, $Res Function(Deal) _then) = _$DealCopyWithImpl;
@useResult
$Res call({
 String id, String campaignId, CampaignType type, String title, String brandName, DealStage stage, int credits, String? addressId, int scriptVersion, int contentRound, int scriptRejections, int contentRejections, String? scriptText, List<String> contentFiles, String? postLink, Delivery? delivery, IssuedCode? code, DateTime? shootDate, bool? madeContent, String? endReason, bool strike, List<ChatMessage> chat, List<DealEvent> log, DateTime appliedAt, DateTime updatedAt
});


$DeliveryCopyWith<$Res>? get delivery;$IssuedCodeCopyWith<$Res>? get code;

}
/// @nodoc
class _$DealCopyWithImpl<$Res>
    implements $DealCopyWith<$Res> {
  _$DealCopyWithImpl(this._self, this._then);

  final Deal _self;
  final $Res Function(Deal) _then;

/// Create a copy of Deal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? campaignId = null,Object? type = null,Object? title = null,Object? brandName = null,Object? stage = null,Object? credits = null,Object? addressId = freezed,Object? scriptVersion = null,Object? contentRound = null,Object? scriptRejections = null,Object? contentRejections = null,Object? scriptText = freezed,Object? contentFiles = null,Object? postLink = freezed,Object? delivery = freezed,Object? code = freezed,Object? shootDate = freezed,Object? madeContent = freezed,Object? endReason = freezed,Object? strike = null,Object? chat = null,Object? log = null,Object? appliedAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,campaignId: null == campaignId ? _self.campaignId : campaignId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CampaignType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as DealStage,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,scriptVersion: null == scriptVersion ? _self.scriptVersion : scriptVersion // ignore: cast_nullable_to_non_nullable
as int,contentRound: null == contentRound ? _self.contentRound : contentRound // ignore: cast_nullable_to_non_nullable
as int,scriptRejections: null == scriptRejections ? _self.scriptRejections : scriptRejections // ignore: cast_nullable_to_non_nullable
as int,contentRejections: null == contentRejections ? _self.contentRejections : contentRejections // ignore: cast_nullable_to_non_nullable
as int,scriptText: freezed == scriptText ? _self.scriptText : scriptText // ignore: cast_nullable_to_non_nullable
as String?,contentFiles: null == contentFiles ? _self.contentFiles : contentFiles // ignore: cast_nullable_to_non_nullable
as List<String>,postLink: freezed == postLink ? _self.postLink : postLink // ignore: cast_nullable_to_non_nullable
as String?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as Delivery?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as IssuedCode?,shootDate: freezed == shootDate ? _self.shootDate : shootDate // ignore: cast_nullable_to_non_nullable
as DateTime?,madeContent: freezed == madeContent ? _self.madeContent : madeContent // ignore: cast_nullable_to_non_nullable
as bool?,endReason: freezed == endReason ? _self.endReason : endReason // ignore: cast_nullable_to_non_nullable
as String?,strike: null == strike ? _self.strike : strike // ignore: cast_nullable_to_non_nullable
as bool,chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,log: null == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as List<DealEvent>,appliedAt: null == appliedAt ? _self.appliedAt : appliedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Deal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryCopyWith<$Res>? get delivery {
    if (_self.delivery == null) {
    return null;
  }

  return $DeliveryCopyWith<$Res>(_self.delivery!, (value) {
    return _then(_self.copyWith(delivery: value));
  });
}/// Create a copy of Deal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssuedCodeCopyWith<$Res>? get code {
    if (_self.code == null) {
    return null;
  }

  return $IssuedCodeCopyWith<$Res>(_self.code!, (value) {
    return _then(_self.copyWith(code: value));
  });
}
}


/// Adds pattern-matching-related methods to [Deal].
extension DealPatterns on Deal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Deal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Deal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Deal value)  $default,){
final _that = this;
switch (_that) {
case _Deal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Deal value)?  $default,){
final _that = this;
switch (_that) {
case _Deal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String campaignId,  CampaignType type,  String title,  String brandName,  DealStage stage,  int credits,  String? addressId,  int scriptVersion,  int contentRound,  int scriptRejections,  int contentRejections,  String? scriptText,  List<String> contentFiles,  String? postLink,  Delivery? delivery,  IssuedCode? code,  DateTime? shootDate,  bool? madeContent,  String? endReason,  bool strike,  List<ChatMessage> chat,  List<DealEvent> log,  DateTime appliedAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Deal() when $default != null:
return $default(_that.id,_that.campaignId,_that.type,_that.title,_that.brandName,_that.stage,_that.credits,_that.addressId,_that.scriptVersion,_that.contentRound,_that.scriptRejections,_that.contentRejections,_that.scriptText,_that.contentFiles,_that.postLink,_that.delivery,_that.code,_that.shootDate,_that.madeContent,_that.endReason,_that.strike,_that.chat,_that.log,_that.appliedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String campaignId,  CampaignType type,  String title,  String brandName,  DealStage stage,  int credits,  String? addressId,  int scriptVersion,  int contentRound,  int scriptRejections,  int contentRejections,  String? scriptText,  List<String> contentFiles,  String? postLink,  Delivery? delivery,  IssuedCode? code,  DateTime? shootDate,  bool? madeContent,  String? endReason,  bool strike,  List<ChatMessage> chat,  List<DealEvent> log,  DateTime appliedAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Deal():
return $default(_that.id,_that.campaignId,_that.type,_that.title,_that.brandName,_that.stage,_that.credits,_that.addressId,_that.scriptVersion,_that.contentRound,_that.scriptRejections,_that.contentRejections,_that.scriptText,_that.contentFiles,_that.postLink,_that.delivery,_that.code,_that.shootDate,_that.madeContent,_that.endReason,_that.strike,_that.chat,_that.log,_that.appliedAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String campaignId,  CampaignType type,  String title,  String brandName,  DealStage stage,  int credits,  String? addressId,  int scriptVersion,  int contentRound,  int scriptRejections,  int contentRejections,  String? scriptText,  List<String> contentFiles,  String? postLink,  Delivery? delivery,  IssuedCode? code,  DateTime? shootDate,  bool? madeContent,  String? endReason,  bool strike,  List<ChatMessage> chat,  List<DealEvent> log,  DateTime appliedAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Deal() when $default != null:
return $default(_that.id,_that.campaignId,_that.type,_that.title,_that.brandName,_that.stage,_that.credits,_that.addressId,_that.scriptVersion,_that.contentRound,_that.scriptRejections,_that.contentRejections,_that.scriptText,_that.contentFiles,_that.postLink,_that.delivery,_that.code,_that.shootDate,_that.madeContent,_that.endReason,_that.strike,_that.chat,_that.log,_that.appliedAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Deal extends Deal {
  const _Deal({required this.id, required this.campaignId, required this.type, required this.title, required this.brandName, required this.stage, required this.credits, this.addressId, this.scriptVersion = 1, this.contentRound = 1, this.scriptRejections = 0, this.contentRejections = 0, this.scriptText, final  List<String> contentFiles = const [], this.postLink, this.delivery, this.code, this.shootDate, this.madeContent, this.endReason, this.strike = false, final  List<ChatMessage> chat = const [], final  List<DealEvent> log = const [], required this.appliedAt, required this.updatedAt}): _contentFiles = contentFiles,_chat = chat,_log = log,super._();
  

@override final  String id;
@override final  String campaignId;
// Copied from the campaign so lists don't need to load it.
@override final  CampaignType type;
@override final  String title;
@override final  String brandName;
@override final  DealStage stage;
/// Credits spent / held for this collab.
@override final  int credits;
@override final  String? addressId;
@override@JsonKey() final  int scriptVersion;
@override@JsonKey() final  int contentRound;
@override@JsonKey() final  int scriptRejections;
@override@JsonKey() final  int contentRejections;
@override final  String? scriptText;
 final  List<String> _contentFiles;
@override@JsonKey() List<String> get contentFiles {
  if (_contentFiles is EqualUnmodifiableListView) return _contentFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contentFiles);
}

@override final  String? postLink;
@override final  Delivery? delivery;
@override final  IssuedCode? code;
@override final  DateTime? shootDate;
/// Drop only: whether the creator chose to make content.
@override final  bool? madeContent;
@override final  String? endReason;
/// The brand added a strike when ending the collab.
@override@JsonKey() final  bool strike;
 final  List<ChatMessage> _chat;
@override@JsonKey() List<ChatMessage> get chat {
  if (_chat is EqualUnmodifiableListView) return _chat;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chat);
}

/// Newest first.
 final  List<DealEvent> _log;
/// Newest first.
@override@JsonKey() List<DealEvent> get log {
  if (_log is EqualUnmodifiableListView) return _log;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_log);
}

@override final  DateTime appliedAt;
@override final  DateTime updatedAt;

/// Create a copy of Deal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DealCopyWith<_Deal> get copyWith => __$DealCopyWithImpl<_Deal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deal&&(identical(other.id, id) || other.id == id)&&(identical(other.campaignId, campaignId) || other.campaignId == campaignId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.scriptVersion, scriptVersion) || other.scriptVersion == scriptVersion)&&(identical(other.contentRound, contentRound) || other.contentRound == contentRound)&&(identical(other.scriptRejections, scriptRejections) || other.scriptRejections == scriptRejections)&&(identical(other.contentRejections, contentRejections) || other.contentRejections == contentRejections)&&(identical(other.scriptText, scriptText) || other.scriptText == scriptText)&&const DeepCollectionEquality().equals(other._contentFiles, _contentFiles)&&(identical(other.postLink, postLink) || other.postLink == postLink)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.code, code) || other.code == code)&&(identical(other.shootDate, shootDate) || other.shootDate == shootDate)&&(identical(other.madeContent, madeContent) || other.madeContent == madeContent)&&(identical(other.endReason, endReason) || other.endReason == endReason)&&(identical(other.strike, strike) || other.strike == strike)&&const DeepCollectionEquality().equals(other._chat, _chat)&&const DeepCollectionEquality().equals(other._log, _log)&&(identical(other.appliedAt, appliedAt) || other.appliedAt == appliedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,campaignId,type,title,brandName,stage,credits,addressId,scriptVersion,contentRound,scriptRejections,contentRejections,scriptText,const DeepCollectionEquality().hash(_contentFiles),postLink,delivery,code,shootDate,madeContent,endReason,strike,const DeepCollectionEquality().hash(_chat),const DeepCollectionEquality().hash(_log),appliedAt,updatedAt]);

@override
String toString() {
  return 'Deal(id: $id, campaignId: $campaignId, type: $type, title: $title, brandName: $brandName, stage: $stage, credits: $credits, addressId: $addressId, scriptVersion: $scriptVersion, contentRound: $contentRound, scriptRejections: $scriptRejections, contentRejections: $contentRejections, scriptText: $scriptText, contentFiles: $contentFiles, postLink: $postLink, delivery: $delivery, code: $code, shootDate: $shootDate, madeContent: $madeContent, endReason: $endReason, strike: $strike, chat: $chat, log: $log, appliedAt: $appliedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DealCopyWith<$Res> implements $DealCopyWith<$Res> {
  factory _$DealCopyWith(_Deal value, $Res Function(_Deal) _then) = __$DealCopyWithImpl;
@override @useResult
$Res call({
 String id, String campaignId, CampaignType type, String title, String brandName, DealStage stage, int credits, String? addressId, int scriptVersion, int contentRound, int scriptRejections, int contentRejections, String? scriptText, List<String> contentFiles, String? postLink, Delivery? delivery, IssuedCode? code, DateTime? shootDate, bool? madeContent, String? endReason, bool strike, List<ChatMessage> chat, List<DealEvent> log, DateTime appliedAt, DateTime updatedAt
});


@override $DeliveryCopyWith<$Res>? get delivery;@override $IssuedCodeCopyWith<$Res>? get code;

}
/// @nodoc
class __$DealCopyWithImpl<$Res>
    implements _$DealCopyWith<$Res> {
  __$DealCopyWithImpl(this._self, this._then);

  final _Deal _self;
  final $Res Function(_Deal) _then;

/// Create a copy of Deal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? campaignId = null,Object? type = null,Object? title = null,Object? brandName = null,Object? stage = null,Object? credits = null,Object? addressId = freezed,Object? scriptVersion = null,Object? contentRound = null,Object? scriptRejections = null,Object? contentRejections = null,Object? scriptText = freezed,Object? contentFiles = null,Object? postLink = freezed,Object? delivery = freezed,Object? code = freezed,Object? shootDate = freezed,Object? madeContent = freezed,Object? endReason = freezed,Object? strike = null,Object? chat = null,Object? log = null,Object? appliedAt = null,Object? updatedAt = null,}) {
  return _then(_Deal(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,campaignId: null == campaignId ? _self.campaignId : campaignId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CampaignType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as DealStage,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,scriptVersion: null == scriptVersion ? _self.scriptVersion : scriptVersion // ignore: cast_nullable_to_non_nullable
as int,contentRound: null == contentRound ? _self.contentRound : contentRound // ignore: cast_nullable_to_non_nullable
as int,scriptRejections: null == scriptRejections ? _self.scriptRejections : scriptRejections // ignore: cast_nullable_to_non_nullable
as int,contentRejections: null == contentRejections ? _self.contentRejections : contentRejections // ignore: cast_nullable_to_non_nullable
as int,scriptText: freezed == scriptText ? _self.scriptText : scriptText // ignore: cast_nullable_to_non_nullable
as String?,contentFiles: null == contentFiles ? _self._contentFiles : contentFiles // ignore: cast_nullable_to_non_nullable
as List<String>,postLink: freezed == postLink ? _self.postLink : postLink // ignore: cast_nullable_to_non_nullable
as String?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as Delivery?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as IssuedCode?,shootDate: freezed == shootDate ? _self.shootDate : shootDate // ignore: cast_nullable_to_non_nullable
as DateTime?,madeContent: freezed == madeContent ? _self.madeContent : madeContent // ignore: cast_nullable_to_non_nullable
as bool?,endReason: freezed == endReason ? _self.endReason : endReason // ignore: cast_nullable_to_non_nullable
as String?,strike: null == strike ? _self.strike : strike // ignore: cast_nullable_to_non_nullable
as bool,chat: null == chat ? _self._chat : chat // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,log: null == log ? _self._log : log // ignore: cast_nullable_to_non_nullable
as List<DealEvent>,appliedAt: null == appliedAt ? _self.appliedAt : appliedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Deal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryCopyWith<$Res>? get delivery {
    if (_self.delivery == null) {
    return null;
  }

  return $DeliveryCopyWith<$Res>(_self.delivery!, (value) {
    return _then(_self.copyWith(delivery: value));
  });
}/// Create a copy of Deal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssuedCodeCopyWith<$Res>? get code {
    if (_self.code == null) {
    return null;
  }

  return $IssuedCodeCopyWith<$Res>(_self.code!, (value) {
    return _then(_self.copyWith(code: value));
  });
}
}

// dart format on
