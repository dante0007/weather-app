// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flag_evaluation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlagEvaluation {

 String get flagKey; int get bucket; int get rolloutPercentage; bool get killSwitch; bool get enabled; bool get result; String? get variant; String get reason;
/// Create a copy of FlagEvaluation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlagEvaluationCopyWith<FlagEvaluation> get copyWith => _$FlagEvaluationCopyWithImpl<FlagEvaluation>(this as FlagEvaluation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlagEvaluation&&(identical(other.flagKey, flagKey) || other.flagKey == flagKey)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.rolloutPercentage, rolloutPercentage) || other.rolloutPercentage == rolloutPercentage)&&(identical(other.killSwitch, killSwitch) || other.killSwitch == killSwitch)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.result, result) || other.result == result)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,flagKey,bucket,rolloutPercentage,killSwitch,enabled,result,variant,reason);

@override
String toString() {
  return 'FlagEvaluation(flagKey: $flagKey, bucket: $bucket, rolloutPercentage: $rolloutPercentage, killSwitch: $killSwitch, enabled: $enabled, result: $result, variant: $variant, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $FlagEvaluationCopyWith<$Res>  {
  factory $FlagEvaluationCopyWith(FlagEvaluation value, $Res Function(FlagEvaluation) _then) = _$FlagEvaluationCopyWithImpl;
@useResult
$Res call({
 String flagKey, int bucket, int rolloutPercentage, bool killSwitch, bool enabled, bool result, String? variant, String reason
});




}
/// @nodoc
class _$FlagEvaluationCopyWithImpl<$Res>
    implements $FlagEvaluationCopyWith<$Res> {
  _$FlagEvaluationCopyWithImpl(this._self, this._then);

  final FlagEvaluation _self;
  final $Res Function(FlagEvaluation) _then;

/// Create a copy of FlagEvaluation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flagKey = null,Object? bucket = null,Object? rolloutPercentage = null,Object? killSwitch = null,Object? enabled = null,Object? result = null,Object? variant = freezed,Object? reason = null,}) {
  return _then(_self.copyWith(
flagKey: null == flagKey ? _self.flagKey : flagKey // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as int,rolloutPercentage: null == rolloutPercentage ? _self.rolloutPercentage : rolloutPercentage // ignore: cast_nullable_to_non_nullable
as int,killSwitch: null == killSwitch ? _self.killSwitch : killSwitch // ignore: cast_nullable_to_non_nullable
as bool,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as bool,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FlagEvaluation].
extension FlagEvaluationPatterns on FlagEvaluation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlagEvaluation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlagEvaluation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlagEvaluation value)  $default,){
final _that = this;
switch (_that) {
case _FlagEvaluation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlagEvaluation value)?  $default,){
final _that = this;
switch (_that) {
case _FlagEvaluation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String flagKey,  int bucket,  int rolloutPercentage,  bool killSwitch,  bool enabled,  bool result,  String? variant,  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlagEvaluation() when $default != null:
return $default(_that.flagKey,_that.bucket,_that.rolloutPercentage,_that.killSwitch,_that.enabled,_that.result,_that.variant,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String flagKey,  int bucket,  int rolloutPercentage,  bool killSwitch,  bool enabled,  bool result,  String? variant,  String reason)  $default,) {final _that = this;
switch (_that) {
case _FlagEvaluation():
return $default(_that.flagKey,_that.bucket,_that.rolloutPercentage,_that.killSwitch,_that.enabled,_that.result,_that.variant,_that.reason);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String flagKey,  int bucket,  int rolloutPercentage,  bool killSwitch,  bool enabled,  bool result,  String? variant,  String reason)?  $default,) {final _that = this;
switch (_that) {
case _FlagEvaluation() when $default != null:
return $default(_that.flagKey,_that.bucket,_that.rolloutPercentage,_that.killSwitch,_that.enabled,_that.result,_that.variant,_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class _FlagEvaluation implements FlagEvaluation {
  const _FlagEvaluation({required this.flagKey, required this.bucket, required this.rolloutPercentage, required this.killSwitch, required this.enabled, required this.result, this.variant, required this.reason});
  

@override final  String flagKey;
@override final  int bucket;
@override final  int rolloutPercentage;
@override final  bool killSwitch;
@override final  bool enabled;
@override final  bool result;
@override final  String? variant;
@override final  String reason;

/// Create a copy of FlagEvaluation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlagEvaluationCopyWith<_FlagEvaluation> get copyWith => __$FlagEvaluationCopyWithImpl<_FlagEvaluation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlagEvaluation&&(identical(other.flagKey, flagKey) || other.flagKey == flagKey)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.rolloutPercentage, rolloutPercentage) || other.rolloutPercentage == rolloutPercentage)&&(identical(other.killSwitch, killSwitch) || other.killSwitch == killSwitch)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.result, result) || other.result == result)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,flagKey,bucket,rolloutPercentage,killSwitch,enabled,result,variant,reason);

@override
String toString() {
  return 'FlagEvaluation(flagKey: $flagKey, bucket: $bucket, rolloutPercentage: $rolloutPercentage, killSwitch: $killSwitch, enabled: $enabled, result: $result, variant: $variant, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$FlagEvaluationCopyWith<$Res> implements $FlagEvaluationCopyWith<$Res> {
  factory _$FlagEvaluationCopyWith(_FlagEvaluation value, $Res Function(_FlagEvaluation) _then) = __$FlagEvaluationCopyWithImpl;
@override @useResult
$Res call({
 String flagKey, int bucket, int rolloutPercentage, bool killSwitch, bool enabled, bool result, String? variant, String reason
});




}
/// @nodoc
class __$FlagEvaluationCopyWithImpl<$Res>
    implements _$FlagEvaluationCopyWith<$Res> {
  __$FlagEvaluationCopyWithImpl(this._self, this._then);

  final _FlagEvaluation _self;
  final $Res Function(_FlagEvaluation) _then;

/// Create a copy of FlagEvaluation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flagKey = null,Object? bucket = null,Object? rolloutPercentage = null,Object? killSwitch = null,Object? enabled = null,Object? result = null,Object? variant = freezed,Object? reason = null,}) {
  return _then(_FlagEvaluation(
flagKey: null == flagKey ? _self.flagKey : flagKey // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as int,rolloutPercentage: null == rolloutPercentage ? _self.rolloutPercentage : rolloutPercentage // ignore: cast_nullable_to_non_nullable
as int,killSwitch: null == killSwitch ? _self.killSwitch : killSwitch // ignore: cast_nullable_to_non_nullable
as bool,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as bool,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
