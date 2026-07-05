// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CityWeather {

 GeoCity get city; WeatherCondition get condition; double get temperature;
/// Create a copy of CityWeather
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CityWeatherCopyWith<CityWeather> get copyWith => _$CityWeatherCopyWithImpl<CityWeather>(this as CityWeather, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CityWeather&&(identical(other.city, city) || other.city == city)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.temperature, temperature) || other.temperature == temperature));
}


@override
int get hashCode => Object.hash(runtimeType,city,condition,temperature);

@override
String toString() {
  return 'CityWeather(city: $city, condition: $condition, temperature: $temperature)';
}


}

/// @nodoc
abstract mixin class $CityWeatherCopyWith<$Res>  {
  factory $CityWeatherCopyWith(CityWeather value, $Res Function(CityWeather) _then) = _$CityWeatherCopyWithImpl;
@useResult
$Res call({
 GeoCity city, WeatherCondition condition, double temperature
});


$GeoCityCopyWith<$Res> get city;$WeatherConditionCopyWith<$Res> get condition;

}
/// @nodoc
class _$CityWeatherCopyWithImpl<$Res>
    implements $CityWeatherCopyWith<$Res> {
  _$CityWeatherCopyWithImpl(this._self, this._then);

  final CityWeather _self;
  final $Res Function(CityWeather) _then;

/// Create a copy of CityWeather
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? city = null,Object? condition = null,Object? temperature = null,}) {
  return _then(_self.copyWith(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as GeoCity,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as WeatherCondition,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of CityWeather
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoCityCopyWith<$Res> get city {
  
  return $GeoCityCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}/// Create a copy of CityWeather
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherConditionCopyWith<$Res> get condition {
  
  return $WeatherConditionCopyWith<$Res>(_self.condition, (value) {
    return _then(_self.copyWith(condition: value));
  });
}
}


/// Adds pattern-matching-related methods to [CityWeather].
extension CityWeatherPatterns on CityWeather {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CityWeather value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CityWeather() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CityWeather value)  $default,){
final _that = this;
switch (_that) {
case _CityWeather():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CityWeather value)?  $default,){
final _that = this;
switch (_that) {
case _CityWeather() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GeoCity city,  WeatherCondition condition,  double temperature)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CityWeather() when $default != null:
return $default(_that.city,_that.condition,_that.temperature);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GeoCity city,  WeatherCondition condition,  double temperature)  $default,) {final _that = this;
switch (_that) {
case _CityWeather():
return $default(_that.city,_that.condition,_that.temperature);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GeoCity city,  WeatherCondition condition,  double temperature)?  $default,) {final _that = this;
switch (_that) {
case _CityWeather() when $default != null:
return $default(_that.city,_that.condition,_that.temperature);case _:
  return null;

}
}

}

/// @nodoc


class _CityWeather implements CityWeather {
  const _CityWeather({required this.city, required this.condition, required this.temperature});
  

@override final  GeoCity city;
@override final  WeatherCondition condition;
@override final  double temperature;

/// Create a copy of CityWeather
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CityWeatherCopyWith<_CityWeather> get copyWith => __$CityWeatherCopyWithImpl<_CityWeather>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CityWeather&&(identical(other.city, city) || other.city == city)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.temperature, temperature) || other.temperature == temperature));
}


@override
int get hashCode => Object.hash(runtimeType,city,condition,temperature);

@override
String toString() {
  return 'CityWeather(city: $city, condition: $condition, temperature: $temperature)';
}


}

/// @nodoc
abstract mixin class _$CityWeatherCopyWith<$Res> implements $CityWeatherCopyWith<$Res> {
  factory _$CityWeatherCopyWith(_CityWeather value, $Res Function(_CityWeather) _then) = __$CityWeatherCopyWithImpl;
@override @useResult
$Res call({
 GeoCity city, WeatherCondition condition, double temperature
});


@override $GeoCityCopyWith<$Res> get city;@override $WeatherConditionCopyWith<$Res> get condition;

}
/// @nodoc
class __$CityWeatherCopyWithImpl<$Res>
    implements _$CityWeatherCopyWith<$Res> {
  __$CityWeatherCopyWithImpl(this._self, this._then);

  final _CityWeather _self;
  final $Res Function(_CityWeather) _then;

/// Create a copy of CityWeather
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? city = null,Object? condition = null,Object? temperature = null,}) {
  return _then(_CityWeather(
city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as GeoCity,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as WeatherCondition,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of CityWeather
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoCityCopyWith<$Res> get city {
  
  return $GeoCityCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}/// Create a copy of CityWeather
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherConditionCopyWith<$Res> get condition {
  
  return $WeatherConditionCopyWith<$Res>(_self.condition, (value) {
    return _then(_self.copyWith(condition: value));
  });
}
}

// dart format on
