// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherEvent()';
}


}

/// @nodoc
class $WeatherEventCopyWith<$Res>  {
$WeatherEventCopyWith(WeatherEvent _, $Res Function(WeatherEvent) __);
}


/// Adds pattern-matching-related methods to [WeatherEvent].
extension WeatherEventPatterns on WeatherEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WeatherLoadRequested value)?  loadRequested,TResult Function( WeatherCityChanged value)?  cityChanged,TResult Function( WeatherRefreshRequested value)?  refreshRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WeatherLoadRequested() when loadRequested != null:
return loadRequested(_that);case WeatherCityChanged() when cityChanged != null:
return cityChanged(_that);case WeatherRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WeatherLoadRequested value)  loadRequested,required TResult Function( WeatherCityChanged value)  cityChanged,required TResult Function( WeatherRefreshRequested value)  refreshRequested,}){
final _that = this;
switch (_that) {
case WeatherLoadRequested():
return loadRequested(_that);case WeatherCityChanged():
return cityChanged(_that);case WeatherRefreshRequested():
return refreshRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WeatherLoadRequested value)?  loadRequested,TResult? Function( WeatherCityChanged value)?  cityChanged,TResult? Function( WeatherRefreshRequested value)?  refreshRequested,}){
final _that = this;
switch (_that) {
case WeatherLoadRequested() when loadRequested != null:
return loadRequested(_that);case WeatherCityChanged() when cityChanged != null:
return cityChanged(_that);case WeatherRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( double lat,  double lon,  String cityName)?  loadRequested,TResult Function( GeoCity city)?  cityChanged,TResult Function()?  refreshRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WeatherLoadRequested() when loadRequested != null:
return loadRequested(_that.lat,_that.lon,_that.cityName);case WeatherCityChanged() when cityChanged != null:
return cityChanged(_that.city);case WeatherRefreshRequested() when refreshRequested != null:
return refreshRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( double lat,  double lon,  String cityName)  loadRequested,required TResult Function( GeoCity city)  cityChanged,required TResult Function()  refreshRequested,}) {final _that = this;
switch (_that) {
case WeatherLoadRequested():
return loadRequested(_that.lat,_that.lon,_that.cityName);case WeatherCityChanged():
return cityChanged(_that.city);case WeatherRefreshRequested():
return refreshRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( double lat,  double lon,  String cityName)?  loadRequested,TResult? Function( GeoCity city)?  cityChanged,TResult? Function()?  refreshRequested,}) {final _that = this;
switch (_that) {
case WeatherLoadRequested() when loadRequested != null:
return loadRequested(_that.lat,_that.lon,_that.cityName);case WeatherCityChanged() when cityChanged != null:
return cityChanged(_that.city);case WeatherRefreshRequested() when refreshRequested != null:
return refreshRequested();case _:
  return null;

}
}

}

/// @nodoc


class WeatherLoadRequested implements WeatherEvent {
  const WeatherLoadRequested({required this.lat, required this.lon, required this.cityName});
  

 final  double lat;
 final  double lon;
 final  String cityName;

/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherLoadRequestedCopyWith<WeatherLoadRequested> get copyWith => _$WeatherLoadRequestedCopyWithImpl<WeatherLoadRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherLoadRequested&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.cityName, cityName) || other.cityName == cityName));
}


@override
int get hashCode => Object.hash(runtimeType,lat,lon,cityName);

@override
String toString() {
  return 'WeatherEvent.loadRequested(lat: $lat, lon: $lon, cityName: $cityName)';
}


}

/// @nodoc
abstract mixin class $WeatherLoadRequestedCopyWith<$Res> implements $WeatherEventCopyWith<$Res> {
  factory $WeatherLoadRequestedCopyWith(WeatherLoadRequested value, $Res Function(WeatherLoadRequested) _then) = _$WeatherLoadRequestedCopyWithImpl;
@useResult
$Res call({
 double lat, double lon, String cityName
});




}
/// @nodoc
class _$WeatherLoadRequestedCopyWithImpl<$Res>
    implements $WeatherLoadRequestedCopyWith<$Res> {
  _$WeatherLoadRequestedCopyWithImpl(this._self, this._then);

  final WeatherLoadRequested _self;
  final $Res Function(WeatherLoadRequested) _then;

/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lon = null,Object? cityName = null,}) {
  return _then(WeatherLoadRequested(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lon: null == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WeatherCityChanged implements WeatherEvent {
  const WeatherCityChanged(this.city);
  

 final  GeoCity city;

/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherCityChangedCopyWith<WeatherCityChanged> get copyWith => _$WeatherCityChangedCopyWithImpl<WeatherCityChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherCityChanged&&(identical(other.city, city) || other.city == city));
}


@override
int get hashCode => Object.hash(runtimeType,city);

@override
String toString() {
  return 'WeatherEvent.cityChanged(city: $city)';
}


}

/// @nodoc
abstract mixin class $WeatherCityChangedCopyWith<$Res> implements $WeatherEventCopyWith<$Res> {
  factory $WeatherCityChangedCopyWith(WeatherCityChanged value, $Res Function(WeatherCityChanged) _then) = _$WeatherCityChangedCopyWithImpl;
@useResult
$Res call({
 GeoCity city
});


$GeoCityCopyWith<$Res> get city;

}
/// @nodoc
class _$WeatherCityChangedCopyWithImpl<$Res>
    implements $WeatherCityChangedCopyWith<$Res> {
  _$WeatherCityChangedCopyWithImpl(this._self, this._then);

  final WeatherCityChanged _self;
  final $Res Function(WeatherCityChanged) _then;

/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? city = null,}) {
  return _then(WeatherCityChanged(
null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as GeoCity,
  ));
}

/// Create a copy of WeatherEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoCityCopyWith<$Res> get city {
  
  return $GeoCityCopyWith<$Res>(_self.city, (value) {
    return _then(_self.copyWith(city: value));
  });
}
}

/// @nodoc


class WeatherRefreshRequested implements WeatherEvent {
  const WeatherRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeatherEvent.refreshRequested()';
}


}




// dart format on
