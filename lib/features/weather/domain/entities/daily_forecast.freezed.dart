// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DaySlot {

 DateTime get date; WeatherCondition get condition; double get tempMax; double get tempMin;
/// Create a copy of DaySlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DaySlotCopyWith<DaySlot> get copyWith => _$DaySlotCopyWithImpl<DaySlot>(this as DaySlot, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DaySlot&&(identical(other.date, date) || other.date == date)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin));
}


@override
int get hashCode => Object.hash(runtimeType,date,condition,tempMax,tempMin);

@override
String toString() {
  return 'DaySlot(date: $date, condition: $condition, tempMax: $tempMax, tempMin: $tempMin)';
}


}

/// @nodoc
abstract mixin class $DaySlotCopyWith<$Res>  {
  factory $DaySlotCopyWith(DaySlot value, $Res Function(DaySlot) _then) = _$DaySlotCopyWithImpl;
@useResult
$Res call({
 DateTime date, WeatherCondition condition, double tempMax, double tempMin
});


$WeatherConditionCopyWith<$Res> get condition;

}
/// @nodoc
class _$DaySlotCopyWithImpl<$Res>
    implements $DaySlotCopyWith<$Res> {
  _$DaySlotCopyWithImpl(this._self, this._then);

  final DaySlot _self;
  final $Res Function(DaySlot) _then;

/// Create a copy of DaySlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? condition = null,Object? tempMax = null,Object? tempMin = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as WeatherCondition,tempMax: null == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double,tempMin: null == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of DaySlot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherConditionCopyWith<$Res> get condition {
  
  return $WeatherConditionCopyWith<$Res>(_self.condition, (value) {
    return _then(_self.copyWith(condition: value));
  });
}
}


/// Adds pattern-matching-related methods to [DaySlot].
extension DaySlotPatterns on DaySlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DaySlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DaySlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DaySlot value)  $default,){
final _that = this;
switch (_that) {
case _DaySlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DaySlot value)?  $default,){
final _that = this;
switch (_that) {
case _DaySlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  WeatherCondition condition,  double tempMax,  double tempMin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DaySlot() when $default != null:
return $default(_that.date,_that.condition,_that.tempMax,_that.tempMin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  WeatherCondition condition,  double tempMax,  double tempMin)  $default,) {final _that = this;
switch (_that) {
case _DaySlot():
return $default(_that.date,_that.condition,_that.tempMax,_that.tempMin);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  WeatherCondition condition,  double tempMax,  double tempMin)?  $default,) {final _that = this;
switch (_that) {
case _DaySlot() when $default != null:
return $default(_that.date,_that.condition,_that.tempMax,_that.tempMin);case _:
  return null;

}
}

}

/// @nodoc


class _DaySlot implements DaySlot {
  const _DaySlot({required this.date, required this.condition, required this.tempMax, required this.tempMin});
  

@override final  DateTime date;
@override final  WeatherCondition condition;
@override final  double tempMax;
@override final  double tempMin;

/// Create a copy of DaySlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DaySlotCopyWith<_DaySlot> get copyWith => __$DaySlotCopyWithImpl<_DaySlot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DaySlot&&(identical(other.date, date) || other.date == date)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.tempMax, tempMax) || other.tempMax == tempMax)&&(identical(other.tempMin, tempMin) || other.tempMin == tempMin));
}


@override
int get hashCode => Object.hash(runtimeType,date,condition,tempMax,tempMin);

@override
String toString() {
  return 'DaySlot(date: $date, condition: $condition, tempMax: $tempMax, tempMin: $tempMin)';
}


}

/// @nodoc
abstract mixin class _$DaySlotCopyWith<$Res> implements $DaySlotCopyWith<$Res> {
  factory _$DaySlotCopyWith(_DaySlot value, $Res Function(_DaySlot) _then) = __$DaySlotCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, WeatherCondition condition, double tempMax, double tempMin
});


@override $WeatherConditionCopyWith<$Res> get condition;

}
/// @nodoc
class __$DaySlotCopyWithImpl<$Res>
    implements _$DaySlotCopyWith<$Res> {
  __$DaySlotCopyWithImpl(this._self, this._then);

  final _DaySlot _self;
  final $Res Function(_DaySlot) _then;

/// Create a copy of DaySlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? condition = null,Object? tempMax = null,Object? tempMin = null,}) {
  return _then(_DaySlot(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as WeatherCondition,tempMax: null == tempMax ? _self.tempMax : tempMax // ignore: cast_nullable_to_non_nullable
as double,tempMin: null == tempMin ? _self.tempMin : tempMin // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of DaySlot
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
mixin _$DailyForecast {

 List<DaySlot> get days;
/// Create a copy of DailyForecast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyForecastCopyWith<DailyForecast> get copyWith => _$DailyForecastCopyWithImpl<DailyForecast>(this as DailyForecast, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyForecast&&const DeepCollectionEquality().equals(other.days, days));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(days));

@override
String toString() {
  return 'DailyForecast(days: $days)';
}


}

/// @nodoc
abstract mixin class $DailyForecastCopyWith<$Res>  {
  factory $DailyForecastCopyWith(DailyForecast value, $Res Function(DailyForecast) _then) = _$DailyForecastCopyWithImpl;
@useResult
$Res call({
 List<DaySlot> days
});




}
/// @nodoc
class _$DailyForecastCopyWithImpl<$Res>
    implements $DailyForecastCopyWith<$Res> {
  _$DailyForecastCopyWithImpl(this._self, this._then);

  final DailyForecast _self;
  final $Res Function(DailyForecast) _then;

/// Create a copy of DailyForecast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? days = null,}) {
  return _then(_self.copyWith(
days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<DaySlot>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyForecast].
extension DailyForecastPatterns on DailyForecast {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyForecast value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyForecast() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyForecast value)  $default,){
final _that = this;
switch (_that) {
case _DailyForecast():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyForecast value)?  $default,){
final _that = this;
switch (_that) {
case _DailyForecast() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DaySlot> days)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyForecast() when $default != null:
return $default(_that.days);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DaySlot> days)  $default,) {final _that = this;
switch (_that) {
case _DailyForecast():
return $default(_that.days);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DaySlot> days)?  $default,) {final _that = this;
switch (_that) {
case _DailyForecast() when $default != null:
return $default(_that.days);case _:
  return null;

}
}

}

/// @nodoc


class _DailyForecast implements DailyForecast {
  const _DailyForecast({required final  List<DaySlot> days}): _days = days;
  

 final  List<DaySlot> _days;
@override List<DaySlot> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}


/// Create a copy of DailyForecast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyForecastCopyWith<_DailyForecast> get copyWith => __$DailyForecastCopyWithImpl<_DailyForecast>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyForecast&&const DeepCollectionEquality().equals(other._days, _days));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_days));

@override
String toString() {
  return 'DailyForecast(days: $days)';
}


}

/// @nodoc
abstract mixin class _$DailyForecastCopyWith<$Res> implements $DailyForecastCopyWith<$Res> {
  factory _$DailyForecastCopyWith(_DailyForecast value, $Res Function(_DailyForecast) _then) = __$DailyForecastCopyWithImpl;
@override @useResult
$Res call({
 List<DaySlot> days
});




}
/// @nodoc
class __$DailyForecastCopyWithImpl<$Res>
    implements _$DailyForecastCopyWith<$Res> {
  __$DailyForecastCopyWithImpl(this._self, this._then);

  final _DailyForecast _self;
  final $Res Function(_DailyForecast) _then;

/// Create a copy of DailyForecast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? days = null,}) {
  return _then(_DailyForecast(
days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<DaySlot>,
  ));
}


}

// dart format on
