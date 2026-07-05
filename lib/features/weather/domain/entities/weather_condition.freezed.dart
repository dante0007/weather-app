// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherCondition {

 WeatherConditionType get type; String get label; String get iconKey;
/// Create a copy of WeatherCondition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherConditionCopyWith<WeatherCondition> get copyWith => _$WeatherConditionCopyWithImpl<WeatherCondition>(this as WeatherCondition, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherCondition&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.iconKey, iconKey) || other.iconKey == iconKey));
}


@override
int get hashCode => Object.hash(runtimeType,type,label,iconKey);

@override
String toString() {
  return 'WeatherCondition(type: $type, label: $label, iconKey: $iconKey)';
}


}

/// @nodoc
abstract mixin class $WeatherConditionCopyWith<$Res>  {
  factory $WeatherConditionCopyWith(WeatherCondition value, $Res Function(WeatherCondition) _then) = _$WeatherConditionCopyWithImpl;
@useResult
$Res call({
 WeatherConditionType type, String label, String iconKey
});




}
/// @nodoc
class _$WeatherConditionCopyWithImpl<$Res>
    implements $WeatherConditionCopyWith<$Res> {
  _$WeatherConditionCopyWithImpl(this._self, this._then);

  final WeatherCondition _self;
  final $Res Function(WeatherCondition) _then;

/// Create a copy of WeatherCondition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? label = null,Object? iconKey = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WeatherConditionType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,iconKey: null == iconKey ? _self.iconKey : iconKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherCondition].
extension WeatherConditionPatterns on WeatherCondition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherCondition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherCondition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherCondition value)  $default,){
final _that = this;
switch (_that) {
case _WeatherCondition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherCondition value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherCondition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WeatherConditionType type,  String label,  String iconKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherCondition() when $default != null:
return $default(_that.type,_that.label,_that.iconKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WeatherConditionType type,  String label,  String iconKey)  $default,) {final _that = this;
switch (_that) {
case _WeatherCondition():
return $default(_that.type,_that.label,_that.iconKey);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WeatherConditionType type,  String label,  String iconKey)?  $default,) {final _that = this;
switch (_that) {
case _WeatherCondition() when $default != null:
return $default(_that.type,_that.label,_that.iconKey);case _:
  return null;

}
}

}

/// @nodoc


class _WeatherCondition implements WeatherCondition {
  const _WeatherCondition({required this.type, required this.label, required this.iconKey});
  

@override final  WeatherConditionType type;
@override final  String label;
@override final  String iconKey;

/// Create a copy of WeatherCondition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherConditionCopyWith<_WeatherCondition> get copyWith => __$WeatherConditionCopyWithImpl<_WeatherCondition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherCondition&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.iconKey, iconKey) || other.iconKey == iconKey));
}


@override
int get hashCode => Object.hash(runtimeType,type,label,iconKey);

@override
String toString() {
  return 'WeatherCondition(type: $type, label: $label, iconKey: $iconKey)';
}


}

/// @nodoc
abstract mixin class _$WeatherConditionCopyWith<$Res> implements $WeatherConditionCopyWith<$Res> {
  factory _$WeatherConditionCopyWith(_WeatherCondition value, $Res Function(_WeatherCondition) _then) = __$WeatherConditionCopyWithImpl;
@override @useResult
$Res call({
 WeatherConditionType type, String label, String iconKey
});




}
/// @nodoc
class __$WeatherConditionCopyWithImpl<$Res>
    implements _$WeatherConditionCopyWith<$Res> {
  __$WeatherConditionCopyWithImpl(this._self, this._then);

  final _WeatherCondition _self;
  final $Res Function(_WeatherCondition) _then;

/// Create a copy of WeatherCondition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? label = null,Object? iconKey = null,}) {
  return _then(_WeatherCondition(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WeatherConditionType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,iconKey: null == iconKey ? _self.iconKey : iconKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
