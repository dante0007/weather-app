// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hourly_forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HourSlot {

 DateTime get time; double get temperature; WeatherCondition get condition; double get precipitationProbability;
/// Create a copy of HourSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HourSlotCopyWith<HourSlot> get copyWith => _$HourSlotCopyWithImpl<HourSlot>(this as HourSlot, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HourSlot&&(identical(other.time, time) || other.time == time)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.precipitationProbability, precipitationProbability) || other.precipitationProbability == precipitationProbability));
}


@override
int get hashCode => Object.hash(runtimeType,time,temperature,condition,precipitationProbability);

@override
String toString() {
  return 'HourSlot(time: $time, temperature: $temperature, condition: $condition, precipitationProbability: $precipitationProbability)';
}


}

/// @nodoc
abstract mixin class $HourSlotCopyWith<$Res>  {
  factory $HourSlotCopyWith(HourSlot value, $Res Function(HourSlot) _then) = _$HourSlotCopyWithImpl;
@useResult
$Res call({
 DateTime time, double temperature, WeatherCondition condition, double precipitationProbability
});


$WeatherConditionCopyWith<$Res> get condition;

}
/// @nodoc
class _$HourSlotCopyWithImpl<$Res>
    implements $HourSlotCopyWith<$Res> {
  _$HourSlotCopyWithImpl(this._self, this._then);

  final HourSlot _self;
  final $Res Function(HourSlot) _then;

/// Create a copy of HourSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? temperature = null,Object? condition = null,Object? precipitationProbability = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as WeatherCondition,precipitationProbability: null == precipitationProbability ? _self.precipitationProbability : precipitationProbability // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of HourSlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherConditionCopyWith<$Res> get condition {
  
  return $WeatherConditionCopyWith<$Res>(_self.condition, (value) {
    return _then(_self.copyWith(condition: value));
  });
}
}


/// Adds pattern-matching-related methods to [HourSlot].
extension HourSlotPatterns on HourSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HourSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HourSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HourSlot value)  $default,){
final _that = this;
switch (_that) {
case _HourSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HourSlot value)?  $default,){
final _that = this;
switch (_that) {
case _HourSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime time,  double temperature,  WeatherCondition condition,  double precipitationProbability)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HourSlot() when $default != null:
return $default(_that.time,_that.temperature,_that.condition,_that.precipitationProbability);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime time,  double temperature,  WeatherCondition condition,  double precipitationProbability)  $default,) {final _that = this;
switch (_that) {
case _HourSlot():
return $default(_that.time,_that.temperature,_that.condition,_that.precipitationProbability);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime time,  double temperature,  WeatherCondition condition,  double precipitationProbability)?  $default,) {final _that = this;
switch (_that) {
case _HourSlot() when $default != null:
return $default(_that.time,_that.temperature,_that.condition,_that.precipitationProbability);case _:
  return null;

}
}

}

/// @nodoc


class _HourSlot implements HourSlot {
  const _HourSlot({required this.time, required this.temperature, required this.condition, required this.precipitationProbability});
  

@override final  DateTime time;
@override final  double temperature;
@override final  WeatherCondition condition;
@override final  double precipitationProbability;

/// Create a copy of HourSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HourSlotCopyWith<_HourSlot> get copyWith => __$HourSlotCopyWithImpl<_HourSlot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HourSlot&&(identical(other.time, time) || other.time == time)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.precipitationProbability, precipitationProbability) || other.precipitationProbability == precipitationProbability));
}


@override
int get hashCode => Object.hash(runtimeType,time,temperature,condition,precipitationProbability);

@override
String toString() {
  return 'HourSlot(time: $time, temperature: $temperature, condition: $condition, precipitationProbability: $precipitationProbability)';
}


}

/// @nodoc
abstract mixin class _$HourSlotCopyWith<$Res> implements $HourSlotCopyWith<$Res> {
  factory _$HourSlotCopyWith(_HourSlot value, $Res Function(_HourSlot) _then) = __$HourSlotCopyWithImpl;
@override @useResult
$Res call({
 DateTime time, double temperature, WeatherCondition condition, double precipitationProbability
});


@override $WeatherConditionCopyWith<$Res> get condition;

}
/// @nodoc
class __$HourSlotCopyWithImpl<$Res>
    implements _$HourSlotCopyWith<$Res> {
  __$HourSlotCopyWithImpl(this._self, this._then);

  final _HourSlot _self;
  final $Res Function(_HourSlot) _then;

/// Create a copy of HourSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? temperature = null,Object? condition = null,Object? precipitationProbability = null,}) {
  return _then(_HourSlot(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as WeatherCondition,precipitationProbability: null == precipitationProbability ? _self.precipitationProbability : precipitationProbability // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of HourSlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherConditionCopyWith<$Res> get condition {
  
  return $WeatherConditionCopyWith<$Res>(_self.condition, (value) {
    return _then(_self.copyWith(condition: value));
  });
}
}

/// @nodoc
mixin _$HourlyForecast {

 List<HourSlot> get slots;
/// Create a copy of HourlyForecast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HourlyForecastCopyWith<HourlyForecast> get copyWith => _$HourlyForecastCopyWithImpl<HourlyForecast>(this as HourlyForecast, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HourlyForecast&&const DeepCollectionEquality().equals(other.slots, slots));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'HourlyForecast(slots: $slots)';
}


}

/// @nodoc
abstract mixin class $HourlyForecastCopyWith<$Res>  {
  factory $HourlyForecastCopyWith(HourlyForecast value, $Res Function(HourlyForecast) _then) = _$HourlyForecastCopyWithImpl;
@useResult
$Res call({
 List<HourSlot> slots
});




}
/// @nodoc
class _$HourlyForecastCopyWithImpl<$Res>
    implements $HourlyForecastCopyWith<$Res> {
  _$HourlyForecastCopyWithImpl(this._self, this._then);

  final HourlyForecast _self;
  final $Res Function(HourlyForecast) _then;

/// Create a copy of HourlyForecast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slots = null,}) {
  return _then(_self.copyWith(
slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<HourSlot>,
  ));
}

}


/// Adds pattern-matching-related methods to [HourlyForecast].
extension HourlyForecastPatterns on HourlyForecast {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HourlyForecast value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HourlyForecast() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HourlyForecast value)  $default,){
final _that = this;
switch (_that) {
case _HourlyForecast():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HourlyForecast value)?  $default,){
final _that = this;
switch (_that) {
case _HourlyForecast() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HourSlot> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HourlyForecast() when $default != null:
return $default(_that.slots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HourSlot> slots)  $default,) {final _that = this;
switch (_that) {
case _HourlyForecast():
return $default(_that.slots);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HourSlot> slots)?  $default,) {final _that = this;
switch (_that) {
case _HourlyForecast() when $default != null:
return $default(_that.slots);case _:
  return null;

}
}

}

/// @nodoc


class _HourlyForecast implements HourlyForecast {
  const _HourlyForecast({required final  List<HourSlot> slots}): _slots = slots;
  

 final  List<HourSlot> _slots;
@override List<HourSlot> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of HourlyForecast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HourlyForecastCopyWith<_HourlyForecast> get copyWith => __$HourlyForecastCopyWithImpl<_HourlyForecast>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HourlyForecast&&const DeepCollectionEquality().equals(other._slots, _slots));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'HourlyForecast(slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$HourlyForecastCopyWith<$Res> implements $HourlyForecastCopyWith<$Res> {
  factory _$HourlyForecastCopyWith(_HourlyForecast value, $Res Function(_HourlyForecast) _then) = __$HourlyForecastCopyWithImpl;
@override @useResult
$Res call({
 List<HourSlot> slots
});




}
/// @nodoc
class __$HourlyForecastCopyWithImpl<$Res>
    implements _$HourlyForecastCopyWith<$Res> {
  __$HourlyForecastCopyWithImpl(this._self, this._then);

  final _HourlyForecast _self;
  final $Res Function(_HourlyForecast) _then;

/// Create a copy of HourlyForecast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slots = null,}) {
  return _then(_HourlyForecast(
slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<HourSlot>,
  ));
}


}

// dart format on
