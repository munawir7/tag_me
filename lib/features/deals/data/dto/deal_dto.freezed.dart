// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DealDto {

 String get id; String get campaignId; String get type; String get title; String get brandName; String get stage; int get credits; String? get addressId; int get scriptVersion; int get contentRound; int get scriptRejections; int get contentRejections; String? get scriptText; List<String> get contentFiles; String? get postLink; DeliveryDto? get delivery; IssuedCodeDto? get code; DateTime? get shootDate; bool? get madeContent; String? get endReason; bool get strike; List<ChatMessageDto> get chat; List<DealEventDto> get log; DateTime get appliedAt; DateTime get updatedAt;
/// Create a copy of DealDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DealDtoCopyWith<DealDto> get copyWith => _$DealDtoCopyWithImpl<DealDto>(this as DealDto, _$identity);

  /// Serializes this DealDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealDto&&(identical(other.id, id) || other.id == id)&&(identical(other.campaignId, campaignId) || other.campaignId == campaignId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.scriptVersion, scriptVersion) || other.scriptVersion == scriptVersion)&&(identical(other.contentRound, contentRound) || other.contentRound == contentRound)&&(identical(other.scriptRejections, scriptRejections) || other.scriptRejections == scriptRejections)&&(identical(other.contentRejections, contentRejections) || other.contentRejections == contentRejections)&&(identical(other.scriptText, scriptText) || other.scriptText == scriptText)&&const DeepCollectionEquality().equals(other.contentFiles, contentFiles)&&(identical(other.postLink, postLink) || other.postLink == postLink)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.code, code) || other.code == code)&&(identical(other.shootDate, shootDate) || other.shootDate == shootDate)&&(identical(other.madeContent, madeContent) || other.madeContent == madeContent)&&(identical(other.endReason, endReason) || other.endReason == endReason)&&(identical(other.strike, strike) || other.strike == strike)&&const DeepCollectionEquality().equals(other.chat, chat)&&const DeepCollectionEquality().equals(other.log, log)&&(identical(other.appliedAt, appliedAt) || other.appliedAt == appliedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,campaignId,type,title,brandName,stage,credits,addressId,scriptVersion,contentRound,scriptRejections,contentRejections,scriptText,const DeepCollectionEquality().hash(contentFiles),postLink,delivery,code,shootDate,madeContent,endReason,strike,const DeepCollectionEquality().hash(chat),const DeepCollectionEquality().hash(log),appliedAt,updatedAt]);

@override
String toString() {
  return 'DealDto(id: $id, campaignId: $campaignId, type: $type, title: $title, brandName: $brandName, stage: $stage, credits: $credits, addressId: $addressId, scriptVersion: $scriptVersion, contentRound: $contentRound, scriptRejections: $scriptRejections, contentRejections: $contentRejections, scriptText: $scriptText, contentFiles: $contentFiles, postLink: $postLink, delivery: $delivery, code: $code, shootDate: $shootDate, madeContent: $madeContent, endReason: $endReason, strike: $strike, chat: $chat, log: $log, appliedAt: $appliedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DealDtoCopyWith<$Res>  {
  factory $DealDtoCopyWith(DealDto value, $Res Function(DealDto) _then) = _$DealDtoCopyWithImpl;
@useResult
$Res call({
 String id, String campaignId, String type, String title, String brandName, String stage, int credits, String? addressId, int scriptVersion, int contentRound, int scriptRejections, int contentRejections, String? scriptText, List<String> contentFiles, String? postLink, DeliveryDto? delivery, IssuedCodeDto? code, DateTime? shootDate, bool? madeContent, String? endReason, bool strike, List<ChatMessageDto> chat, List<DealEventDto> log, DateTime appliedAt, DateTime updatedAt
});


$DeliveryDtoCopyWith<$Res>? get delivery;$IssuedCodeDtoCopyWith<$Res>? get code;

}
/// @nodoc
class _$DealDtoCopyWithImpl<$Res>
    implements $DealDtoCopyWith<$Res> {
  _$DealDtoCopyWithImpl(this._self, this._then);

  final DealDto _self;
  final $Res Function(DealDto) _then;

/// Create a copy of DealDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? campaignId = null,Object? type = null,Object? title = null,Object? brandName = null,Object? stage = null,Object? credits = null,Object? addressId = freezed,Object? scriptVersion = null,Object? contentRound = null,Object? scriptRejections = null,Object? contentRejections = null,Object? scriptText = freezed,Object? contentFiles = null,Object? postLink = freezed,Object? delivery = freezed,Object? code = freezed,Object? shootDate = freezed,Object? madeContent = freezed,Object? endReason = freezed,Object? strike = null,Object? chat = null,Object? log = null,Object? appliedAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,campaignId: null == campaignId ? _self.campaignId : campaignId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,scriptVersion: null == scriptVersion ? _self.scriptVersion : scriptVersion // ignore: cast_nullable_to_non_nullable
as int,contentRound: null == contentRound ? _self.contentRound : contentRound // ignore: cast_nullable_to_non_nullable
as int,scriptRejections: null == scriptRejections ? _self.scriptRejections : scriptRejections // ignore: cast_nullable_to_non_nullable
as int,contentRejections: null == contentRejections ? _self.contentRejections : contentRejections // ignore: cast_nullable_to_non_nullable
as int,scriptText: freezed == scriptText ? _self.scriptText : scriptText // ignore: cast_nullable_to_non_nullable
as String?,contentFiles: null == contentFiles ? _self.contentFiles : contentFiles // ignore: cast_nullable_to_non_nullable
as List<String>,postLink: freezed == postLink ? _self.postLink : postLink // ignore: cast_nullable_to_non_nullable
as String?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as DeliveryDto?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as IssuedCodeDto?,shootDate: freezed == shootDate ? _self.shootDate : shootDate // ignore: cast_nullable_to_non_nullable
as DateTime?,madeContent: freezed == madeContent ? _self.madeContent : madeContent // ignore: cast_nullable_to_non_nullable
as bool?,endReason: freezed == endReason ? _self.endReason : endReason // ignore: cast_nullable_to_non_nullable
as String?,strike: null == strike ? _self.strike : strike // ignore: cast_nullable_to_non_nullable
as bool,chat: null == chat ? _self.chat : chat // ignore: cast_nullable_to_non_nullable
as List<ChatMessageDto>,log: null == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as List<DealEventDto>,appliedAt: null == appliedAt ? _self.appliedAt : appliedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of DealDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryDtoCopyWith<$Res>? get delivery {
    if (_self.delivery == null) {
    return null;
  }

  return $DeliveryDtoCopyWith<$Res>(_self.delivery!, (value) {
    return _then(_self.copyWith(delivery: value));
  });
}/// Create a copy of DealDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssuedCodeDtoCopyWith<$Res>? get code {
    if (_self.code == null) {
    return null;
  }

  return $IssuedCodeDtoCopyWith<$Res>(_self.code!, (value) {
    return _then(_self.copyWith(code: value));
  });
}
}


/// Adds pattern-matching-related methods to [DealDto].
extension DealDtoPatterns on DealDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DealDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DealDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DealDto value)  $default,){
final _that = this;
switch (_that) {
case _DealDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DealDto value)?  $default,){
final _that = this;
switch (_that) {
case _DealDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String campaignId,  String type,  String title,  String brandName,  String stage,  int credits,  String? addressId,  int scriptVersion,  int contentRound,  int scriptRejections,  int contentRejections,  String? scriptText,  List<String> contentFiles,  String? postLink,  DeliveryDto? delivery,  IssuedCodeDto? code,  DateTime? shootDate,  bool? madeContent,  String? endReason,  bool strike,  List<ChatMessageDto> chat,  List<DealEventDto> log,  DateTime appliedAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DealDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String campaignId,  String type,  String title,  String brandName,  String stage,  int credits,  String? addressId,  int scriptVersion,  int contentRound,  int scriptRejections,  int contentRejections,  String? scriptText,  List<String> contentFiles,  String? postLink,  DeliveryDto? delivery,  IssuedCodeDto? code,  DateTime? shootDate,  bool? madeContent,  String? endReason,  bool strike,  List<ChatMessageDto> chat,  List<DealEventDto> log,  DateTime appliedAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DealDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String campaignId,  String type,  String title,  String brandName,  String stage,  int credits,  String? addressId,  int scriptVersion,  int contentRound,  int scriptRejections,  int contentRejections,  String? scriptText,  List<String> contentFiles,  String? postLink,  DeliveryDto? delivery,  IssuedCodeDto? code,  DateTime? shootDate,  bool? madeContent,  String? endReason,  bool strike,  List<ChatMessageDto> chat,  List<DealEventDto> log,  DateTime appliedAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DealDto() when $default != null:
return $default(_that.id,_that.campaignId,_that.type,_that.title,_that.brandName,_that.stage,_that.credits,_that.addressId,_that.scriptVersion,_that.contentRound,_that.scriptRejections,_that.contentRejections,_that.scriptText,_that.contentFiles,_that.postLink,_that.delivery,_that.code,_that.shootDate,_that.madeContent,_that.endReason,_that.strike,_that.chat,_that.log,_that.appliedAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DealDto extends DealDto {
  const _DealDto({required this.id, required this.campaignId, required this.type, required this.title, required this.brandName, required this.stage, required this.credits, this.addressId, this.scriptVersion = 1, this.contentRound = 1, this.scriptRejections = 0, this.contentRejections = 0, this.scriptText, final  List<String> contentFiles = const [], this.postLink, this.delivery, this.code, this.shootDate, this.madeContent, this.endReason, this.strike = false, final  List<ChatMessageDto> chat = const [], final  List<DealEventDto> log = const [], required this.appliedAt, required this.updatedAt}): _contentFiles = contentFiles,_chat = chat,_log = log,super._();
  factory _DealDto.fromJson(Map<String, dynamic> json) => _$DealDtoFromJson(json);

@override final  String id;
@override final  String campaignId;
@override final  String type;
@override final  String title;
@override final  String brandName;
@override final  String stage;
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
@override final  DeliveryDto? delivery;
@override final  IssuedCodeDto? code;
@override final  DateTime? shootDate;
@override final  bool? madeContent;
@override final  String? endReason;
@override@JsonKey() final  bool strike;
 final  List<ChatMessageDto> _chat;
@override@JsonKey() List<ChatMessageDto> get chat {
  if (_chat is EqualUnmodifiableListView) return _chat;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chat);
}

 final  List<DealEventDto> _log;
@override@JsonKey() List<DealEventDto> get log {
  if (_log is EqualUnmodifiableListView) return _log;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_log);
}

@override final  DateTime appliedAt;
@override final  DateTime updatedAt;

/// Create a copy of DealDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DealDtoCopyWith<_DealDto> get copyWith => __$DealDtoCopyWithImpl<_DealDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DealDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DealDto&&(identical(other.id, id) || other.id == id)&&(identical(other.campaignId, campaignId) || other.campaignId == campaignId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.brandName, brandName) || other.brandName == brandName)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.scriptVersion, scriptVersion) || other.scriptVersion == scriptVersion)&&(identical(other.contentRound, contentRound) || other.contentRound == contentRound)&&(identical(other.scriptRejections, scriptRejections) || other.scriptRejections == scriptRejections)&&(identical(other.contentRejections, contentRejections) || other.contentRejections == contentRejections)&&(identical(other.scriptText, scriptText) || other.scriptText == scriptText)&&const DeepCollectionEquality().equals(other._contentFiles, _contentFiles)&&(identical(other.postLink, postLink) || other.postLink == postLink)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.code, code) || other.code == code)&&(identical(other.shootDate, shootDate) || other.shootDate == shootDate)&&(identical(other.madeContent, madeContent) || other.madeContent == madeContent)&&(identical(other.endReason, endReason) || other.endReason == endReason)&&(identical(other.strike, strike) || other.strike == strike)&&const DeepCollectionEquality().equals(other._chat, _chat)&&const DeepCollectionEquality().equals(other._log, _log)&&(identical(other.appliedAt, appliedAt) || other.appliedAt == appliedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,campaignId,type,title,brandName,stage,credits,addressId,scriptVersion,contentRound,scriptRejections,contentRejections,scriptText,const DeepCollectionEquality().hash(_contentFiles),postLink,delivery,code,shootDate,madeContent,endReason,strike,const DeepCollectionEquality().hash(_chat),const DeepCollectionEquality().hash(_log),appliedAt,updatedAt]);

@override
String toString() {
  return 'DealDto(id: $id, campaignId: $campaignId, type: $type, title: $title, brandName: $brandName, stage: $stage, credits: $credits, addressId: $addressId, scriptVersion: $scriptVersion, contentRound: $contentRound, scriptRejections: $scriptRejections, contentRejections: $contentRejections, scriptText: $scriptText, contentFiles: $contentFiles, postLink: $postLink, delivery: $delivery, code: $code, shootDate: $shootDate, madeContent: $madeContent, endReason: $endReason, strike: $strike, chat: $chat, log: $log, appliedAt: $appliedAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DealDtoCopyWith<$Res> implements $DealDtoCopyWith<$Res> {
  factory _$DealDtoCopyWith(_DealDto value, $Res Function(_DealDto) _then) = __$DealDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String campaignId, String type, String title, String brandName, String stage, int credits, String? addressId, int scriptVersion, int contentRound, int scriptRejections, int contentRejections, String? scriptText, List<String> contentFiles, String? postLink, DeliveryDto? delivery, IssuedCodeDto? code, DateTime? shootDate, bool? madeContent, String? endReason, bool strike, List<ChatMessageDto> chat, List<DealEventDto> log, DateTime appliedAt, DateTime updatedAt
});


@override $DeliveryDtoCopyWith<$Res>? get delivery;@override $IssuedCodeDtoCopyWith<$Res>? get code;

}
/// @nodoc
class __$DealDtoCopyWithImpl<$Res>
    implements _$DealDtoCopyWith<$Res> {
  __$DealDtoCopyWithImpl(this._self, this._then);

  final _DealDto _self;
  final $Res Function(_DealDto) _then;

/// Create a copy of DealDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? campaignId = null,Object? type = null,Object? title = null,Object? brandName = null,Object? stage = null,Object? credits = null,Object? addressId = freezed,Object? scriptVersion = null,Object? contentRound = null,Object? scriptRejections = null,Object? contentRejections = null,Object? scriptText = freezed,Object? contentFiles = null,Object? postLink = freezed,Object? delivery = freezed,Object? code = freezed,Object? shootDate = freezed,Object? madeContent = freezed,Object? endReason = freezed,Object? strike = null,Object? chat = null,Object? log = null,Object? appliedAt = null,Object? updatedAt = null,}) {
  return _then(_DealDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,campaignId: null == campaignId ? _self.campaignId : campaignId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,brandName: null == brandName ? _self.brandName : brandName // ignore: cast_nullable_to_non_nullable
as String,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as String,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,scriptVersion: null == scriptVersion ? _self.scriptVersion : scriptVersion // ignore: cast_nullable_to_non_nullable
as int,contentRound: null == contentRound ? _self.contentRound : contentRound // ignore: cast_nullable_to_non_nullable
as int,scriptRejections: null == scriptRejections ? _self.scriptRejections : scriptRejections // ignore: cast_nullable_to_non_nullable
as int,contentRejections: null == contentRejections ? _self.contentRejections : contentRejections // ignore: cast_nullable_to_non_nullable
as int,scriptText: freezed == scriptText ? _self.scriptText : scriptText // ignore: cast_nullable_to_non_nullable
as String?,contentFiles: null == contentFiles ? _self._contentFiles : contentFiles // ignore: cast_nullable_to_non_nullable
as List<String>,postLink: freezed == postLink ? _self.postLink : postLink // ignore: cast_nullable_to_non_nullable
as String?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as DeliveryDto?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as IssuedCodeDto?,shootDate: freezed == shootDate ? _self.shootDate : shootDate // ignore: cast_nullable_to_non_nullable
as DateTime?,madeContent: freezed == madeContent ? _self.madeContent : madeContent // ignore: cast_nullable_to_non_nullable
as bool?,endReason: freezed == endReason ? _self.endReason : endReason // ignore: cast_nullable_to_non_nullable
as String?,strike: null == strike ? _self.strike : strike // ignore: cast_nullable_to_non_nullable
as bool,chat: null == chat ? _self._chat : chat // ignore: cast_nullable_to_non_nullable
as List<ChatMessageDto>,log: null == log ? _self._log : log // ignore: cast_nullable_to_non_nullable
as List<DealEventDto>,appliedAt: null == appliedAt ? _self.appliedAt : appliedAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of DealDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeliveryDtoCopyWith<$Res>? get delivery {
    if (_self.delivery == null) {
    return null;
  }

  return $DeliveryDtoCopyWith<$Res>(_self.delivery!, (value) {
    return _then(_self.copyWith(delivery: value));
  });
}/// Create a copy of DealDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IssuedCodeDtoCopyWith<$Res>? get code {
    if (_self.code == null) {
    return null;
  }

  return $IssuedCodeDtoCopyWith<$Res>(_self.code!, (value) {
    return _then(_self.copyWith(code: value));
  });
}
}


/// @nodoc
mixin _$DeliveryDto {

 String get status; String get courier; String get courierKind; String? get trackingNo; String? get trackingUrl; DateTime? get eta; DateTime get deliverBy; String? get issue; int get attempts;
/// Create a copy of DeliveryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryDtoCopyWith<DeliveryDto> get copyWith => _$DeliveryDtoCopyWithImpl<DeliveryDto>(this as DeliveryDto, _$identity);

  /// Serializes this DeliveryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryDto&&(identical(other.status, status) || other.status == status)&&(identical(other.courier, courier) || other.courier == courier)&&(identical(other.courierKind, courierKind) || other.courierKind == courierKind)&&(identical(other.trackingNo, trackingNo) || other.trackingNo == trackingNo)&&(identical(other.trackingUrl, trackingUrl) || other.trackingUrl == trackingUrl)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.deliverBy, deliverBy) || other.deliverBy == deliverBy)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,courier,courierKind,trackingNo,trackingUrl,eta,deliverBy,issue,attempts);

@override
String toString() {
  return 'DeliveryDto(status: $status, courier: $courier, courierKind: $courierKind, trackingNo: $trackingNo, trackingUrl: $trackingUrl, eta: $eta, deliverBy: $deliverBy, issue: $issue, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $DeliveryDtoCopyWith<$Res>  {
  factory $DeliveryDtoCopyWith(DeliveryDto value, $Res Function(DeliveryDto) _then) = _$DeliveryDtoCopyWithImpl;
@useResult
$Res call({
 String status, String courier, String courierKind, String? trackingNo, String? trackingUrl, DateTime? eta, DateTime deliverBy, String? issue, int attempts
});




}
/// @nodoc
class _$DeliveryDtoCopyWithImpl<$Res>
    implements $DeliveryDtoCopyWith<$Res> {
  _$DeliveryDtoCopyWithImpl(this._self, this._then);

  final DeliveryDto _self;
  final $Res Function(DeliveryDto) _then;

/// Create a copy of DeliveryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? courier = null,Object? courierKind = null,Object? trackingNo = freezed,Object? trackingUrl = freezed,Object? eta = freezed,Object? deliverBy = null,Object? issue = freezed,Object? attempts = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,courier: null == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
as String,courierKind: null == courierKind ? _self.courierKind : courierKind // ignore: cast_nullable_to_non_nullable
as String,trackingNo: freezed == trackingNo ? _self.trackingNo : trackingNo // ignore: cast_nullable_to_non_nullable
as String?,trackingUrl: freezed == trackingUrl ? _self.trackingUrl : trackingUrl // ignore: cast_nullable_to_non_nullable
as String?,eta: freezed == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as DateTime?,deliverBy: null == deliverBy ? _self.deliverBy : deliverBy // ignore: cast_nullable_to_non_nullable
as DateTime,issue: freezed == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String?,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryDto].
extension DeliveryDtoPatterns on DeliveryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryDto value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryDto value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String courier,  String courierKind,  String? trackingNo,  String? trackingUrl,  DateTime? eta,  DateTime deliverBy,  String? issue,  int attempts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String courier,  String courierKind,  String? trackingNo,  String? trackingUrl,  DateTime? eta,  DateTime deliverBy,  String? issue,  int attempts)  $default,) {final _that = this;
switch (_that) {
case _DeliveryDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String courier,  String courierKind,  String? trackingNo,  String? trackingUrl,  DateTime? eta,  DateTime deliverBy,  String? issue,  int attempts)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryDto() when $default != null:
return $default(_that.status,_that.courier,_that.courierKind,_that.trackingNo,_that.trackingUrl,_that.eta,_that.deliverBy,_that.issue,_that.attempts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryDto extends DeliveryDto {
  const _DeliveryDto({required this.status, required this.courier, this.courierKind = 'third_party', this.trackingNo, this.trackingUrl, this.eta, required this.deliverBy, this.issue, this.attempts = 0}): super._();
  factory _DeliveryDto.fromJson(Map<String, dynamic> json) => _$DeliveryDtoFromJson(json);

@override final  String status;
@override final  String courier;
@override@JsonKey() final  String courierKind;
@override final  String? trackingNo;
@override final  String? trackingUrl;
@override final  DateTime? eta;
@override final  DateTime deliverBy;
@override final  String? issue;
@override@JsonKey() final  int attempts;

/// Create a copy of DeliveryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryDtoCopyWith<_DeliveryDto> get copyWith => __$DeliveryDtoCopyWithImpl<_DeliveryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryDto&&(identical(other.status, status) || other.status == status)&&(identical(other.courier, courier) || other.courier == courier)&&(identical(other.courierKind, courierKind) || other.courierKind == courierKind)&&(identical(other.trackingNo, trackingNo) || other.trackingNo == trackingNo)&&(identical(other.trackingUrl, trackingUrl) || other.trackingUrl == trackingUrl)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.deliverBy, deliverBy) || other.deliverBy == deliverBy)&&(identical(other.issue, issue) || other.issue == issue)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,courier,courierKind,trackingNo,trackingUrl,eta,deliverBy,issue,attempts);

@override
String toString() {
  return 'DeliveryDto(status: $status, courier: $courier, courierKind: $courierKind, trackingNo: $trackingNo, trackingUrl: $trackingUrl, eta: $eta, deliverBy: $deliverBy, issue: $issue, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class _$DeliveryDtoCopyWith<$Res> implements $DeliveryDtoCopyWith<$Res> {
  factory _$DeliveryDtoCopyWith(_DeliveryDto value, $Res Function(_DeliveryDto) _then) = __$DeliveryDtoCopyWithImpl;
@override @useResult
$Res call({
 String status, String courier, String courierKind, String? trackingNo, String? trackingUrl, DateTime? eta, DateTime deliverBy, String? issue, int attempts
});




}
/// @nodoc
class __$DeliveryDtoCopyWithImpl<$Res>
    implements _$DeliveryDtoCopyWith<$Res> {
  __$DeliveryDtoCopyWithImpl(this._self, this._then);

  final _DeliveryDto _self;
  final $Res Function(_DeliveryDto) _then;

/// Create a copy of DeliveryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? courier = null,Object? courierKind = null,Object? trackingNo = freezed,Object? trackingUrl = freezed,Object? eta = freezed,Object? deliverBy = null,Object? issue = freezed,Object? attempts = null,}) {
  return _then(_DeliveryDto(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,courier: null == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
as String,courierKind: null == courierKind ? _self.courierKind : courierKind // ignore: cast_nullable_to_non_nullable
as String,trackingNo: freezed == trackingNo ? _self.trackingNo : trackingNo // ignore: cast_nullable_to_non_nullable
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
mixin _$IssuedCodeDto {

 String get kind; String get code; String get howToUse; DateTime? get validUntil; DateTime? get redeemedAt;
/// Create a copy of IssuedCodeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssuedCodeDtoCopyWith<IssuedCodeDto> get copyWith => _$IssuedCodeDtoCopyWithImpl<IssuedCodeDto>(this as IssuedCodeDto, _$identity);

  /// Serializes this IssuedCodeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssuedCodeDto&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.code, code) || other.code == code)&&(identical(other.howToUse, howToUse) || other.howToUse == howToUse)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.redeemedAt, redeemedAt) || other.redeemedAt == redeemedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,code,howToUse,validUntil,redeemedAt);

@override
String toString() {
  return 'IssuedCodeDto(kind: $kind, code: $code, howToUse: $howToUse, validUntil: $validUntil, redeemedAt: $redeemedAt)';
}


}

/// @nodoc
abstract mixin class $IssuedCodeDtoCopyWith<$Res>  {
  factory $IssuedCodeDtoCopyWith(IssuedCodeDto value, $Res Function(IssuedCodeDto) _then) = _$IssuedCodeDtoCopyWithImpl;
@useResult
$Res call({
 String kind, String code, String howToUse, DateTime? validUntil, DateTime? redeemedAt
});




}
/// @nodoc
class _$IssuedCodeDtoCopyWithImpl<$Res>
    implements $IssuedCodeDtoCopyWith<$Res> {
  _$IssuedCodeDtoCopyWithImpl(this._self, this._then);

  final IssuedCodeDto _self;
  final $Res Function(IssuedCodeDto) _then;

/// Create a copy of IssuedCodeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? code = null,Object? howToUse = null,Object? validUntil = freezed,Object? redeemedAt = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,howToUse: null == howToUse ? _self.howToUse : howToUse // ignore: cast_nullable_to_non_nullable
as String,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,redeemedAt: freezed == redeemedAt ? _self.redeemedAt : redeemedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [IssuedCodeDto].
extension IssuedCodeDtoPatterns on IssuedCodeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssuedCodeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssuedCodeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssuedCodeDto value)  $default,){
final _that = this;
switch (_that) {
case _IssuedCodeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssuedCodeDto value)?  $default,){
final _that = this;
switch (_that) {
case _IssuedCodeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kind,  String code,  String howToUse,  DateTime? validUntil,  DateTime? redeemedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssuedCodeDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kind,  String code,  String howToUse,  DateTime? validUntil,  DateTime? redeemedAt)  $default,) {final _that = this;
switch (_that) {
case _IssuedCodeDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kind,  String code,  String howToUse,  DateTime? validUntil,  DateTime? redeemedAt)?  $default,) {final _that = this;
switch (_that) {
case _IssuedCodeDto() when $default != null:
return $default(_that.kind,_that.code,_that.howToUse,_that.validUntil,_that.redeemedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IssuedCodeDto extends IssuedCodeDto {
  const _IssuedCodeDto({required this.kind, required this.code, required this.howToUse, this.validUntil, this.redeemedAt}): super._();
  factory _IssuedCodeDto.fromJson(Map<String, dynamic> json) => _$IssuedCodeDtoFromJson(json);

@override final  String kind;
@override final  String code;
@override final  String howToUse;
@override final  DateTime? validUntil;
@override final  DateTime? redeemedAt;

/// Create a copy of IssuedCodeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssuedCodeDtoCopyWith<_IssuedCodeDto> get copyWith => __$IssuedCodeDtoCopyWithImpl<_IssuedCodeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IssuedCodeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssuedCodeDto&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.code, code) || other.code == code)&&(identical(other.howToUse, howToUse) || other.howToUse == howToUse)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.redeemedAt, redeemedAt) || other.redeemedAt == redeemedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,code,howToUse,validUntil,redeemedAt);

@override
String toString() {
  return 'IssuedCodeDto(kind: $kind, code: $code, howToUse: $howToUse, validUntil: $validUntil, redeemedAt: $redeemedAt)';
}


}

/// @nodoc
abstract mixin class _$IssuedCodeDtoCopyWith<$Res> implements $IssuedCodeDtoCopyWith<$Res> {
  factory _$IssuedCodeDtoCopyWith(_IssuedCodeDto value, $Res Function(_IssuedCodeDto) _then) = __$IssuedCodeDtoCopyWithImpl;
@override @useResult
$Res call({
 String kind, String code, String howToUse, DateTime? validUntil, DateTime? redeemedAt
});




}
/// @nodoc
class __$IssuedCodeDtoCopyWithImpl<$Res>
    implements _$IssuedCodeDtoCopyWith<$Res> {
  __$IssuedCodeDtoCopyWithImpl(this._self, this._then);

  final _IssuedCodeDto _self;
  final $Res Function(_IssuedCodeDto) _then;

/// Create a copy of IssuedCodeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? code = null,Object? howToUse = null,Object? validUntil = freezed,Object? redeemedAt = freezed,}) {
  return _then(_IssuedCodeDto(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,howToUse: null == howToUse ? _self.howToUse : howToUse // ignore: cast_nullable_to_non_nullable
as String,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,redeemedAt: freezed == redeemedAt ? _self.redeemedAt : redeemedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ChatMessageDto {

 String get id; String get from; String get text; DateTime get sentAt; String? get tag; String? get videoTimestamp; String? get attachment;
/// Create a copy of ChatMessageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageDtoCopyWith<ChatMessageDto> get copyWith => _$ChatMessageDtoCopyWithImpl<ChatMessageDto>(this as ChatMessageDto, _$identity);

  /// Serializes this ChatMessageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.from, from) || other.from == from)&&(identical(other.text, text) || other.text == text)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.videoTimestamp, videoTimestamp) || other.videoTimestamp == videoTimestamp)&&(identical(other.attachment, attachment) || other.attachment == attachment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,from,text,sentAt,tag,videoTimestamp,attachment);

@override
String toString() {
  return 'ChatMessageDto(id: $id, from: $from, text: $text, sentAt: $sentAt, tag: $tag, videoTimestamp: $videoTimestamp, attachment: $attachment)';
}


}

/// @nodoc
abstract mixin class $ChatMessageDtoCopyWith<$Res>  {
  factory $ChatMessageDtoCopyWith(ChatMessageDto value, $Res Function(ChatMessageDto) _then) = _$ChatMessageDtoCopyWithImpl;
@useResult
$Res call({
 String id, String from, String text, DateTime sentAt, String? tag, String? videoTimestamp, String? attachment
});




}
/// @nodoc
class _$ChatMessageDtoCopyWithImpl<$Res>
    implements $ChatMessageDtoCopyWith<$Res> {
  _$ChatMessageDtoCopyWithImpl(this._self, this._then);

  final ChatMessageDto _self;
  final $Res Function(ChatMessageDto) _then;

/// Create a copy of ChatMessageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? from = null,Object? text = null,Object? sentAt = null,Object? tag = freezed,Object? videoTimestamp = freezed,Object? attachment = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,videoTimestamp: freezed == videoTimestamp ? _self.videoTimestamp : videoTimestamp // ignore: cast_nullable_to_non_nullable
as String?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessageDto].
extension ChatMessageDtoPatterns on ChatMessageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessageDto value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessageDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String from,  String text,  DateTime sentAt,  String? tag,  String? videoTimestamp,  String? attachment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessageDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String from,  String text,  DateTime sentAt,  String? tag,  String? videoTimestamp,  String? attachment)  $default,) {final _that = this;
switch (_that) {
case _ChatMessageDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String from,  String text,  DateTime sentAt,  String? tag,  String? videoTimestamp,  String? attachment)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessageDto() when $default != null:
return $default(_that.id,_that.from,_that.text,_that.sentAt,_that.tag,_that.videoTimestamp,_that.attachment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessageDto extends ChatMessageDto {
  const _ChatMessageDto({required this.id, required this.from, required this.text, required this.sentAt, this.tag, this.videoTimestamp, this.attachment}): super._();
  factory _ChatMessageDto.fromJson(Map<String, dynamic> json) => _$ChatMessageDtoFromJson(json);

@override final  String id;
@override final  String from;
@override final  String text;
@override final  DateTime sentAt;
@override final  String? tag;
@override final  String? videoTimestamp;
@override final  String? attachment;

/// Create a copy of ChatMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageDtoCopyWith<_ChatMessageDto> get copyWith => __$ChatMessageDtoCopyWithImpl<_ChatMessageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.from, from) || other.from == from)&&(identical(other.text, text) || other.text == text)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.videoTimestamp, videoTimestamp) || other.videoTimestamp == videoTimestamp)&&(identical(other.attachment, attachment) || other.attachment == attachment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,from,text,sentAt,tag,videoTimestamp,attachment);

@override
String toString() {
  return 'ChatMessageDto(id: $id, from: $from, text: $text, sentAt: $sentAt, tag: $tag, videoTimestamp: $videoTimestamp, attachment: $attachment)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageDtoCopyWith<$Res> implements $ChatMessageDtoCopyWith<$Res> {
  factory _$ChatMessageDtoCopyWith(_ChatMessageDto value, $Res Function(_ChatMessageDto) _then) = __$ChatMessageDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String from, String text, DateTime sentAt, String? tag, String? videoTimestamp, String? attachment
});




}
/// @nodoc
class __$ChatMessageDtoCopyWithImpl<$Res>
    implements _$ChatMessageDtoCopyWith<$Res> {
  __$ChatMessageDtoCopyWithImpl(this._self, this._then);

  final _ChatMessageDto _self;
  final $Res Function(_ChatMessageDto) _then;

/// Create a copy of ChatMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? from = null,Object? text = null,Object? sentAt = null,Object? tag = freezed,Object? videoTimestamp = freezed,Object? attachment = freezed,}) {
  return _then(_ChatMessageDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,videoTimestamp: freezed == videoTimestamp ? _self.videoTimestamp : videoTimestamp // ignore: cast_nullable_to_non_nullable
as String?,attachment: freezed == attachment ? _self.attachment : attachment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DealEventDto {

 String? get actor; String get text; DateTime get at;
/// Create a copy of DealEventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DealEventDtoCopyWith<DealEventDto> get copyWith => _$DealEventDtoCopyWithImpl<DealEventDto>(this as DealEventDto, _$identity);

  /// Serializes this DealEventDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealEventDto&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.text, text) || other.text == text)&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,actor,text,at);

@override
String toString() {
  return 'DealEventDto(actor: $actor, text: $text, at: $at)';
}


}

/// @nodoc
abstract mixin class $DealEventDtoCopyWith<$Res>  {
  factory $DealEventDtoCopyWith(DealEventDto value, $Res Function(DealEventDto) _then) = _$DealEventDtoCopyWithImpl;
@useResult
$Res call({
 String? actor, String text, DateTime at
});




}
/// @nodoc
class _$DealEventDtoCopyWithImpl<$Res>
    implements $DealEventDtoCopyWith<$Res> {
  _$DealEventDtoCopyWithImpl(this._self, this._then);

  final DealEventDto _self;
  final $Res Function(DealEventDto) _then;

/// Create a copy of DealEventDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? actor = freezed,Object? text = null,Object? at = null,}) {
  return _then(_self.copyWith(
actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as String?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DealEventDto].
extension DealEventDtoPatterns on DealEventDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DealEventDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DealEventDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DealEventDto value)  $default,){
final _that = this;
switch (_that) {
case _DealEventDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DealEventDto value)?  $default,){
final _that = this;
switch (_that) {
case _DealEventDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? actor,  String text,  DateTime at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DealEventDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? actor,  String text,  DateTime at)  $default,) {final _that = this;
switch (_that) {
case _DealEventDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? actor,  String text,  DateTime at)?  $default,) {final _that = this;
switch (_that) {
case _DealEventDto() when $default != null:
return $default(_that.actor,_that.text,_that.at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DealEventDto extends DealEventDto {
  const _DealEventDto({this.actor, required this.text, required this.at}): super._();
  factory _DealEventDto.fromJson(Map<String, dynamic> json) => _$DealEventDtoFromJson(json);

@override final  String? actor;
@override final  String text;
@override final  DateTime at;

/// Create a copy of DealEventDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DealEventDtoCopyWith<_DealEventDto> get copyWith => __$DealEventDtoCopyWithImpl<_DealEventDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DealEventDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DealEventDto&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.text, text) || other.text == text)&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,actor,text,at);

@override
String toString() {
  return 'DealEventDto(actor: $actor, text: $text, at: $at)';
}


}

/// @nodoc
abstract mixin class _$DealEventDtoCopyWith<$Res> implements $DealEventDtoCopyWith<$Res> {
  factory _$DealEventDtoCopyWith(_DealEventDto value, $Res Function(_DealEventDto) _then) = __$DealEventDtoCopyWithImpl;
@override @useResult
$Res call({
 String? actor, String text, DateTime at
});




}
/// @nodoc
class __$DealEventDtoCopyWithImpl<$Res>
    implements _$DealEventDtoCopyWith<$Res> {
  __$DealEventDtoCopyWithImpl(this._self, this._then);

  final _DealEventDto _self;
  final $Res Function(_DealEventDto) _then;

/// Create a copy of DealEventDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? actor = freezed,Object? text = null,Object? at = null,}) {
  return _then(_DealEventDto(
actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as String?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
