// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campaign_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CampaignDto {

 String get id; String get type; BrandDto get brand; String get title; String get category; String? get meta; String get worth; int get spotsLeft; int get spotsTotal; int get credits; String get youGet; String get youGetShort; String get contentShort; List<String> get criteria; String? get brief; List<String> get eligibility; List<String> get deliverables; List<String> get materials; bool get contentReuse; List<KeyDateDto> get timeline; List<String> get howItWorks; String get agreement; String get afterApply; String get country; bool get isOpen; String? get photoUrl;
/// Create a copy of CampaignDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampaignDtoCopyWith<CampaignDto> get copyWith => _$CampaignDtoCopyWithImpl<CampaignDto>(this as CampaignDto, _$identity);

  /// Serializes this CampaignDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampaignDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.worth, worth) || other.worth == worth)&&(identical(other.spotsLeft, spotsLeft) || other.spotsLeft == spotsLeft)&&(identical(other.spotsTotal, spotsTotal) || other.spotsTotal == spotsTotal)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.youGet, youGet) || other.youGet == youGet)&&(identical(other.youGetShort, youGetShort) || other.youGetShort == youGetShort)&&(identical(other.contentShort, contentShort) || other.contentShort == contentShort)&&const DeepCollectionEquality().equals(other.criteria, criteria)&&(identical(other.brief, brief) || other.brief == brief)&&const DeepCollectionEquality().equals(other.eligibility, eligibility)&&const DeepCollectionEquality().equals(other.deliverables, deliverables)&&const DeepCollectionEquality().equals(other.materials, materials)&&(identical(other.contentReuse, contentReuse) || other.contentReuse == contentReuse)&&const DeepCollectionEquality().equals(other.timeline, timeline)&&const DeepCollectionEquality().equals(other.howItWorks, howItWorks)&&(identical(other.agreement, agreement) || other.agreement == agreement)&&(identical(other.afterApply, afterApply) || other.afterApply == afterApply)&&(identical(other.country, country) || other.country == country)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,type,brand,title,category,meta,worth,spotsLeft,spotsTotal,credits,youGet,youGetShort,contentShort,const DeepCollectionEquality().hash(criteria),brief,const DeepCollectionEquality().hash(eligibility),const DeepCollectionEquality().hash(deliverables),const DeepCollectionEquality().hash(materials),contentReuse,const DeepCollectionEquality().hash(timeline),const DeepCollectionEquality().hash(howItWorks),agreement,afterApply,country,isOpen,photoUrl]);

@override
String toString() {
  return 'CampaignDto(id: $id, type: $type, brand: $brand, title: $title, category: $category, meta: $meta, worth: $worth, spotsLeft: $spotsLeft, spotsTotal: $spotsTotal, credits: $credits, youGet: $youGet, youGetShort: $youGetShort, contentShort: $contentShort, criteria: $criteria, brief: $brief, eligibility: $eligibility, deliverables: $deliverables, materials: $materials, contentReuse: $contentReuse, timeline: $timeline, howItWorks: $howItWorks, agreement: $agreement, afterApply: $afterApply, country: $country, isOpen: $isOpen, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class $CampaignDtoCopyWith<$Res>  {
  factory $CampaignDtoCopyWith(CampaignDto value, $Res Function(CampaignDto) _then) = _$CampaignDtoCopyWithImpl;
@useResult
$Res call({
 String id, String type, BrandDto brand, String title, String category, String? meta, String worth, int spotsLeft, int spotsTotal, int credits, String youGet, String youGetShort, String contentShort, List<String> criteria, String? brief, List<String> eligibility, List<String> deliverables, List<String> materials, bool contentReuse, List<KeyDateDto> timeline, List<String> howItWorks, String agreement, String afterApply, String country, bool isOpen, String? photoUrl
});


$BrandDtoCopyWith<$Res> get brand;

}
/// @nodoc
class _$CampaignDtoCopyWithImpl<$Res>
    implements $CampaignDtoCopyWith<$Res> {
  _$CampaignDtoCopyWithImpl(this._self, this._then);

  final CampaignDto _self;
  final $Res Function(CampaignDto) _then;

/// Create a copy of CampaignDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? brand = null,Object? title = null,Object? category = null,Object? meta = freezed,Object? worth = null,Object? spotsLeft = null,Object? spotsTotal = null,Object? credits = null,Object? youGet = null,Object? youGetShort = null,Object? contentShort = null,Object? criteria = null,Object? brief = freezed,Object? eligibility = null,Object? deliverables = null,Object? materials = null,Object? contentReuse = null,Object? timeline = null,Object? howItWorks = null,Object? agreement = null,Object? afterApply = null,Object? country = null,Object? isOpen = null,Object? photoUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as BrandDto,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as String?,worth: null == worth ? _self.worth : worth // ignore: cast_nullable_to_non_nullable
as String,spotsLeft: null == spotsLeft ? _self.spotsLeft : spotsLeft // ignore: cast_nullable_to_non_nullable
as int,spotsTotal: null == spotsTotal ? _self.spotsTotal : spotsTotal // ignore: cast_nullable_to_non_nullable
as int,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,youGet: null == youGet ? _self.youGet : youGet // ignore: cast_nullable_to_non_nullable
as String,youGetShort: null == youGetShort ? _self.youGetShort : youGetShort // ignore: cast_nullable_to_non_nullable
as String,contentShort: null == contentShort ? _self.contentShort : contentShort // ignore: cast_nullable_to_non_nullable
as String,criteria: null == criteria ? _self.criteria : criteria // ignore: cast_nullable_to_non_nullable
as List<String>,brief: freezed == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as String?,eligibility: null == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as List<String>,deliverables: null == deliverables ? _self.deliverables : deliverables // ignore: cast_nullable_to_non_nullable
as List<String>,materials: null == materials ? _self.materials : materials // ignore: cast_nullable_to_non_nullable
as List<String>,contentReuse: null == contentReuse ? _self.contentReuse : contentReuse // ignore: cast_nullable_to_non_nullable
as bool,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<KeyDateDto>,howItWorks: null == howItWorks ? _self.howItWorks : howItWorks // ignore: cast_nullable_to_non_nullable
as List<String>,agreement: null == agreement ? _self.agreement : agreement // ignore: cast_nullable_to_non_nullable
as String,afterApply: null == afterApply ? _self.afterApply : afterApply // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CampaignDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandDtoCopyWith<$Res> get brand {
  
  return $BrandDtoCopyWith<$Res>(_self.brand, (value) {
    return _then(_self.copyWith(brand: value));
  });
}
}


/// Adds pattern-matching-related methods to [CampaignDto].
extension CampaignDtoPatterns on CampaignDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampaignDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampaignDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampaignDto value)  $default,){
final _that = this;
switch (_that) {
case _CampaignDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampaignDto value)?  $default,){
final _that = this;
switch (_that) {
case _CampaignDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  BrandDto brand,  String title,  String category,  String? meta,  String worth,  int spotsLeft,  int spotsTotal,  int credits,  String youGet,  String youGetShort,  String contentShort,  List<String> criteria,  String? brief,  List<String> eligibility,  List<String> deliverables,  List<String> materials,  bool contentReuse,  List<KeyDateDto> timeline,  List<String> howItWorks,  String agreement,  String afterApply,  String country,  bool isOpen,  String? photoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampaignDto() when $default != null:
return $default(_that.id,_that.type,_that.brand,_that.title,_that.category,_that.meta,_that.worth,_that.spotsLeft,_that.spotsTotal,_that.credits,_that.youGet,_that.youGetShort,_that.contentShort,_that.criteria,_that.brief,_that.eligibility,_that.deliverables,_that.materials,_that.contentReuse,_that.timeline,_that.howItWorks,_that.agreement,_that.afterApply,_that.country,_that.isOpen,_that.photoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  BrandDto brand,  String title,  String category,  String? meta,  String worth,  int spotsLeft,  int spotsTotal,  int credits,  String youGet,  String youGetShort,  String contentShort,  List<String> criteria,  String? brief,  List<String> eligibility,  List<String> deliverables,  List<String> materials,  bool contentReuse,  List<KeyDateDto> timeline,  List<String> howItWorks,  String agreement,  String afterApply,  String country,  bool isOpen,  String? photoUrl)  $default,) {final _that = this;
switch (_that) {
case _CampaignDto():
return $default(_that.id,_that.type,_that.brand,_that.title,_that.category,_that.meta,_that.worth,_that.spotsLeft,_that.spotsTotal,_that.credits,_that.youGet,_that.youGetShort,_that.contentShort,_that.criteria,_that.brief,_that.eligibility,_that.deliverables,_that.materials,_that.contentReuse,_that.timeline,_that.howItWorks,_that.agreement,_that.afterApply,_that.country,_that.isOpen,_that.photoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  BrandDto brand,  String title,  String category,  String? meta,  String worth,  int spotsLeft,  int spotsTotal,  int credits,  String youGet,  String youGetShort,  String contentShort,  List<String> criteria,  String? brief,  List<String> eligibility,  List<String> deliverables,  List<String> materials,  bool contentReuse,  List<KeyDateDto> timeline,  List<String> howItWorks,  String agreement,  String afterApply,  String country,  bool isOpen,  String? photoUrl)?  $default,) {final _that = this;
switch (_that) {
case _CampaignDto() when $default != null:
return $default(_that.id,_that.type,_that.brand,_that.title,_that.category,_that.meta,_that.worth,_that.spotsLeft,_that.spotsTotal,_that.credits,_that.youGet,_that.youGetShort,_that.contentShort,_that.criteria,_that.brief,_that.eligibility,_that.deliverables,_that.materials,_that.contentReuse,_that.timeline,_that.howItWorks,_that.agreement,_that.afterApply,_that.country,_that.isOpen,_that.photoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CampaignDto extends CampaignDto {
  const _CampaignDto({required this.id, required this.type, required this.brand, required this.title, required this.category, this.meta, required this.worth, required this.spotsLeft, required this.spotsTotal, required this.credits, required this.youGet, required this.youGetShort, required this.contentShort, final  List<String> criteria = const [], this.brief, final  List<String> eligibility = const [], final  List<String> deliverables = const [], final  List<String> materials = const [], this.contentReuse = false, final  List<KeyDateDto> timeline = const [], final  List<String> howItWorks = const [], required this.agreement, required this.afterApply, this.country = 'UAE', this.isOpen = true, this.photoUrl}): _criteria = criteria,_eligibility = eligibility,_deliverables = deliverables,_materials = materials,_timeline = timeline,_howItWorks = howItWorks,super._();
  factory _CampaignDto.fromJson(Map<String, dynamic> json) => _$CampaignDtoFromJson(json);

@override final  String id;
@override final  String type;
@override final  BrandDto brand;
@override final  String title;
@override final  String category;
@override final  String? meta;
@override final  String worth;
@override final  int spotsLeft;
@override final  int spotsTotal;
@override final  int credits;
@override final  String youGet;
@override final  String youGetShort;
@override final  String contentShort;
 final  List<String> _criteria;
@override@JsonKey() List<String> get criteria {
  if (_criteria is EqualUnmodifiableListView) return _criteria;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_criteria);
}

@override final  String? brief;
 final  List<String> _eligibility;
@override@JsonKey() List<String> get eligibility {
  if (_eligibility is EqualUnmodifiableListView) return _eligibility;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eligibility);
}

 final  List<String> _deliverables;
@override@JsonKey() List<String> get deliverables {
  if (_deliverables is EqualUnmodifiableListView) return _deliverables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deliverables);
}

 final  List<String> _materials;
@override@JsonKey() List<String> get materials {
  if (_materials is EqualUnmodifiableListView) return _materials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_materials);
}

@override@JsonKey() final  bool contentReuse;
 final  List<KeyDateDto> _timeline;
@override@JsonKey() List<KeyDateDto> get timeline {
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeline);
}

 final  List<String> _howItWorks;
@override@JsonKey() List<String> get howItWorks {
  if (_howItWorks is EqualUnmodifiableListView) return _howItWorks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_howItWorks);
}

@override final  String agreement;
@override final  String afterApply;
@override@JsonKey() final  String country;
@override@JsonKey() final  bool isOpen;
@override final  String? photoUrl;

/// Create a copy of CampaignDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampaignDtoCopyWith<_CampaignDto> get copyWith => __$CampaignDtoCopyWithImpl<_CampaignDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampaignDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampaignDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.worth, worth) || other.worth == worth)&&(identical(other.spotsLeft, spotsLeft) || other.spotsLeft == spotsLeft)&&(identical(other.spotsTotal, spotsTotal) || other.spotsTotal == spotsTotal)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.youGet, youGet) || other.youGet == youGet)&&(identical(other.youGetShort, youGetShort) || other.youGetShort == youGetShort)&&(identical(other.contentShort, contentShort) || other.contentShort == contentShort)&&const DeepCollectionEquality().equals(other._criteria, _criteria)&&(identical(other.brief, brief) || other.brief == brief)&&const DeepCollectionEquality().equals(other._eligibility, _eligibility)&&const DeepCollectionEquality().equals(other._deliverables, _deliverables)&&const DeepCollectionEquality().equals(other._materials, _materials)&&(identical(other.contentReuse, contentReuse) || other.contentReuse == contentReuse)&&const DeepCollectionEquality().equals(other._timeline, _timeline)&&const DeepCollectionEquality().equals(other._howItWorks, _howItWorks)&&(identical(other.agreement, agreement) || other.agreement == agreement)&&(identical(other.afterApply, afterApply) || other.afterApply == afterApply)&&(identical(other.country, country) || other.country == country)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,type,brand,title,category,meta,worth,spotsLeft,spotsTotal,credits,youGet,youGetShort,contentShort,const DeepCollectionEquality().hash(_criteria),brief,const DeepCollectionEquality().hash(_eligibility),const DeepCollectionEquality().hash(_deliverables),const DeepCollectionEquality().hash(_materials),contentReuse,const DeepCollectionEquality().hash(_timeline),const DeepCollectionEquality().hash(_howItWorks),agreement,afterApply,country,isOpen,photoUrl]);

@override
String toString() {
  return 'CampaignDto(id: $id, type: $type, brand: $brand, title: $title, category: $category, meta: $meta, worth: $worth, spotsLeft: $spotsLeft, spotsTotal: $spotsTotal, credits: $credits, youGet: $youGet, youGetShort: $youGetShort, contentShort: $contentShort, criteria: $criteria, brief: $brief, eligibility: $eligibility, deliverables: $deliverables, materials: $materials, contentReuse: $contentReuse, timeline: $timeline, howItWorks: $howItWorks, agreement: $agreement, afterApply: $afterApply, country: $country, isOpen: $isOpen, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class _$CampaignDtoCopyWith<$Res> implements $CampaignDtoCopyWith<$Res> {
  factory _$CampaignDtoCopyWith(_CampaignDto value, $Res Function(_CampaignDto) _then) = __$CampaignDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, BrandDto brand, String title, String category, String? meta, String worth, int spotsLeft, int spotsTotal, int credits, String youGet, String youGetShort, String contentShort, List<String> criteria, String? brief, List<String> eligibility, List<String> deliverables, List<String> materials, bool contentReuse, List<KeyDateDto> timeline, List<String> howItWorks, String agreement, String afterApply, String country, bool isOpen, String? photoUrl
});


@override $BrandDtoCopyWith<$Res> get brand;

}
/// @nodoc
class __$CampaignDtoCopyWithImpl<$Res>
    implements _$CampaignDtoCopyWith<$Res> {
  __$CampaignDtoCopyWithImpl(this._self, this._then);

  final _CampaignDto _self;
  final $Res Function(_CampaignDto) _then;

/// Create a copy of CampaignDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? brand = null,Object? title = null,Object? category = null,Object? meta = freezed,Object? worth = null,Object? spotsLeft = null,Object? spotsTotal = null,Object? credits = null,Object? youGet = null,Object? youGetShort = null,Object? contentShort = null,Object? criteria = null,Object? brief = freezed,Object? eligibility = null,Object? deliverables = null,Object? materials = null,Object? contentReuse = null,Object? timeline = null,Object? howItWorks = null,Object? agreement = null,Object? afterApply = null,Object? country = null,Object? isOpen = null,Object? photoUrl = freezed,}) {
  return _then(_CampaignDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as BrandDto,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as String?,worth: null == worth ? _self.worth : worth // ignore: cast_nullable_to_non_nullable
as String,spotsLeft: null == spotsLeft ? _self.spotsLeft : spotsLeft // ignore: cast_nullable_to_non_nullable
as int,spotsTotal: null == spotsTotal ? _self.spotsTotal : spotsTotal // ignore: cast_nullable_to_non_nullable
as int,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,youGet: null == youGet ? _self.youGet : youGet // ignore: cast_nullable_to_non_nullable
as String,youGetShort: null == youGetShort ? _self.youGetShort : youGetShort // ignore: cast_nullable_to_non_nullable
as String,contentShort: null == contentShort ? _self.contentShort : contentShort // ignore: cast_nullable_to_non_nullable
as String,criteria: null == criteria ? _self._criteria : criteria // ignore: cast_nullable_to_non_nullable
as List<String>,brief: freezed == brief ? _self.brief : brief // ignore: cast_nullable_to_non_nullable
as String?,eligibility: null == eligibility ? _self._eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as List<String>,deliverables: null == deliverables ? _self._deliverables : deliverables // ignore: cast_nullable_to_non_nullable
as List<String>,materials: null == materials ? _self._materials : materials // ignore: cast_nullable_to_non_nullable
as List<String>,contentReuse: null == contentReuse ? _self.contentReuse : contentReuse // ignore: cast_nullable_to_non_nullable
as bool,timeline: null == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<KeyDateDto>,howItWorks: null == howItWorks ? _self._howItWorks : howItWorks // ignore: cast_nullable_to_non_nullable
as List<String>,agreement: null == agreement ? _self.agreement : agreement // ignore: cast_nullable_to_non_nullable
as String,afterApply: null == afterApply ? _self.afterApply : afterApply // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CampaignDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandDtoCopyWith<$Res> get brand {
  
  return $BrandDtoCopyWith<$Res>(_self.brand, (value) {
    return _then(_self.copyWith(brand: value));
  });
}
}


/// @nodoc
mixin _$BrandDto {

 String get id; String get name; String get handle; int get value; String? get logoUrl;
/// Create a copy of BrandDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandDtoCopyWith<BrandDto> get copyWith => _$BrandDtoCopyWithImpl<BrandDto>(this as BrandDto, _$identity);

  /// Serializes this BrandDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrandDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.value, value) || other.value == value)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,handle,value,logoUrl);

@override
String toString() {
  return 'BrandDto(id: $id, name: $name, handle: $handle, value: $value, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class $BrandDtoCopyWith<$Res>  {
  factory $BrandDtoCopyWith(BrandDto value, $Res Function(BrandDto) _then) = _$BrandDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String handle, int value, String? logoUrl
});




}
/// @nodoc
class _$BrandDtoCopyWithImpl<$Res>
    implements $BrandDtoCopyWith<$Res> {
  _$BrandDtoCopyWithImpl(this._self, this._then);

  final BrandDto _self;
  final $Res Function(BrandDto) _then;

/// Create a copy of BrandDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? handle = null,Object? value = null,Object? logoUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,handle: null == handle ? _self.handle : handle // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BrandDto].
extension BrandDtoPatterns on BrandDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrandDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrandDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrandDto value)  $default,){
final _that = this;
switch (_that) {
case _BrandDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrandDto value)?  $default,){
final _that = this;
switch (_that) {
case _BrandDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String handle,  int value,  String? logoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrandDto() when $default != null:
return $default(_that.id,_that.name,_that.handle,_that.value,_that.logoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String handle,  int value,  String? logoUrl)  $default,) {final _that = this;
switch (_that) {
case _BrandDto():
return $default(_that.id,_that.name,_that.handle,_that.value,_that.logoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String handle,  int value,  String? logoUrl)?  $default,) {final _that = this;
switch (_that) {
case _BrandDto() when $default != null:
return $default(_that.id,_that.name,_that.handle,_that.value,_that.logoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BrandDto extends BrandDto {
  const _BrandDto({required this.id, required this.name, required this.handle, this.value = 4, this.logoUrl}): super._();
  factory _BrandDto.fromJson(Map<String, dynamic> json) => _$BrandDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String handle;
@override@JsonKey() final  int value;
@override final  String? logoUrl;

/// Create a copy of BrandDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandDtoCopyWith<_BrandDto> get copyWith => __$BrandDtoCopyWithImpl<_BrandDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BrandDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrandDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.value, value) || other.value == value)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,handle,value,logoUrl);

@override
String toString() {
  return 'BrandDto(id: $id, name: $name, handle: $handle, value: $value, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class _$BrandDtoCopyWith<$Res> implements $BrandDtoCopyWith<$Res> {
  factory _$BrandDtoCopyWith(_BrandDto value, $Res Function(_BrandDto) _then) = __$BrandDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String handle, int value, String? logoUrl
});




}
/// @nodoc
class __$BrandDtoCopyWithImpl<$Res>
    implements _$BrandDtoCopyWith<$Res> {
  __$BrandDtoCopyWithImpl(this._self, this._then);

  final _BrandDto _self;
  final $Res Function(_BrandDto) _then;

/// Create a copy of BrandDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? handle = null,Object? value = null,Object? logoUrl = freezed,}) {
  return _then(_BrandDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,handle: null == handle ? _self.handle : handle // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$KeyDateDto {

 String get kind; String get label; DateTime get date;
/// Create a copy of KeyDateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeyDateDtoCopyWith<KeyDateDto> get copyWith => _$KeyDateDtoCopyWithImpl<KeyDateDto>(this as KeyDateDto, _$identity);

  /// Serializes this KeyDateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeyDateDto&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.label, label) || other.label == label)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,label,date);

@override
String toString() {
  return 'KeyDateDto(kind: $kind, label: $label, date: $date)';
}


}

/// @nodoc
abstract mixin class $KeyDateDtoCopyWith<$Res>  {
  factory $KeyDateDtoCopyWith(KeyDateDto value, $Res Function(KeyDateDto) _then) = _$KeyDateDtoCopyWithImpl;
@useResult
$Res call({
 String kind, String label, DateTime date
});




}
/// @nodoc
class _$KeyDateDtoCopyWithImpl<$Res>
    implements $KeyDateDtoCopyWith<$Res> {
  _$KeyDateDtoCopyWithImpl(this._self, this._then);

  final KeyDateDto _self;
  final $Res Function(KeyDateDto) _then;

/// Create a copy of KeyDateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? label = null,Object? date = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [KeyDateDto].
extension KeyDateDtoPatterns on KeyDateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeyDateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeyDateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeyDateDto value)  $default,){
final _that = this;
switch (_that) {
case _KeyDateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeyDateDto value)?  $default,){
final _that = this;
switch (_that) {
case _KeyDateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kind,  String label,  DateTime date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KeyDateDto() when $default != null:
return $default(_that.kind,_that.label,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kind,  String label,  DateTime date)  $default,) {final _that = this;
switch (_that) {
case _KeyDateDto():
return $default(_that.kind,_that.label,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kind,  String label,  DateTime date)?  $default,) {final _that = this;
switch (_that) {
case _KeyDateDto() when $default != null:
return $default(_that.kind,_that.label,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KeyDateDto extends KeyDateDto {
  const _KeyDateDto({required this.kind, required this.label, required this.date}): super._();
  factory _KeyDateDto.fromJson(Map<String, dynamic> json) => _$KeyDateDtoFromJson(json);

@override final  String kind;
@override final  String label;
@override final  DateTime date;

/// Create a copy of KeyDateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeyDateDtoCopyWith<_KeyDateDto> get copyWith => __$KeyDateDtoCopyWithImpl<_KeyDateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KeyDateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeyDateDto&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.label, label) || other.label == label)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,label,date);

@override
String toString() {
  return 'KeyDateDto(kind: $kind, label: $label, date: $date)';
}


}

/// @nodoc
abstract mixin class _$KeyDateDtoCopyWith<$Res> implements $KeyDateDtoCopyWith<$Res> {
  factory _$KeyDateDtoCopyWith(_KeyDateDto value, $Res Function(_KeyDateDto) _then) = __$KeyDateDtoCopyWithImpl;
@override @useResult
$Res call({
 String kind, String label, DateTime date
});




}
/// @nodoc
class __$KeyDateDtoCopyWithImpl<$Res>
    implements _$KeyDateDtoCopyWith<$Res> {
  __$KeyDateDtoCopyWithImpl(this._self, this._then);

  final _KeyDateDto _self;
  final $Res Function(_KeyDateDto) _then;

/// Create a copy of KeyDateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? label = null,Object? date = null,}) {
  return _then(_KeyDateDto(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
