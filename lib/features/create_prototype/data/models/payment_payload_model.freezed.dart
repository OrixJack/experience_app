// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_payload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentPayloadModel {

 double get amount; String get cardNumber; String get currency;
/// Create a copy of PaymentPayloadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentPayloadModelCopyWith<PaymentPayloadModel> get copyWith => _$PaymentPayloadModelCopyWithImpl<PaymentPayloadModel>(this as PaymentPayloadModel, _$identity);

  /// Serializes this PaymentPayloadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentPayloadModel&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,cardNumber,currency);

@override
String toString() {
  return 'PaymentPayloadModel(amount: $amount, cardNumber: $cardNumber, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $PaymentPayloadModelCopyWith<$Res>  {
  factory $PaymentPayloadModelCopyWith(PaymentPayloadModel value, $Res Function(PaymentPayloadModel) _then) = _$PaymentPayloadModelCopyWithImpl;
@useResult
$Res call({
 double amount, String cardNumber, String currency
});




}
/// @nodoc
class _$PaymentPayloadModelCopyWithImpl<$Res>
    implements $PaymentPayloadModelCopyWith<$Res> {
  _$PaymentPayloadModelCopyWithImpl(this._self, this._then);

  final PaymentPayloadModel _self;
  final $Res Function(PaymentPayloadModel) _then;

/// Create a copy of PaymentPayloadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? cardNumber = null,Object? currency = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentPayloadModel].
extension PaymentPayloadModelPatterns on PaymentPayloadModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentPayloadModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentPayloadModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentPayloadModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentPayloadModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentPayloadModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentPayloadModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount,  String cardNumber,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentPayloadModel() when $default != null:
return $default(_that.amount,_that.cardNumber,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount,  String cardNumber,  String currency)  $default,) {final _that = this;
switch (_that) {
case _PaymentPayloadModel():
return $default(_that.amount,_that.cardNumber,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount,  String cardNumber,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _PaymentPayloadModel() when $default != null:
return $default(_that.amount,_that.cardNumber,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentPayloadModel implements PaymentPayloadModel {
  const _PaymentPayloadModel({required this.amount, required this.cardNumber, required this.currency});
  factory _PaymentPayloadModel.fromJson(Map<String, dynamic> json) => _$PaymentPayloadModelFromJson(json);

@override final  double amount;
@override final  String cardNumber;
@override final  String currency;

/// Create a copy of PaymentPayloadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentPayloadModelCopyWith<_PaymentPayloadModel> get copyWith => __$PaymentPayloadModelCopyWithImpl<_PaymentPayloadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentPayloadModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentPayloadModel&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,cardNumber,currency);

@override
String toString() {
  return 'PaymentPayloadModel(amount: $amount, cardNumber: $cardNumber, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$PaymentPayloadModelCopyWith<$Res> implements $PaymentPayloadModelCopyWith<$Res> {
  factory _$PaymentPayloadModelCopyWith(_PaymentPayloadModel value, $Res Function(_PaymentPayloadModel) _then) = __$PaymentPayloadModelCopyWithImpl;
@override @useResult
$Res call({
 double amount, String cardNumber, String currency
});




}
/// @nodoc
class __$PaymentPayloadModelCopyWithImpl<$Res>
    implements _$PaymentPayloadModelCopyWith<$Res> {
  __$PaymentPayloadModelCopyWithImpl(this._self, this._then);

  final _PaymentPayloadModel _self;
  final $Res Function(_PaymentPayloadModel) _then;

/// Create a copy of PaymentPayloadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? cardNumber = null,Object? currency = null,}) {
  return _then(_PaymentPayloadModel(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
