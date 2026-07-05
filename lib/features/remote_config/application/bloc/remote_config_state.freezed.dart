// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteConfigState {

 RemoteConfig? get config; String get userId; bool get isLoading; Failure? get failure; FlagEvaluator get evaluator;
/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteConfigStateCopyWith<RemoteConfigState> get copyWith => _$RemoteConfigStateCopyWithImpl<RemoteConfigState>(this as RemoteConfigState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigState&&(identical(other.config, config) || other.config == config)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.evaluator, evaluator) || other.evaluator == evaluator));
}


@override
int get hashCode => Object.hash(runtimeType,config,userId,isLoading,failure,evaluator);

@override
String toString() {
  return 'RemoteConfigState(config: $config, userId: $userId, isLoading: $isLoading, failure: $failure, evaluator: $evaluator)';
}


}

/// @nodoc
abstract mixin class $RemoteConfigStateCopyWith<$Res>  {
  factory $RemoteConfigStateCopyWith(RemoteConfigState value, $Res Function(RemoteConfigState) _then) = _$RemoteConfigStateCopyWithImpl;
@useResult
$Res call({
 RemoteConfig? config, String userId, bool isLoading, Failure? failure, FlagEvaluator evaluator
});


$RemoteConfigCopyWith<$Res>? get config;$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$RemoteConfigStateCopyWithImpl<$Res>
    implements $RemoteConfigStateCopyWith<$Res> {
  _$RemoteConfigStateCopyWithImpl(this._self, this._then);

  final RemoteConfigState _self;
  final $Res Function(RemoteConfigState) _then;

/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? config = freezed,Object? userId = null,Object? isLoading = null,Object? failure = freezed,Object? evaluator = null,}) {
  return _then(_self.copyWith(
config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as RemoteConfig?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,evaluator: null == evaluator ? _self.evaluator : evaluator // ignore: cast_nullable_to_non_nullable
as FlagEvaluator,
  ));
}
/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteConfigCopyWith<$Res>? get config {
    if (_self.config == null) {
    return null;
  }

  return $RemoteConfigCopyWith<$Res>(_self.config!, (value) {
    return _then(_self.copyWith(config: value));
  });
}/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}


/// Adds pattern-matching-related methods to [RemoteConfigState].
extension RemoteConfigStatePatterns on RemoteConfigState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteConfigState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteConfigState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteConfigState value)  $default,){
final _that = this;
switch (_that) {
case _RemoteConfigState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteConfigState value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteConfigState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RemoteConfig? config,  String userId,  bool isLoading,  Failure? failure,  FlagEvaluator evaluator)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteConfigState() when $default != null:
return $default(_that.config,_that.userId,_that.isLoading,_that.failure,_that.evaluator);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RemoteConfig? config,  String userId,  bool isLoading,  Failure? failure,  FlagEvaluator evaluator)  $default,) {final _that = this;
switch (_that) {
case _RemoteConfigState():
return $default(_that.config,_that.userId,_that.isLoading,_that.failure,_that.evaluator);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RemoteConfig? config,  String userId,  bool isLoading,  Failure? failure,  FlagEvaluator evaluator)?  $default,) {final _that = this;
switch (_that) {
case _RemoteConfigState() when $default != null:
return $default(_that.config,_that.userId,_that.isLoading,_that.failure,_that.evaluator);case _:
  return null;

}
}

}

/// @nodoc


class _RemoteConfigState extends RemoteConfigState {
  const _RemoteConfigState({this.config, this.userId = AppConstants.defaultUserId, this.isLoading = false, this.failure, this.evaluator = const FlagEvaluator()}): super._();
  

@override final  RemoteConfig? config;
@override@JsonKey() final  String userId;
@override@JsonKey() final  bool isLoading;
@override final  Failure? failure;
@override@JsonKey() final  FlagEvaluator evaluator;

/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteConfigStateCopyWith<_RemoteConfigState> get copyWith => __$RemoteConfigStateCopyWithImpl<_RemoteConfigState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteConfigState&&(identical(other.config, config) || other.config == config)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.evaluator, evaluator) || other.evaluator == evaluator));
}


@override
int get hashCode => Object.hash(runtimeType,config,userId,isLoading,failure,evaluator);

@override
String toString() {
  return 'RemoteConfigState(config: $config, userId: $userId, isLoading: $isLoading, failure: $failure, evaluator: $evaluator)';
}


}

/// @nodoc
abstract mixin class _$RemoteConfigStateCopyWith<$Res> implements $RemoteConfigStateCopyWith<$Res> {
  factory _$RemoteConfigStateCopyWith(_RemoteConfigState value, $Res Function(_RemoteConfigState) _then) = __$RemoteConfigStateCopyWithImpl;
@override @useResult
$Res call({
 RemoteConfig? config, String userId, bool isLoading, Failure? failure, FlagEvaluator evaluator
});


@override $RemoteConfigCopyWith<$Res>? get config;@override $FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$RemoteConfigStateCopyWithImpl<$Res>
    implements _$RemoteConfigStateCopyWith<$Res> {
  __$RemoteConfigStateCopyWithImpl(this._self, this._then);

  final _RemoteConfigState _self;
  final $Res Function(_RemoteConfigState) _then;

/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? config = freezed,Object? userId = null,Object? isLoading = null,Object? failure = freezed,Object? evaluator = null,}) {
  return _then(_RemoteConfigState(
config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as RemoteConfig?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,evaluator: null == evaluator ? _self.evaluator : evaluator // ignore: cast_nullable_to_non_nullable
as FlagEvaluator,
  ));
}

/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteConfigCopyWith<$Res>? get config {
    if (_self.config == null) {
    return null;
  }

  return $RemoteConfigCopyWith<$Res>(_self.config!, (value) {
    return _then(_self.copyWith(config: value));
  });
}/// Create a copy of RemoteConfigState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
