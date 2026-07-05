// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeoCity {

 String get name; String get country; double get lat; double get lon;
/// Create a copy of GeoCity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoCityCopyWith<GeoCity> get copyWith => _$GeoCityCopyWithImpl<GeoCity>(this as GeoCity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoCity&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}


@override
int get hashCode => Object.hash(runtimeType,name,country,lat,lon);

@override
String toString() {
  return 'GeoCity(name: $name, country: $country, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class $GeoCityCopyWith<$Res>  {
  factory $GeoCityCopyWith(GeoCity value, $Res Function(GeoCity) _then) = _$GeoCityCopyWithImpl;
@useResult
$Res call({
 String name, String country, double lat, double lon
});




}
/// @nodoc
class _$GeoCityCopyWithImpl<$Res>
    implements $GeoCityCopyWith<$Res> {
  _$GeoCityCopyWithImpl(this._self, this._then);

  final GeoCity _self;
  final $Res Function(GeoCity) _then;

/// Create a copy of GeoCity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? country = null,Object? lat = null,Object? lon = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GeoCity].
extension GeoCityPatterns on GeoCity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoCity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoCity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoCity value)  $default,){
final _that = this;
switch (_that) {
case _GeoCity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoCity value)?  $default,){
final _that = this;
switch (_that) {
case _GeoCity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String country,  double lat,  double lon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeoCity() when $default != null:
return $default(_that.name,_that.country,_that.lat,_that.lon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String country,  double lat,  double lon)  $default,) {final _that = this;
switch (_that) {
case _GeoCity():
return $default(_that.name,_that.country,_that.lat,_that.lon);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String country,  double lat,  double lon)?  $default,) {final _that = this;
switch (_that) {
case _GeoCity() when $default != null:
return $default(_that.name,_that.country,_that.lat,_that.lon);case _:
  return null;

}
}

}

/// @nodoc


class _GeoCity implements GeoCity {
  const _GeoCity({required this.name, required this.country, required this.lat, required this.lon});
  

@override final  String name;
@override final  String country;
@override final  double lat;
@override final  double lon;

/// Create a copy of GeoCity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoCityCopyWith<_GeoCity> get copyWith => __$GeoCityCopyWithImpl<_GeoCity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoCity&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon));
}


@override
int get hashCode => Object.hash(runtimeType,name,country,lat,lon);

@override
String toString() {
  return 'GeoCity(name: $name, country: $country, lat: $lat, lon: $lon)';
}


}

/// @nodoc
abstract mixin class _$GeoCityCopyWith<$Res> implements $GeoCityCopyWith<$Res> {
  factory _$GeoCityCopyWith(_GeoCity value, $Res Function(_GeoCity) _then) = __$GeoCityCopyWithImpl;
@override @useResult
$Res call({
 String name, String country, double lat, double lon
});




}
/// @nodoc
class __$GeoCityCopyWithImpl<$Res>
    implements _$GeoCityCopyWith<$Res> {
  __$GeoCityCopyWithImpl(this._self, this._then);

  final _GeoCity _self;
  final $Res Function(_GeoCity) _then;

/// Create a copy of GeoCity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? country = null,Object? lat = null,Object? lon = null,}) {
  return _then(_GeoCity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
