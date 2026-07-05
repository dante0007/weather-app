// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CurrentWeather {

 double get temperature; double get feelsLike; WeatherCondition get condition; int get humidity; double get precipitationProbability; double get windSpeed; int get windDirection; double get uvIndex; bool get isDay;
/// Create a copy of CurrentWeather
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentWeatherCopyWith<CurrentWeather> get copyWith => _$CurrentWeatherCopyWithImpl<CurrentWeather>(this as CurrentWeather, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentWeather&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.precipitationProbability, precipitationProbability) || other.precipitationProbability == precipitationProbability)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.windDirection, windDirection) || other.windDirection == windDirection)&&(identical(other.uvIndex, uvIndex) || other.uvIndex == uvIndex)&&(identical(other.isDay, isDay) || other.isDay == isDay));
}


@override
int get hashCode => Object.hash(runtimeType,temperature,feelsLike,condition,humidity,precipitationProbability,windSpeed,windDirection,uvIndex,isDay);

@override
String toString() {
  return 'CurrentWeather(temperature: $temperature, feelsLike: $feelsLike, condition: $condition, humidity: $humidity, precipitationProbability: $precipitationProbability, windSpeed: $windSpeed, windDirection: $windDirection, uvIndex: $uvIndex, isDay: $isDay)';
}


}

/// @nodoc
abstract mixin class $CurrentWeatherCopyWith<$Res>  {
  factory $CurrentWeatherCopyWith(CurrentWeather value, $Res Function(CurrentWeather) _then) = _$CurrentWeatherCopyWithImpl;
@useResult
$Res call({
 double temperature, double feelsLike, WeatherCondition condition, int humidity, double precipitationProbability, double windSpeed, int windDirection, double uvIndex, bool isDay
});


$WeatherConditionCopyWith<$Res> get condition;

}
/// @nodoc
class _$CurrentWeatherCopyWithImpl<$Res>
    implements $CurrentWeatherCopyWith<$Res> {
  _$CurrentWeatherCopyWithImpl(this._self, this._then);

  final CurrentWeather _self;
  final $Res Function(CurrentWeather) _then;

/// Create a copy of CurrentWeather
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temperature = null,Object? feelsLike = null,Object? condition = null,Object? humidity = null,Object? precipitationProbability = null,Object? windSpeed = null,Object? windDirection = null,Object? uvIndex = null,Object? isDay = null,}) {
  return _then(_self.copyWith(
temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as WeatherCondition,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,precipitationProbability: null == precipitationProbability ? _self.precipitationProbability : precipitationProbability // ignore: cast_nullable_to_non_nullable
as double,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,windDirection: null == windDirection ? _self.windDirection : windDirection // ignore: cast_nullable_to_non_nullable
as int,uvIndex: null == uvIndex ? _self.uvIndex : uvIndex // ignore: cast_nullable_to_non_nullable
as double,isDay: null == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CurrentWeather
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherConditionCopyWith<$Res> get condition {
  
  return $WeatherConditionCopyWith<$Res>(_self.condition, (value) {
    return _then(_self.copyWith(condition: value));
  });
}
}


/// Adds pattern-matching-related methods to [CurrentWeather].
extension CurrentWeatherPatterns on CurrentWeather {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentWeather value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentWeather() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentWeather value)  $default,){
final _that = this;
switch (_that) {
case _CurrentWeather():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentWeather value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentWeather() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double temperature,  double feelsLike,  WeatherCondition condition,  int humidity,  double precipitationProbability,  double windSpeed,  int windDirection,  double uvIndex,  bool isDay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentWeather() when $default != null:
return $default(_that.temperature,_that.feelsLike,_that.condition,_that.humidity,_that.precipitationProbability,_that.windSpeed,_that.windDirection,_that.uvIndex,_that.isDay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double temperature,  double feelsLike,  WeatherCondition condition,  int humidity,  double precipitationProbability,  double windSpeed,  int windDirection,  double uvIndex,  bool isDay)  $default,) {final _that = this;
switch (_that) {
case _CurrentWeather():
return $default(_that.temperature,_that.feelsLike,_that.condition,_that.humidity,_that.precipitationProbability,_that.windSpeed,_that.windDirection,_that.uvIndex,_that.isDay);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double temperature,  double feelsLike,  WeatherCondition condition,  int humidity,  double precipitationProbability,  double windSpeed,  int windDirection,  double uvIndex,  bool isDay)?  $default,) {final _that = this;
switch (_that) {
case _CurrentWeather() when $default != null:
return $default(_that.temperature,_that.feelsLike,_that.condition,_that.humidity,_that.precipitationProbability,_that.windSpeed,_that.windDirection,_that.uvIndex,_that.isDay);case _:
  return null;

}
}

}

/// @nodoc


class _CurrentWeather implements CurrentWeather {
  const _CurrentWeather({required this.temperature, required this.feelsLike, required this.condition, required this.humidity, required this.precipitationProbability, required this.windSpeed, required this.windDirection, required this.uvIndex, required this.isDay});
  

@override final  double temperature;
@override final  double feelsLike;
@override final  WeatherCondition condition;
@override final  int humidity;
@override final  double precipitationProbability;
@override final  double windSpeed;
@override final  int windDirection;
@override final  double uvIndex;
@override final  bool isDay;

/// Create a copy of CurrentWeather
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentWeatherCopyWith<_CurrentWeather> get copyWith => __$CurrentWeatherCopyWithImpl<_CurrentWeather>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentWeather&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.precipitationProbability, precipitationProbability) || other.precipitationProbability == precipitationProbability)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.windDirection, windDirection) || other.windDirection == windDirection)&&(identical(other.uvIndex, uvIndex) || other.uvIndex == uvIndex)&&(identical(other.isDay, isDay) || other.isDay == isDay));
}


@override
int get hashCode => Object.hash(runtimeType,temperature,feelsLike,condition,humidity,precipitationProbability,windSpeed,windDirection,uvIndex,isDay);

@override
String toString() {
  return 'CurrentWeather(temperature: $temperature, feelsLike: $feelsLike, condition: $condition, humidity: $humidity, precipitationProbability: $precipitationProbability, windSpeed: $windSpeed, windDirection: $windDirection, uvIndex: $uvIndex, isDay: $isDay)';
}


}

/// @nodoc
abstract mixin class _$CurrentWeatherCopyWith<$Res> implements $CurrentWeatherCopyWith<$Res> {
  factory _$CurrentWeatherCopyWith(_CurrentWeather value, $Res Function(_CurrentWeather) _then) = __$CurrentWeatherCopyWithImpl;
@override @useResult
$Res call({
 double temperature, double feelsLike, WeatherCondition condition, int humidity, double precipitationProbability, double windSpeed, int windDirection, double uvIndex, bool isDay
});


@override $WeatherConditionCopyWith<$Res> get condition;

}
/// @nodoc
class __$CurrentWeatherCopyWithImpl<$Res>
    implements _$CurrentWeatherCopyWith<$Res> {
  __$CurrentWeatherCopyWithImpl(this._self, this._then);

  final _CurrentWeather _self;
  final $Res Function(_CurrentWeather) _then;

/// Create a copy of CurrentWeather
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temperature = null,Object? feelsLike = null,Object? condition = null,Object? humidity = null,Object? precipitationProbability = null,Object? windSpeed = null,Object? windDirection = null,Object? uvIndex = null,Object? isDay = null,}) {
  return _then(_CurrentWeather(
temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,feelsLike: null == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as WeatherCondition,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,precipitationProbability: null == precipitationProbability ? _self.precipitationProbability : precipitationProbability // ignore: cast_nullable_to_non_nullable
as double,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,windDirection: null == windDirection ? _self.windDirection : windDirection // ignore: cast_nullable_to_non_nullable
as int,uvIndex: null == uvIndex ? _self.uvIndex : uvIndex // ignore: cast_nullable_to_non_nullable
as double,isDay: null == isDay ? _self.isDay : isDay // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CurrentWeather
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
