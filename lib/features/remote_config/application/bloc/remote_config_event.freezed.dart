// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteConfigEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteConfigEvent()';
}


}

/// @nodoc
class $RemoteConfigEventCopyWith<$Res>  {
$RemoteConfigEventCopyWith(RemoteConfigEvent _, $Res Function(RemoteConfigEvent) __);
}


/// Adds pattern-matching-related methods to [RemoteConfigEvent].
extension RemoteConfigEventPatterns on RemoteConfigEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RemoteConfigStarted value)?  started,TResult Function( RemoteConfigConfigSwitched value)?  configSwitched,TResult Function( RemoteConfigUserIdChanged value)?  userIdChanged,TResult Function( RemoteConfigKillSwitchToggled value)?  killSwitchToggled,TResult Function( RemoteConfigConfigStreamUpdated value)?  configStreamUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RemoteConfigStarted() when started != null:
return started(_that);case RemoteConfigConfigSwitched() when configSwitched != null:
return configSwitched(_that);case RemoteConfigUserIdChanged() when userIdChanged != null:
return userIdChanged(_that);case RemoteConfigKillSwitchToggled() when killSwitchToggled != null:
return killSwitchToggled(_that);case RemoteConfigConfigStreamUpdated() when configStreamUpdated != null:
return configStreamUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RemoteConfigStarted value)  started,required TResult Function( RemoteConfigConfigSwitched value)  configSwitched,required TResult Function( RemoteConfigUserIdChanged value)  userIdChanged,required TResult Function( RemoteConfigKillSwitchToggled value)  killSwitchToggled,required TResult Function( RemoteConfigConfigStreamUpdated value)  configStreamUpdated,}){
final _that = this;
switch (_that) {
case RemoteConfigStarted():
return started(_that);case RemoteConfigConfigSwitched():
return configSwitched(_that);case RemoteConfigUserIdChanged():
return userIdChanged(_that);case RemoteConfigKillSwitchToggled():
return killSwitchToggled(_that);case RemoteConfigConfigStreamUpdated():
return configStreamUpdated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RemoteConfigStarted value)?  started,TResult? Function( RemoteConfigConfigSwitched value)?  configSwitched,TResult? Function( RemoteConfigUserIdChanged value)?  userIdChanged,TResult? Function( RemoteConfigKillSwitchToggled value)?  killSwitchToggled,TResult? Function( RemoteConfigConfigStreamUpdated value)?  configStreamUpdated,}){
final _that = this;
switch (_that) {
case RemoteConfigStarted() when started != null:
return started(_that);case RemoteConfigConfigSwitched() when configSwitched != null:
return configSwitched(_that);case RemoteConfigUserIdChanged() when userIdChanged != null:
return userIdChanged(_that);case RemoteConfigKillSwitchToggled() when killSwitchToggled != null:
return killSwitchToggled(_that);case RemoteConfigConfigStreamUpdated() when configStreamUpdated != null:
return configStreamUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String configId)?  configSwitched,TResult Function( String userId)?  userIdChanged,TResult Function( String flagKey,  bool killed)?  killSwitchToggled,TResult Function( RemoteConfig config)?  configStreamUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RemoteConfigStarted() when started != null:
return started();case RemoteConfigConfigSwitched() when configSwitched != null:
return configSwitched(_that.configId);case RemoteConfigUserIdChanged() when userIdChanged != null:
return userIdChanged(_that.userId);case RemoteConfigKillSwitchToggled() when killSwitchToggled != null:
return killSwitchToggled(_that.flagKey,_that.killed);case RemoteConfigConfigStreamUpdated() when configStreamUpdated != null:
return configStreamUpdated(_that.config);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String configId)  configSwitched,required TResult Function( String userId)  userIdChanged,required TResult Function( String flagKey,  bool killed)  killSwitchToggled,required TResult Function( RemoteConfig config)  configStreamUpdated,}) {final _that = this;
switch (_that) {
case RemoteConfigStarted():
return started();case RemoteConfigConfigSwitched():
return configSwitched(_that.configId);case RemoteConfigUserIdChanged():
return userIdChanged(_that.userId);case RemoteConfigKillSwitchToggled():
return killSwitchToggled(_that.flagKey,_that.killed);case RemoteConfigConfigStreamUpdated():
return configStreamUpdated(_that.config);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String configId)?  configSwitched,TResult? Function( String userId)?  userIdChanged,TResult? Function( String flagKey,  bool killed)?  killSwitchToggled,TResult? Function( RemoteConfig config)?  configStreamUpdated,}) {final _that = this;
switch (_that) {
case RemoteConfigStarted() when started != null:
return started();case RemoteConfigConfigSwitched() when configSwitched != null:
return configSwitched(_that.configId);case RemoteConfigUserIdChanged() when userIdChanged != null:
return userIdChanged(_that.userId);case RemoteConfigKillSwitchToggled() when killSwitchToggled != null:
return killSwitchToggled(_that.flagKey,_that.killed);case RemoteConfigConfigStreamUpdated() when configStreamUpdated != null:
return configStreamUpdated(_that.config);case _:
  return null;

}
}

}

/// @nodoc


class RemoteConfigStarted implements RemoteConfigEvent {
  const RemoteConfigStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteConfigEvent.started()';
}


}




/// @nodoc


class RemoteConfigConfigSwitched implements RemoteConfigEvent {
  const RemoteConfigConfigSwitched(this.configId);
  

 final  String configId;

/// Create a copy of RemoteConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteConfigConfigSwitchedCopyWith<RemoteConfigConfigSwitched> get copyWith => _$RemoteConfigConfigSwitchedCopyWithImpl<RemoteConfigConfigSwitched>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigConfigSwitched&&(identical(other.configId, configId) || other.configId == configId));
}


@override
int get hashCode => Object.hash(runtimeType,configId);

@override
String toString() {
  return 'RemoteConfigEvent.configSwitched(configId: $configId)';
}


}

/// @nodoc
abstract mixin class $RemoteConfigConfigSwitchedCopyWith<$Res> implements $RemoteConfigEventCopyWith<$Res> {
  factory $RemoteConfigConfigSwitchedCopyWith(RemoteConfigConfigSwitched value, $Res Function(RemoteConfigConfigSwitched) _then) = _$RemoteConfigConfigSwitchedCopyWithImpl;
@useResult
$Res call({
 String configId
});




}
/// @nodoc
class _$RemoteConfigConfigSwitchedCopyWithImpl<$Res>
    implements $RemoteConfigConfigSwitchedCopyWith<$Res> {
  _$RemoteConfigConfigSwitchedCopyWithImpl(this._self, this._then);

  final RemoteConfigConfigSwitched _self;
  final $Res Function(RemoteConfigConfigSwitched) _then;

/// Create a copy of RemoteConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? configId = null,}) {
  return _then(RemoteConfigConfigSwitched(
null == configId ? _self.configId : configId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RemoteConfigUserIdChanged implements RemoteConfigEvent {
  const RemoteConfigUserIdChanged(this.userId);
  

 final  String userId;

/// Create a copy of RemoteConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteConfigUserIdChangedCopyWith<RemoteConfigUserIdChanged> get copyWith => _$RemoteConfigUserIdChangedCopyWithImpl<RemoteConfigUserIdChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigUserIdChanged&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'RemoteConfigEvent.userIdChanged(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $RemoteConfigUserIdChangedCopyWith<$Res> implements $RemoteConfigEventCopyWith<$Res> {
  factory $RemoteConfigUserIdChangedCopyWith(RemoteConfigUserIdChanged value, $Res Function(RemoteConfigUserIdChanged) _then) = _$RemoteConfigUserIdChangedCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$RemoteConfigUserIdChangedCopyWithImpl<$Res>
    implements $RemoteConfigUserIdChangedCopyWith<$Res> {
  _$RemoteConfigUserIdChangedCopyWithImpl(this._self, this._then);

  final RemoteConfigUserIdChanged _self;
  final $Res Function(RemoteConfigUserIdChanged) _then;

/// Create a copy of RemoteConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(RemoteConfigUserIdChanged(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RemoteConfigKillSwitchToggled implements RemoteConfigEvent {
  const RemoteConfigKillSwitchToggled(this.flagKey, this.killed);
  

 final  String flagKey;
 final  bool killed;

/// Create a copy of RemoteConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteConfigKillSwitchToggledCopyWith<RemoteConfigKillSwitchToggled> get copyWith => _$RemoteConfigKillSwitchToggledCopyWithImpl<RemoteConfigKillSwitchToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigKillSwitchToggled&&(identical(other.flagKey, flagKey) || other.flagKey == flagKey)&&(identical(other.killed, killed) || other.killed == killed));
}


@override
int get hashCode => Object.hash(runtimeType,flagKey,killed);

@override
String toString() {
  return 'RemoteConfigEvent.killSwitchToggled(flagKey: $flagKey, killed: $killed)';
}


}

/// @nodoc
abstract mixin class $RemoteConfigKillSwitchToggledCopyWith<$Res> implements $RemoteConfigEventCopyWith<$Res> {
  factory $RemoteConfigKillSwitchToggledCopyWith(RemoteConfigKillSwitchToggled value, $Res Function(RemoteConfigKillSwitchToggled) _then) = _$RemoteConfigKillSwitchToggledCopyWithImpl;
@useResult
$Res call({
 String flagKey, bool killed
});




}
/// @nodoc
class _$RemoteConfigKillSwitchToggledCopyWithImpl<$Res>
    implements $RemoteConfigKillSwitchToggledCopyWith<$Res> {
  _$RemoteConfigKillSwitchToggledCopyWithImpl(this._self, this._then);

  final RemoteConfigKillSwitchToggled _self;
  final $Res Function(RemoteConfigKillSwitchToggled) _then;

/// Create a copy of RemoteConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? flagKey = null,Object? killed = null,}) {
  return _then(RemoteConfigKillSwitchToggled(
null == flagKey ? _self.flagKey : flagKey // ignore: cast_nullable_to_non_nullable
as String,null == killed ? _self.killed : killed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class RemoteConfigConfigStreamUpdated implements RemoteConfigEvent {
  const RemoteConfigConfigStreamUpdated(this.config);
  

 final  RemoteConfig config;

/// Create a copy of RemoteConfigEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteConfigConfigStreamUpdatedCopyWith<RemoteConfigConfigStreamUpdated> get copyWith => _$RemoteConfigConfigStreamUpdatedCopyWithImpl<RemoteConfigConfigStreamUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfigConfigStreamUpdated&&(identical(other.config, config) || other.config == config));
}


@override
int get hashCode => Object.hash(runtimeType,config);

@override
String toString() {
  return 'RemoteConfigEvent.configStreamUpdated(config: $config)';
}


}

/// @nodoc
abstract mixin class $RemoteConfigConfigStreamUpdatedCopyWith<$Res> implements $RemoteConfigEventCopyWith<$Res> {
  factory $RemoteConfigConfigStreamUpdatedCopyWith(RemoteConfigConfigStreamUpdated value, $Res Function(RemoteConfigConfigStreamUpdated) _then) = _$RemoteConfigConfigStreamUpdatedCopyWithImpl;
@useResult
$Res call({
 RemoteConfig config
});


$RemoteConfigCopyWith<$Res> get config;

}
/// @nodoc
class _$RemoteConfigConfigStreamUpdatedCopyWithImpl<$Res>
    implements $RemoteConfigConfigStreamUpdatedCopyWith<$Res> {
  _$RemoteConfigConfigStreamUpdatedCopyWithImpl(this._self, this._then);

  final RemoteConfigConfigStreamUpdated _self;
  final $Res Function(RemoteConfigConfigStreamUpdated) _then;

/// Create a copy of RemoteConfigEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? config = null,}) {
  return _then(RemoteConfigConfigStreamUpdated(
null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as RemoteConfig,
  ));
}

/// Create a copy of RemoteConfigEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteConfigCopyWith<$Res> get config {
  
  return $RemoteConfigCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

// dart format on
