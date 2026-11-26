// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campaign.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KeyDate {

 KeyDateKind get kind;/// As the brand worded it, e.g. "Scripts due", "Event day".
 String get label; DateTime get date;
/// Create a copy of KeyDate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KeyDateCopyWith<KeyDate> get copyWith => _$KeyDateCopyWithImpl<KeyDate>(this as KeyDate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KeyDate&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.label, label) || other.label == label)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,kind,label,date);

@override
String toString() {
  return 'KeyDate(kind: $kind, label: $label, date: $date)';
}


}

/// @nodoc
abstract mixin class $KeyDateCopyWith<$Res>  {
  factory $KeyDateCopyWith(KeyDate value, $Res Function(KeyDate) _then) = _$KeyDateCopyWithImpl;
@useResult
$Res call({
 KeyDateKind kind, String label, DateTime date
});




}
/// @nodoc
class _$KeyDateCopyWithImpl<$Res>
    implements $KeyDateCopyWith<$Res> {
  _$KeyDateCopyWithImpl(this._self, this._then);

  final KeyDate _self;
  final $Res Function(KeyDate) _then;

/// Create a copy of KeyDate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? label = null,Object? date = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as KeyDateKind,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [KeyDate].
extension KeyDatePatterns on KeyDate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KeyDate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KeyDate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KeyDate value)  $default,){
final _that = this;
switch (_that) {
case _KeyDate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KeyDate value)?  $default,){
final _that = this;
switch (_that) {
case _KeyDate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( KeyDateKind kind,  String label,  DateTime date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KeyDate() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( KeyDateKind kind,  String label,  DateTime date)  $default,) {final _that = this;
switch (_that) {
case _KeyDate():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( KeyDateKind kind,  String label,  DateTime date)?  $default,) {final _that = this;
switch (_that) {
case _KeyDate() when $default != null:
return $default(_that.kind,_that.label,_that.date);case _:
  return null;

}
}

}

/// @nodoc


class _KeyDate implements KeyDate {
  const _KeyDate({required this.kind, required this.label, required this.date});
  

@override final  KeyDateKind kind;
/// As the brand worded it, e.g. "Scripts due", "Event day".
@override final  String label;
@override final  DateTime date;

/// Create a copy of KeyDate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KeyDateCopyWith<_KeyDate> get copyWith => __$KeyDateCopyWithImpl<_KeyDate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KeyDate&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.label, label) || other.label == label)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,kind,label,date);

@override
String toString() {
  return 'KeyDate(kind: $kind, label: $label, date: $date)';
}


}

/// @nodoc
abstract mixin class _$KeyDateCopyWith<$Res> implements $KeyDateCopyWith<$Res> {
  factory _$KeyDateCopyWith(_KeyDate value, $Res Function(_KeyDate) _then) = __$KeyDateCopyWithImpl;
@override @useResult
$Res call({
 KeyDateKind kind, String label, DateTime date
});




}
/// @nodoc
class __$KeyDateCopyWithImpl<$Res>
    implements _$KeyDateCopyWith<$Res> {
  __$KeyDateCopyWithImpl(this._self, this._then);

  final _KeyDate _self;
  final $Res Function(_KeyDate) _then;

/// Create a copy of KeyDate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? label = null,Object? date = null,}) {
  return _then(_KeyDate(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as KeyDateKind,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$Brand {

 String get id; String get name;/// Social handle creators tag, e.g. "@glowhaus".
 String get handle;/// "Brand value" bars on the campaign page, 1–5.
 int get value; String? get logoUrl;
/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrandCopyWith<Brand> get copyWith => _$BrandCopyWithImpl<Brand>(this as Brand, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Brand&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.value, value) || other.value == value)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,handle,value,logoUrl);

@override
String toString() {
  return 'Brand(id: $id, name: $name, handle: $handle, value: $value, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class $BrandCopyWith<$Res>  {
  factory $BrandCopyWith(Brand value, $Res Function(Brand) _then) = _$BrandCopyWithImpl;
@useResult
$Res call({
 String id, String name, String handle, int value, String? logoUrl
});




}
/// @nodoc
class _$BrandCopyWithImpl<$Res>
    implements $BrandCopyWith<$Res> {
  _$BrandCopyWithImpl(this._self, this._then);

  final Brand _self;
  final $Res Function(Brand) _then;

/// Create a copy of Brand
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


/// Adds pattern-matching-related methods to [Brand].
extension BrandPatterns on Brand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Brand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Brand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Brand value)  $default,){
final _that = this;
switch (_that) {
case _Brand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Brand value)?  $default,){
final _that = this;
switch (_that) {
case _Brand() when $default != null:
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
case _Brand() when $default != null:
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
case _Brand():
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
case _Brand() when $default != null:
return $default(_that.id,_that.name,_that.handle,_that.value,_that.logoUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Brand extends Brand {
  const _Brand({required this.id, required this.name, required this.handle, this.value = 4, this.logoUrl}): super._();
  

@override final  String id;
@override final  String name;
/// Social handle creators tag, e.g. "@glowhaus".
@override final  String handle;
/// "Brand value" bars on the campaign page, 1–5.
@override@JsonKey() final  int value;
@override final  String? logoUrl;

/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrandCopyWith<_Brand> get copyWith => __$BrandCopyWithImpl<_Brand>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Brand&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.handle, handle) || other.handle == handle)&&(identical(other.value, value) || other.value == value)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,handle,value,logoUrl);

@override
String toString() {
  return 'Brand(id: $id, name: $name, handle: $handle, value: $value, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class _$BrandCopyWith<$Res> implements $BrandCopyWith<$Res> {
  factory _$BrandCopyWith(_Brand value, $Res Function(_Brand) _then) = __$BrandCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String handle, int value, String? logoUrl
});




}
/// @nodoc
class __$BrandCopyWithImpl<$Res>
    implements _$BrandCopyWith<$Res> {
  __$BrandCopyWithImpl(this._self, this._then);

  final _Brand _self;
  final $Res Function(_Brand) _then;

/// Create a copy of Brand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? handle = null,Object? value = null,Object? logoUrl = freezed,}) {
  return _then(_Brand(
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
mixin _$Campaign {

 String get id; CampaignType get type; Brand get brand; String get title;/// e.g. "Beauty", "Music".
 String get category;/// Extra card meta, e.g. "Sat 22 Nov · Downtown", "4 branches".
 String? get meta;/// Display value: "AED 220", "30% off".
 String get worth; int get spotsLeft; int get spotsTotal;/// Credits held when applying.
 int get credits;/// Full "YOU GET" paragraph on the detail page.
 String get youGet;/// One-liner for the home card, e.g. "Full kit to keep, worth AED 220".
 String get youGetShort;/// One-liner for the home card, e.g. "Script + 1 Reel + 1 Story".
 String get contentShort; List<String> get criteria;/// Script brief; null when there is no script (drops).
 String? get brief;/// "Who can apply" chips.
 List<String> get eligibility;/// "What to deliver".
 List<String> get deliverables;/// Brand materials creators can download (file names for now).
 List<String> get materials;/// The brand may reuse approved content in its own channels and ads.
 bool get contentReuse; List<KeyDate> get timeline; List<String> get howItWorks;/// Checkbox text on the apply screen.
 String get agreement;/// Text on the "Applied!" screen.
 String get afterApply; String get country;/// False once the campaign is closed or full; hidden from Home.
 bool get isOpen; String? get photoUrl;
/// Create a copy of Campaign
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampaignCopyWith<Campaign> get copyWith => _$CampaignCopyWithImpl<Campaign>(this as Campaign, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Campaign&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.worth, worth) || other.worth == worth)&&(identical(other.spotsLeft, spotsLeft) || other.spotsLeft == spotsLeft)&&(identical(other.spotsTotal, spotsTotal) || other.spotsTotal == spotsTotal)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.youGet, youGet) || other.youGet == youGet)&&(identical(other.youGetShort, youGetShort) || other.youGetShort == youGetShort)&&(identical(other.contentShort, contentShort) || other.contentShort == contentShort)&&const DeepCollectionEquality().equals(other.criteria, criteria)&&(identical(other.brief, brief) || other.brief == brief)&&const DeepCollectionEquality().equals(other.eligibility, eligibility)&&const DeepCollectionEquality().equals(other.deliverables, deliverables)&&const DeepCollectionEquality().equals(other.materials, materials)&&(identical(other.contentReuse, contentReuse) || other.contentReuse == contentReuse)&&const DeepCollectionEquality().equals(other.timeline, timeline)&&const DeepCollectionEquality().equals(other.howItWorks, howItWorks)&&(identical(other.agreement, agreement) || other.agreement == agreement)&&(identical(other.afterApply, afterApply) || other.afterApply == afterApply)&&(identical(other.country, country) || other.country == country)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,type,brand,title,category,meta,worth,spotsLeft,spotsTotal,credits,youGet,youGetShort,contentShort,const DeepCollectionEquality().hash(criteria),brief,const DeepCollectionEquality().hash(eligibility),const DeepCollectionEquality().hash(deliverables),const DeepCollectionEquality().hash(materials),contentReuse,const DeepCollectionEquality().hash(timeline),const DeepCollectionEquality().hash(howItWorks),agreement,afterApply,country,isOpen,photoUrl]);

@override
String toString() {
  return 'Campaign(id: $id, type: $type, brand: $brand, title: $title, category: $category, meta: $meta, worth: $worth, spotsLeft: $spotsLeft, spotsTotal: $spotsTotal, credits: $credits, youGet: $youGet, youGetShort: $youGetShort, contentShort: $contentShort, criteria: $criteria, brief: $brief, eligibility: $eligibility, deliverables: $deliverables, materials: $materials, contentReuse: $contentReuse, timeline: $timeline, howItWorks: $howItWorks, agreement: $agreement, afterApply: $afterApply, country: $country, isOpen: $isOpen, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class $CampaignCopyWith<$Res>  {
  factory $CampaignCopyWith(Campaign value, $Res Function(Campaign) _then) = _$CampaignCopyWithImpl;
@useResult
$Res call({
 String id, CampaignType type, Brand brand, String title, String category, String? meta, String worth, int spotsLeft, int spotsTotal, int credits, String youGet, String youGetShort, String contentShort, List<String> criteria, String? brief, List<String> eligibility, List<String> deliverables, List<String> materials, bool contentReuse, List<KeyDate> timeline, List<String> howItWorks, String agreement, String afterApply, String country, bool isOpen, String? photoUrl
});


$BrandCopyWith<$Res> get brand;

}
/// @nodoc
class _$CampaignCopyWithImpl<$Res>
    implements $CampaignCopyWith<$Res> {
  _$CampaignCopyWithImpl(this._self, this._then);

  final Campaign _self;
  final $Res Function(Campaign) _then;

/// Create a copy of Campaign
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? brand = null,Object? title = null,Object? category = null,Object? meta = freezed,Object? worth = null,Object? spotsLeft = null,Object? spotsTotal = null,Object? credits = null,Object? youGet = null,Object? youGetShort = null,Object? contentShort = null,Object? criteria = null,Object? brief = freezed,Object? eligibility = null,Object? deliverables = null,Object? materials = null,Object? contentReuse = null,Object? timeline = null,Object? howItWorks = null,Object? agreement = null,Object? afterApply = null,Object? country = null,Object? isOpen = null,Object? photoUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CampaignType,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Brand,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
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
as List<KeyDate>,howItWorks: null == howItWorks ? _self.howItWorks : howItWorks // ignore: cast_nullable_to_non_nullable
as List<String>,agreement: null == agreement ? _self.agreement : agreement // ignore: cast_nullable_to_non_nullable
as String,afterApply: null == afterApply ? _self.afterApply : afterApply // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Campaign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandCopyWith<$Res> get brand {
  
  return $BrandCopyWith<$Res>(_self.brand, (value) {
    return _then(_self.copyWith(brand: value));
  });
}
}


/// Adds pattern-matching-related methods to [Campaign].
extension CampaignPatterns on Campaign {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Campaign value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Campaign() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Campaign value)  $default,){
final _that = this;
switch (_that) {
case _Campaign():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Campaign value)?  $default,){
final _that = this;
switch (_that) {
case _Campaign() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  CampaignType type,  Brand brand,  String title,  String category,  String? meta,  String worth,  int spotsLeft,  int spotsTotal,  int credits,  String youGet,  String youGetShort,  String contentShort,  List<String> criteria,  String? brief,  List<String> eligibility,  List<String> deliverables,  List<String> materials,  bool contentReuse,  List<KeyDate> timeline,  List<String> howItWorks,  String agreement,  String afterApply,  String country,  bool isOpen,  String? photoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Campaign() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  CampaignType type,  Brand brand,  String title,  String category,  String? meta,  String worth,  int spotsLeft,  int spotsTotal,  int credits,  String youGet,  String youGetShort,  String contentShort,  List<String> criteria,  String? brief,  List<String> eligibility,  List<String> deliverables,  List<String> materials,  bool contentReuse,  List<KeyDate> timeline,  List<String> howItWorks,  String agreement,  String afterApply,  String country,  bool isOpen,  String? photoUrl)  $default,) {final _that = this;
switch (_that) {
case _Campaign():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  CampaignType type,  Brand brand,  String title,  String category,  String? meta,  String worth,  int spotsLeft,  int spotsTotal,  int credits,  String youGet,  String youGetShort,  String contentShort,  List<String> criteria,  String? brief,  List<String> eligibility,  List<String> deliverables,  List<String> materials,  bool contentReuse,  List<KeyDate> timeline,  List<String> howItWorks,  String agreement,  String afterApply,  String country,  bool isOpen,  String? photoUrl)?  $default,) {final _that = this;
switch (_that) {
case _Campaign() when $default != null:
return $default(_that.id,_that.type,_that.brand,_that.title,_that.category,_that.meta,_that.worth,_that.spotsLeft,_that.spotsTotal,_that.credits,_that.youGet,_that.youGetShort,_that.contentShort,_that.criteria,_that.brief,_that.eligibility,_that.deliverables,_that.materials,_that.contentReuse,_that.timeline,_that.howItWorks,_that.agreement,_that.afterApply,_that.country,_that.isOpen,_that.photoUrl);case _:
  return null;

}
}

}

/// @nodoc


class _Campaign extends Campaign {
  const _Campaign({required this.id, required this.type, required this.brand, required this.title, required this.category, this.meta, required this.worth, required this.spotsLeft, required this.spotsTotal, required this.credits, required this.youGet, required this.youGetShort, required this.contentShort, required final  List<String> criteria, this.brief, required final  List<String> eligibility, required final  List<String> deliverables, final  List<String> materials = const [], this.contentReuse = false, required final  List<KeyDate> timeline, required final  List<String> howItWorks, required this.agreement, required this.afterApply, this.country = 'UAE', this.isOpen = true, this.photoUrl}): _criteria = criteria,_eligibility = eligibility,_deliverables = deliverables,_materials = materials,_timeline = timeline,_howItWorks = howItWorks,super._();
  

@override final  String id;
@override final  CampaignType type;
@override final  Brand brand;
@override final  String title;
/// e.g. "Beauty", "Music".
@override final  String category;
/// Extra card meta, e.g. "Sat 22 Nov · Downtown", "4 branches".
@override final  String? meta;
/// Display value: "AED 220", "30% off".
@override final  String worth;
@override final  int spotsLeft;
@override final  int spotsTotal;
/// Credits held when applying.
@override final  int credits;
/// Full "YOU GET" paragraph on the detail page.
@override final  String youGet;
/// One-liner for the home card, e.g. "Full kit to keep, worth AED 220".
@override final  String youGetShort;
/// One-liner for the home card, e.g. "Script + 1 Reel + 1 Story".
@override final  String contentShort;
 final  List<String> _criteria;
@override List<String> get criteria {
  if (_criteria is EqualUnmodifiableListView) return _criteria;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_criteria);
}

/// Script brief; null when there is no script (drops).
@override final  String? brief;
/// "Who can apply" chips.
 final  List<String> _eligibility;
/// "Who can apply" chips.
@override List<String> get eligibility {
  if (_eligibility is EqualUnmodifiableListView) return _eligibility;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eligibility);
}

/// "What to deliver".
 final  List<String> _deliverables;
/// "What to deliver".
@override List<String> get deliverables {
  if (_deliverables is EqualUnmodifiableListView) return _deliverables;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deliverables);
}

/// Brand materials creators can download (file names for now).
 final  List<String> _materials;
/// Brand materials creators can download (file names for now).
@override@JsonKey() List<String> get materials {
  if (_materials is EqualUnmodifiableListView) return _materials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_materials);
}

/// The brand may reuse approved content in its own channels and ads.
@override@JsonKey() final  bool contentReuse;
 final  List<KeyDate> _timeline;
@override List<KeyDate> get timeline {
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeline);
}

 final  List<String> _howItWorks;
@override List<String> get howItWorks {
  if (_howItWorks is EqualUnmodifiableListView) return _howItWorks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_howItWorks);
}

/// Checkbox text on the apply screen.
@override final  String agreement;
/// Text on the "Applied!" screen.
@override final  String afterApply;
@override@JsonKey() final  String country;
/// False once the campaign is closed or full; hidden from Home.
@override@JsonKey() final  bool isOpen;
@override final  String? photoUrl;

/// Create a copy of Campaign
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampaignCopyWith<_Campaign> get copyWith => __$CampaignCopyWithImpl<_Campaign>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Campaign&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.worth, worth) || other.worth == worth)&&(identical(other.spotsLeft, spotsLeft) || other.spotsLeft == spotsLeft)&&(identical(other.spotsTotal, spotsTotal) || other.spotsTotal == spotsTotal)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.youGet, youGet) || other.youGet == youGet)&&(identical(other.youGetShort, youGetShort) || other.youGetShort == youGetShort)&&(identical(other.contentShort, contentShort) || other.contentShort == contentShort)&&const DeepCollectionEquality().equals(other._criteria, _criteria)&&(identical(other.brief, brief) || other.brief == brief)&&const DeepCollectionEquality().equals(other._eligibility, _eligibility)&&const DeepCollectionEquality().equals(other._deliverables, _deliverables)&&const DeepCollectionEquality().equals(other._materials, _materials)&&(identical(other.contentReuse, contentReuse) || other.contentReuse == contentReuse)&&const DeepCollectionEquality().equals(other._timeline, _timeline)&&const DeepCollectionEquality().equals(other._howItWorks, _howItWorks)&&(identical(other.agreement, agreement) || other.agreement == agreement)&&(identical(other.afterApply, afterApply) || other.afterApply == afterApply)&&(identical(other.country, country) || other.country == country)&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,type,brand,title,category,meta,worth,spotsLeft,spotsTotal,credits,youGet,youGetShort,contentShort,const DeepCollectionEquality().hash(_criteria),brief,const DeepCollectionEquality().hash(_eligibility),const DeepCollectionEquality().hash(_deliverables),const DeepCollectionEquality().hash(_materials),contentReuse,const DeepCollectionEquality().hash(_timeline),const DeepCollectionEquality().hash(_howItWorks),agreement,afterApply,country,isOpen,photoUrl]);

@override
String toString() {
  return 'Campaign(id: $id, type: $type, brand: $brand, title: $title, category: $category, meta: $meta, worth: $worth, spotsLeft: $spotsLeft, spotsTotal: $spotsTotal, credits: $credits, youGet: $youGet, youGetShort: $youGetShort, contentShort: $contentShort, criteria: $criteria, brief: $brief, eligibility: $eligibility, deliverables: $deliverables, materials: $materials, contentReuse: $contentReuse, timeline: $timeline, howItWorks: $howItWorks, agreement: $agreement, afterApply: $afterApply, country: $country, isOpen: $isOpen, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class _$CampaignCopyWith<$Res> implements $CampaignCopyWith<$Res> {
  factory _$CampaignCopyWith(_Campaign value, $Res Function(_Campaign) _then) = __$CampaignCopyWithImpl;
@override @useResult
$Res call({
 String id, CampaignType type, Brand brand, String title, String category, String? meta, String worth, int spotsLeft, int spotsTotal, int credits, String youGet, String youGetShort, String contentShort, List<String> criteria, String? brief, List<String> eligibility, List<String> deliverables, List<String> materials, bool contentReuse, List<KeyDate> timeline, List<String> howItWorks, String agreement, String afterApply, String country, bool isOpen, String? photoUrl
});


@override $BrandCopyWith<$Res> get brand;

}
/// @nodoc
class __$CampaignCopyWithImpl<$Res>
    implements _$CampaignCopyWith<$Res> {
  __$CampaignCopyWithImpl(this._self, this._then);

  final _Campaign _self;
  final $Res Function(_Campaign) _then;

/// Create a copy of Campaign
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? brand = null,Object? title = null,Object? category = null,Object? meta = freezed,Object? worth = null,Object? spotsLeft = null,Object? spotsTotal = null,Object? credits = null,Object? youGet = null,Object? youGetShort = null,Object? contentShort = null,Object? criteria = null,Object? brief = freezed,Object? eligibility = null,Object? deliverables = null,Object? materials = null,Object? contentReuse = null,Object? timeline = null,Object? howItWorks = null,Object? agreement = null,Object? afterApply = null,Object? country = null,Object? isOpen = null,Object? photoUrl = freezed,}) {
  return _then(_Campaign(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CampaignType,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as Brand,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
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
as List<KeyDate>,howItWorks: null == howItWorks ? _self._howItWorks : howItWorks // ignore: cast_nullable_to_non_nullable
as List<String>,agreement: null == agreement ? _self.agreement : agreement // ignore: cast_nullable_to_non_nullable
as String,afterApply: null == afterApply ? _self.afterApply : afterApply // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Campaign
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BrandCopyWith<$Res> get brand {
  
  return $BrandCopyWith<$Res>(_self.brand, (value) {
    return _then(_self.copyWith(brand: value));
  });
}
}

// dart format on
