// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personalize_experience_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PersonalizeExperienceState {

 List<String> get selectedInterests;
/// Create a copy of PersonalizeExperienceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalizeExperienceStateCopyWith<PersonalizeExperienceState> get copyWith => _$PersonalizeExperienceStateCopyWithImpl<PersonalizeExperienceState>(this as PersonalizeExperienceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalizeExperienceState&&const DeepCollectionEquality().equals(other.selectedInterests, selectedInterests));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selectedInterests));

@override
String toString() {
  return 'PersonalizeExperienceState(selectedInterests: $selectedInterests)';
}


}

/// @nodoc
abstract mixin class $PersonalizeExperienceStateCopyWith<$Res>  {
  factory $PersonalizeExperienceStateCopyWith(PersonalizeExperienceState value, $Res Function(PersonalizeExperienceState) _then) = _$PersonalizeExperienceStateCopyWithImpl;
@useResult
$Res call({
 List<String> selectedInterests
});




}
/// @nodoc
class _$PersonalizeExperienceStateCopyWithImpl<$Res>
    implements $PersonalizeExperienceStateCopyWith<$Res> {
  _$PersonalizeExperienceStateCopyWithImpl(this._self, this._then);

  final PersonalizeExperienceState _self;
  final $Res Function(PersonalizeExperienceState) _then;

/// Create a copy of PersonalizeExperienceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedInterests = null,}) {
  return _then(_self.copyWith(
selectedInterests: null == selectedInterests ? _self.selectedInterests : selectedInterests // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalizeExperienceState].
extension PersonalizeExperienceStatePatterns on PersonalizeExperienceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalizeExperienceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalizeExperienceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalizeExperienceState value)  $default,){
final _that = this;
switch (_that) {
case _PersonalizeExperienceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalizeExperienceState value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalizeExperienceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> selectedInterests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalizeExperienceState() when $default != null:
return $default(_that.selectedInterests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> selectedInterests)  $default,) {final _that = this;
switch (_that) {
case _PersonalizeExperienceState():
return $default(_that.selectedInterests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> selectedInterests)?  $default,) {final _that = this;
switch (_that) {
case _PersonalizeExperienceState() when $default != null:
return $default(_that.selectedInterests);case _:
  return null;

}
}

}

/// @nodoc


class _PersonalizeExperienceState implements PersonalizeExperienceState {
  const _PersonalizeExperienceState({final  List<String> selectedInterests = const []}): _selectedInterests = selectedInterests;
  

 final  List<String> _selectedInterests;
@override@JsonKey() List<String> get selectedInterests {
  if (_selectedInterests is EqualUnmodifiableListView) return _selectedInterests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedInterests);
}


/// Create a copy of PersonalizeExperienceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalizeExperienceStateCopyWith<_PersonalizeExperienceState> get copyWith => __$PersonalizeExperienceStateCopyWithImpl<_PersonalizeExperienceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalizeExperienceState&&const DeepCollectionEquality().equals(other._selectedInterests, _selectedInterests));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectedInterests));

@override
String toString() {
  return 'PersonalizeExperienceState(selectedInterests: $selectedInterests)';
}


}

/// @nodoc
abstract mixin class _$PersonalizeExperienceStateCopyWith<$Res> implements $PersonalizeExperienceStateCopyWith<$Res> {
  factory _$PersonalizeExperienceStateCopyWith(_PersonalizeExperienceState value, $Res Function(_PersonalizeExperienceState) _then) = __$PersonalizeExperienceStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> selectedInterests
});




}
/// @nodoc
class __$PersonalizeExperienceStateCopyWithImpl<$Res>
    implements _$PersonalizeExperienceStateCopyWith<$Res> {
  __$PersonalizeExperienceStateCopyWithImpl(this._self, this._then);

  final _PersonalizeExperienceState _self;
  final $Res Function(_PersonalizeExperienceState) _then;

/// Create a copy of PersonalizeExperienceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedInterests = null,}) {
  return _then(_PersonalizeExperienceState(
selectedInterests: null == selectedInterests ? _self._selectedInterests : selectedInterests // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
