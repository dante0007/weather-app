// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_flag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeatureFlag {

 String get key; bool get enabled; bool get killSwitch; RolloutRule get rollout;
/// Create a copy of FeatureFlag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeatureFlagCopyWith<FeatureFlag> get copyWith => _$FeatureFlagCopyWithImpl<FeatureFlag>(this as FeatureFlag, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeatureFlag&&(identical(other.key, key) || other.key == key)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.killSwitch, killSwitch) || other.killSwitch == killSwitch)&&(identical(other.rollout, rollout) || other.rollout == rollout));
}


@override
int get hashCode => Object.hash(runtimeType,key,enabled,killSwitch,rollout);

@override
String toString() {
  return 'FeatureFlag(key: $key, enabled: $enabled, killSwitch: $killSwitch, rollout: $rollout)';
}


}

/// @nodoc
abstract mixin class $FeatureFlagCopyWith<$Res>  {
  factory $FeatureFlagCopyWith(FeatureFlag value, $Res Function(FeatureFlag) _then) = _$FeatureFlagCopyWithImpl;
@useResult
$Res call({
 String key, bool enabled, bool killSwitch, RolloutRule rollout
});


$RolloutRuleCopyWith<$Res> get rollout;

}
/// @nodoc
class _$FeatureFlagCopyWithImpl<$Res>
    implements $FeatureFlagCopyWith<$Res> {
  _$FeatureFlagCopyWithImpl(this._self, this._then);

  final FeatureFlag _self;
  final $Res Function(FeatureFlag) _then;

/// Create a copy of FeatureFlag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? enabled = null,Object? killSwitch = null,Object? rollout = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,killSwitch: null == killSwitch ? _self.killSwitch : killSwitch // ignore: cast_nullable_to_non_nullable
as bool,rollout: null == rollout ? _self.rollout : rollout // ignore: cast_nullable_to_non_nullable
as RolloutRule,
  ));
}
/// Create a copy of FeatureFlag
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RolloutRuleCopyWith<$Res> get rollout {
  
  return $RolloutRuleCopyWith<$Res>(_self.rollout, (value) {
    return _then(_self.copyWith(rollout: value));
  });
}
}


/// Adds pattern-matching-related methods to [FeatureFlag].
extension FeatureFlagPatterns on FeatureFlag {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeatureFlag value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeatureFlag() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeatureFlag value)  $default,){
final _that = this;
switch (_that) {
case _FeatureFlag():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeatureFlag value)?  $default,){
final _that = this;
switch (_that) {
case _FeatureFlag() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  bool enabled,  bool killSwitch,  RolloutRule rollout)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeatureFlag() when $default != null:
return $default(_that.key,_that.enabled,_that.killSwitch,_that.rollout);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  bool enabled,  bool killSwitch,  RolloutRule rollout)  $default,) {final _that = this;
switch (_that) {
case _FeatureFlag():
return $default(_that.key,_that.enabled,_that.killSwitch,_that.rollout);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  bool enabled,  bool killSwitch,  RolloutRule rollout)?  $default,) {final _that = this;
switch (_that) {
case _FeatureFlag() when $default != null:
return $default(_that.key,_that.enabled,_that.killSwitch,_that.rollout);case _:
  return null;

}
}

}

/// @nodoc


class _FeatureFlag implements FeatureFlag {
  const _FeatureFlag({required this.key, required this.enabled, required this.killSwitch, required this.rollout});
  

@override final  String key;
@override final  bool enabled;
@override final  bool killSwitch;
@override final  RolloutRule rollout;

/// Create a copy of FeatureFlag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeatureFlagCopyWith<_FeatureFlag> get copyWith => __$FeatureFlagCopyWithImpl<_FeatureFlag>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeatureFlag&&(identical(other.key, key) || other.key == key)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.killSwitch, killSwitch) || other.killSwitch == killSwitch)&&(identical(other.rollout, rollout) || other.rollout == rollout));
}


@override
int get hashCode => Object.hash(runtimeType,key,enabled,killSwitch,rollout);

@override
String toString() {
  return 'FeatureFlag(key: $key, enabled: $enabled, killSwitch: $killSwitch, rollout: $rollout)';
}


}

/// @nodoc
abstract mixin class _$FeatureFlagCopyWith<$Res> implements $FeatureFlagCopyWith<$Res> {
  factory _$FeatureFlagCopyWith(_FeatureFlag value, $Res Function(_FeatureFlag) _then) = __$FeatureFlagCopyWithImpl;
@override @useResult
$Res call({
 String key, bool enabled, bool killSwitch, RolloutRule rollout
});


@override $RolloutRuleCopyWith<$Res> get rollout;

}
/// @nodoc
class __$FeatureFlagCopyWithImpl<$Res>
    implements _$FeatureFlagCopyWith<$Res> {
  __$FeatureFlagCopyWithImpl(this._self, this._then);

  final _FeatureFlag _self;
  final $Res Function(_FeatureFlag) _then;

/// Create a copy of FeatureFlag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? enabled = null,Object? killSwitch = null,Object? rollout = null,}) {
  return _then(_FeatureFlag(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,killSwitch: null == killSwitch ? _self.killSwitch : killSwitch // ignore: cast_nullable_to_non_nullable
as bool,rollout: null == rollout ? _self.rollout : rollout // ignore: cast_nullable_to_non_nullable
as RolloutRule,
  ));
}

/// Create a copy of FeatureFlag
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RolloutRuleCopyWith<$Res> get rollout {
  
  return $RolloutRuleCopyWith<$Res>(_self.rollout, (value) {
    return _then(_self.copyWith(rollout: value));
  });
}
}

// dart format on
