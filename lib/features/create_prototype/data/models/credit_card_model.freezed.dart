// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditCardModel {

 String get cardNumber; String get cardHolderName; String get expiryDate; String get currency;
/// Create a copy of CreditCardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditCardModelCopyWith<CreditCardModel> get copyWith => _$CreditCardModelCopyWithImpl<CreditCardModel>(this as CreditCardModel, _$identity);

  /// Serializes this CreditCardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditCardModel&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardHolderName, cardHolderName) || other.cardHolderName == cardHolderName)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardNumber,cardHolderName,expiryDate,currency);

@override
String toString() {
  return 'CreditCardModel(cardNumber: $cardNumber, cardHolderName: $cardHolderName, expiryDate: $expiryDate, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $CreditCardModelCopyWith<$Res>  {
  factory $CreditCardModelCopyWith(CreditCardModel value, $Res Function(CreditCardModel) _then) = _$CreditCardModelCopyWithImpl;
@useResult
$Res call({
 String cardNumber, String cardHolderName, String expiryDate, String currency
});




}
/// @nodoc
class _$CreditCardModelCopyWithImpl<$Res>
    implements $CreditCardModelCopyWith<$Res> {
  _$CreditCardModelCopyWithImpl(this._self, this._then);

  final CreditCardModel _self;
  final $Res Function(CreditCardModel) _then;

/// Create a copy of CreditCardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardNumber = null,Object? cardHolderName = null,Object? expiryDate = null,Object? currency = null,}) {
  return _then(_self.copyWith(
cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardHolderName: null == cardHolderName ? _self.cardHolderName : cardHolderName // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditCardModel].
extension CreditCardModelPatterns on CreditCardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditCardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditCardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditCardModel value)  $default,){
final _that = this;
switch (_that) {
case _CreditCardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditCardModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreditCardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cardNumber,  String cardHolderName,  String expiryDate,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditCardModel() when $default != null:
return $default(_that.cardNumber,_that.cardHolderName,_that.expiryDate,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cardNumber,  String cardHolderName,  String expiryDate,  String currency)  $default,) {final _that = this;
switch (_that) {
case _CreditCardModel():
return $default(_that.cardNumber,_that.cardHolderName,_that.expiryDate,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cardNumber,  String cardHolderName,  String expiryDate,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _CreditCardModel() when $default != null:
return $default(_that.cardNumber,_that.cardHolderName,_that.expiryDate,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditCardModel implements CreditCardModel {
  const _CreditCardModel({required this.cardNumber, required this.cardHolderName, required this.expiryDate, required this.currency});
  factory _CreditCardModel.fromJson(Map<String, dynamic> json) => _$CreditCardModelFromJson(json);

@override final  String cardNumber;
@override final  String cardHolderName;
@override final  String expiryDate;
@override final  String currency;

/// Create a copy of CreditCardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditCardModelCopyWith<_CreditCardModel> get copyWith => __$CreditCardModelCopyWithImpl<_CreditCardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditCardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditCardModel&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardHolderName, cardHolderName) || other.cardHolderName == cardHolderName)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardNumber,cardHolderName,expiryDate,currency);

@override
String toString() {
  return 'CreditCardModel(cardNumber: $cardNumber, cardHolderName: $cardHolderName, expiryDate: $expiryDate, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$CreditCardModelCopyWith<$Res> implements $CreditCardModelCopyWith<$Res> {
  factory _$CreditCardModelCopyWith(_CreditCardModel value, $Res Function(_CreditCardModel) _then) = __$CreditCardModelCopyWithImpl;
@override @useResult
$Res call({
 String cardNumber, String cardHolderName, String expiryDate, String currency
});




}
/// @nodoc
class __$CreditCardModelCopyWithImpl<$Res>
    implements _$CreditCardModelCopyWith<$Res> {
  __$CreditCardModelCopyWithImpl(this._self, this._then);

  final _CreditCardModel _self;
  final $Res Function(_CreditCardModel) _then;

/// Create a copy of CreditCardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardNumber = null,Object? cardHolderName = null,Object? expiryDate = null,Object? currency = null,}) {
  return _then(_CreditCardModel(
cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardHolderName: null == cardHolderName ? _self.cardHolderName : cardHolderName // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
