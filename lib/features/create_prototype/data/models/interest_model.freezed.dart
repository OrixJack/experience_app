// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interest_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InterestModel {

 String get name; String get imageUrl;
/// Create a copy of InterestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterestModelCopyWith<InterestModel> get copyWith => _$InterestModelCopyWithImpl<InterestModel>(this as InterestModel, _$identity);

  /// Serializes this InterestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,imageUrl);

@override
String toString() {
  return 'InterestModel(name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $InterestModelCopyWith<$Res>  {
  factory $InterestModelCopyWith(InterestModel value, $Res Function(InterestModel) _then) = _$InterestModelCopyWithImpl;
@useResult
$Res call({
 String name, String imageUrl
});




}
/// @nodoc
class _$InterestModelCopyWithImpl<$Res>
    implements $InterestModelCopyWith<$Res> {
  _$InterestModelCopyWithImpl(this._self, this._then);

  final InterestModel _self;
  final $Res Function(InterestModel) _then;

/// Create a copy of InterestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [InterestModel].
extension InterestModelPatterns on InterestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterestModel value)  $default,){
final _that = this;
switch (_that) {
case _InterestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterestModel value)?  $default,){
final _that = this;
switch (_that) {
case _InterestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterestModel() when $default != null:
return $default(_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _InterestModel():
return $default(_that.name,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _InterestModel() when $default != null:
return $default(_that.name,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterestModel implements InterestModel {
  const _InterestModel({required this.name, required this.imageUrl});
  factory _InterestModel.fromJson(Map<String, dynamic> json) => _$InterestModelFromJson(json);

@override final  String name;
@override final  String imageUrl;

/// Create a copy of InterestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterestModelCopyWith<_InterestModel> get copyWith => __$InterestModelCopyWithImpl<_InterestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,imageUrl);

@override
String toString() {
  return 'InterestModel(name: $name, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$InterestModelCopyWith<$Res> implements $InterestModelCopyWith<$Res> {
  factory _$InterestModelCopyWith(_InterestModel value, $Res Function(_InterestModel) _then) = __$InterestModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String imageUrl
});




}
/// @nodoc
class __$InterestModelCopyWithImpl<$Res>
    implements _$InterestModelCopyWith<$Res> {
  __$InterestModelCopyWithImpl(this._self, this._then);

  final _InterestModel _self;
  final $Res Function(_InterestModel) _then;

/// Create a copy of InterestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? imageUrl = null,}) {
  return _then(_InterestModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
