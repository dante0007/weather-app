// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'air_quality.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AirQuality {

 int get aqi; AirQualityCategory get category; String get dominantPollutant;
/// Create a copy of AirQuality
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AirQualityCopyWith<AirQuality> get copyWith => _$AirQualityCopyWithImpl<AirQuality>(this as AirQuality, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AirQuality&&(identical(other.aqi, aqi) || other.aqi == aqi)&&(identical(other.category, category) || other.category == category)&&(identical(other.dominantPollutant, dominantPollutant) || other.dominantPollutant == dominantPollutant));
}


@override
int get hashCode => Object.hash(runtimeType,aqi,category,dominantPollutant);

@override
String toString() {
  return 'AirQuality(aqi: $aqi, category: $category, dominantPollutant: $dominantPollutant)';
}


}

/// @nodoc
abstract mixin class $AirQualityCopyWith<$Res>  {
  factory $AirQualityCopyWith(AirQuality value, $Res Function(AirQuality) _then) = _$AirQualityCopyWithImpl;
@useResult
$Res call({
 int aqi, AirQualityCategory category, String dominantPollutant
});




}
/// @nodoc
class _$AirQualityCopyWithImpl<$Res>
    implements $AirQualityCopyWith<$Res> {
  _$AirQualityCopyWithImpl(this._self, this._then);

  final AirQuality _self;
  final $Res Function(AirQuality) _then;

/// Create a copy of AirQuality
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aqi = null,Object? category = null,Object? dominantPollutant = null,}) {
  return _then(_self.copyWith(
aqi: null == aqi ? _self.aqi : aqi // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AirQualityCategory,dominantPollutant: null == dominantPollutant ? _self.dominantPollutant : dominantPollutant // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AirQuality].
extension AirQualityPatterns on AirQuality {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AirQuality value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AirQuality() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AirQuality value)  $default,){
final _that = this;
switch (_that) {
case _AirQuality():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AirQuality value)?  $default,){
final _that = this;
switch (_that) {
case _AirQuality() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int aqi,  AirQualityCategory category,  String dominantPollutant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AirQuality() when $default != null:
return $default(_that.aqi,_that.category,_that.dominantPollutant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int aqi,  AirQualityCategory category,  String dominantPollutant)  $default,) {final _that = this;
switch (_that) {
case _AirQuality():
return $default(_that.aqi,_that.category,_that.dominantPollutant);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int aqi,  AirQualityCategory category,  String dominantPollutant)?  $default,) {final _that = this;
switch (_that) {
case _AirQuality() when $default != null:
return $default(_that.aqi,_that.category,_that.dominantPollutant);case _:
  return null;

}
}

}

/// @nodoc


class _AirQuality implements AirQuality {
  const _AirQuality({required this.aqi, required this.category, required this.dominantPollutant});
  

@override final  int aqi;
@override final  AirQualityCategory category;
@override final  String dominantPollutant;

/// Create a copy of AirQuality
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AirQualityCopyWith<_AirQuality> get copyWith => __$AirQualityCopyWithImpl<_AirQuality>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AirQuality&&(identical(other.aqi, aqi) || other.aqi == aqi)&&(identical(other.category, category) || other.category == category)&&(identical(other.dominantPollutant, dominantPollutant) || other.dominantPollutant == dominantPollutant));
}


@override
int get hashCode => Object.hash(runtimeType,aqi,category,dominantPollutant);

@override
String toString() {
  return 'AirQuality(aqi: $aqi, category: $category, dominantPollutant: $dominantPollutant)';
}


}

/// @nodoc
abstract mixin class _$AirQualityCopyWith<$Res> implements $AirQualityCopyWith<$Res> {
  factory _$AirQualityCopyWith(_AirQuality value, $Res Function(_AirQuality) _then) = __$AirQualityCopyWithImpl;
@override @useResult
$Res call({
 int aqi, AirQualityCategory category, String dominantPollutant
});




}
/// @nodoc
class __$AirQualityCopyWithImpl<$Res>
    implements _$AirQualityCopyWith<$Res> {
  __$AirQualityCopyWithImpl(this._self, this._then);

  final _AirQuality _self;
  final $Res Function(_AirQuality) _then;

/// Create a copy of AirQuality
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aqi = null,Object? category = null,Object? dominantPollutant = null,}) {
  return _then(_AirQuality(
aqi: null == aqi ? _self.aqi : aqi // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as AirQualityCategory,dominantPollutant: null == dominantPollutant ? _self.dominantPollutant : dominantPollutant // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
