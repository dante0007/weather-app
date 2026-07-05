// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rollout_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RolloutRule {

 int get rolloutPercentage; String? get variant;
/// Create a copy of RolloutRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RolloutRuleCopyWith<RolloutRule> get copyWith => _$RolloutRuleCopyWithImpl<RolloutRule>(this as RolloutRule, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RolloutRule&&(identical(other.rolloutPercentage, rolloutPercentage) || other.rolloutPercentage == rolloutPercentage)&&(identical(other.variant, variant) || other.variant == variant));
}


@override
int get hashCode => Object.hash(runtimeType,rolloutPercentage,variant);

@override
String toString() {
  return 'RolloutRule(rolloutPercentage: $rolloutPercentage, variant: $variant)';
}


}

/// @nodoc
abstract mixin class $RolloutRuleCopyWith<$Res>  {
  factory $RolloutRuleCopyWith(RolloutRule value, $Res Function(RolloutRule) _then) = _$RolloutRuleCopyWithImpl;
@useResult
$Res call({
 int rolloutPercentage, String? variant
});




}
/// @nodoc
class _$RolloutRuleCopyWithImpl<$Res>
    implements $RolloutRuleCopyWith<$Res> {
  _$RolloutRuleCopyWithImpl(this._self, this._then);

  final RolloutRule _self;
  final $Res Function(RolloutRule) _then;

/// Create a copy of RolloutRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rolloutPercentage = null,Object? variant = freezed,}) {
  return _then(_self.copyWith(
rolloutPercentage: null == rolloutPercentage ? _self.rolloutPercentage : rolloutPercentage // ignore: cast_nullable_to_non_nullable
as int,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RolloutRule].
extension RolloutRulePatterns on RolloutRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RolloutRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RolloutRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RolloutRule value)  $default,){
final _that = this;
switch (_that) {
case _RolloutRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RolloutRule value)?  $default,){
final _that = this;
switch (_that) {
case _RolloutRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int rolloutPercentage,  String? variant)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RolloutRule() when $default != null:
return $default(_that.rolloutPercentage,_that.variant);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int rolloutPercentage,  String? variant)  $default,) {final _that = this;
switch (_that) {
case _RolloutRule():
return $default(_that.rolloutPercentage,_that.variant);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int rolloutPercentage,  String? variant)?  $default,) {final _that = this;
switch (_that) {
case _RolloutRule() when $default != null:
return $default(_that.rolloutPercentage,_that.variant);case _:
  return null;

}
}

}

/// @nodoc


class _RolloutRule implements RolloutRule {
  const _RolloutRule({required this.rolloutPercentage, this.variant});
  

@override final  int rolloutPercentage;
@override final  String? variant;

/// Create a copy of RolloutRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RolloutRuleCopyWith<_RolloutRule> get copyWith => __$RolloutRuleCopyWithImpl<_RolloutRule>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RolloutRule&&(identical(other.rolloutPercentage, rolloutPercentage) || other.rolloutPercentage == rolloutPercentage)&&(identical(other.variant, variant) || other.variant == variant));
}


@override
int get hashCode => Object.hash(runtimeType,rolloutPercentage,variant);

@override
String toString() {
  return 'RolloutRule(rolloutPercentage: $rolloutPercentage, variant: $variant)';
}


}

/// @nodoc
abstract mixin class _$RolloutRuleCopyWith<$Res> implements $RolloutRuleCopyWith<$Res> {
  factory _$RolloutRuleCopyWith(_RolloutRule value, $Res Function(_RolloutRule) _then) = __$RolloutRuleCopyWithImpl;
@override @useResult
$Res call({
 int rolloutPercentage, String? variant
});




}
/// @nodoc
class __$RolloutRuleCopyWithImpl<$Res>
    implements _$RolloutRuleCopyWith<$Res> {
  __$RolloutRuleCopyWithImpl(this._self, this._then);

  final _RolloutRule _self;
  final $Res Function(_RolloutRule) _then;

/// Create a copy of RolloutRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rolloutPercentage = null,Object? variant = freezed,}) {
  return _then(_RolloutRule(
rolloutPercentage: null == rolloutPercentage ? _self.rolloutPercentage : rolloutPercentage // ignore: cast_nullable_to_non_nullable
as int,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
