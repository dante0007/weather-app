// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerFailure value)?  serverFailure,TResult Function( NetworkFailure value)?  networkFailure,TResult Function( CacheFailure value)?  cacheFailure,TResult Function( ConfigParseFailure value)?  configParseFailure,TResult Function( UnknownFailure value)?  unknownFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerFailure() when serverFailure != null:
return serverFailure(_that);case NetworkFailure() when networkFailure != null:
return networkFailure(_that);case CacheFailure() when cacheFailure != null:
return cacheFailure(_that);case ConfigParseFailure() when configParseFailure != null:
return configParseFailure(_that);case UnknownFailure() when unknownFailure != null:
return unknownFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerFailure value)  serverFailure,required TResult Function( NetworkFailure value)  networkFailure,required TResult Function( CacheFailure value)  cacheFailure,required TResult Function( ConfigParseFailure value)  configParseFailure,required TResult Function( UnknownFailure value)  unknownFailure,}){
final _that = this;
switch (_that) {
case ServerFailure():
return serverFailure(_that);case NetworkFailure():
return networkFailure(_that);case CacheFailure():
return cacheFailure(_that);case ConfigParseFailure():
return configParseFailure(_that);case UnknownFailure():
return unknownFailure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerFailure value)?  serverFailure,TResult? Function( NetworkFailure value)?  networkFailure,TResult? Function( CacheFailure value)?  cacheFailure,TResult? Function( ConfigParseFailure value)?  configParseFailure,TResult? Function( UnknownFailure value)?  unknownFailure,}){
final _that = this;
switch (_that) {
case ServerFailure() when serverFailure != null:
return serverFailure(_that);case NetworkFailure() when networkFailure != null:
return networkFailure(_that);case CacheFailure() when cacheFailure != null:
return cacheFailure(_that);case ConfigParseFailure() when configParseFailure != null:
return configParseFailure(_that);case UnknownFailure() when unknownFailure != null:
return unknownFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  serverFailure,TResult Function()?  networkFailure,TResult Function()?  cacheFailure,TResult Function( String message)?  configParseFailure,TResult Function( String message)?  unknownFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerFailure() when serverFailure != null:
return serverFailure(_that.message);case NetworkFailure() when networkFailure != null:
return networkFailure();case CacheFailure() when cacheFailure != null:
return cacheFailure();case ConfigParseFailure() when configParseFailure != null:
return configParseFailure(_that.message);case UnknownFailure() when unknownFailure != null:
return unknownFailure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  serverFailure,required TResult Function()  networkFailure,required TResult Function()  cacheFailure,required TResult Function( String message)  configParseFailure,required TResult Function( String message)  unknownFailure,}) {final _that = this;
switch (_that) {
case ServerFailure():
return serverFailure(_that.message);case NetworkFailure():
return networkFailure();case CacheFailure():
return cacheFailure();case ConfigParseFailure():
return configParseFailure(_that.message);case UnknownFailure():
return unknownFailure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  serverFailure,TResult? Function()?  networkFailure,TResult? Function()?  cacheFailure,TResult? Function( String message)?  configParseFailure,TResult? Function( String message)?  unknownFailure,}) {final _that = this;
switch (_that) {
case ServerFailure() when serverFailure != null:
return serverFailure(_that.message);case NetworkFailure() when networkFailure != null:
return networkFailure();case CacheFailure() when cacheFailure != null:
return cacheFailure();case ConfigParseFailure() when configParseFailure != null:
return configParseFailure(_that.message);case UnknownFailure() when unknownFailure != null:
return unknownFailure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ServerFailure implements Failure {
  const ServerFailure(this.message);
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.serverFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ServerFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NetworkFailure implements Failure {
  const NetworkFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.networkFailure()';
}


}




/// @nodoc


class CacheFailure implements Failure {
  const CacheFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.cacheFailure()';
}


}




/// @nodoc


class ConfigParseFailure implements Failure {
  const ConfigParseFailure(this.message);
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigParseFailureCopyWith<ConfigParseFailure> get copyWith => _$ConfigParseFailureCopyWithImpl<ConfigParseFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigParseFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.configParseFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ConfigParseFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ConfigParseFailureCopyWith(ConfigParseFailure value, $Res Function(ConfigParseFailure) _then) = _$ConfigParseFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ConfigParseFailureCopyWithImpl<$Res>
    implements $ConfigParseFailureCopyWith<$Res> {
  _$ConfigParseFailureCopyWithImpl(this._self, this._then);

  final ConfigParseFailure _self;
  final $Res Function(ConfigParseFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ConfigParseFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UnknownFailure implements Failure {
  const UnknownFailure(this.message);
  

 final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownFailureCopyWith<UnknownFailure> get copyWith => _$UnknownFailureCopyWithImpl<UnknownFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.unknownFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class $UnknownFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnknownFailureCopyWith(UnknownFailure value, $Res Function(UnknownFailure) _then) = _$UnknownFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$UnknownFailureCopyWithImpl<$Res>
    implements $UnknownFailureCopyWith<$Res> {
  _$UnknownFailureCopyWithImpl(this._self, this._then);

  final UnknownFailure _self;
  final $Res Function(UnknownFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(UnknownFailure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
