// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_in_cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductInCartModel {

 ProductModel get product; int get quantity; String get selectedSize; String get selectedColor; double get tax; double get discount; double get subtotal; double get totalPrice;
/// Create a copy of ProductInCartModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductInCartModelCopyWith<ProductInCartModel> get copyWith => _$ProductInCartModelCopyWithImpl<ProductInCartModel>(this as ProductInCartModel, _$identity);

  /// Serializes this ProductInCartModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductInCartModel&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.selectedSize, selectedSize) || other.selectedSize == selectedSize)&&(identical(other.selectedColor, selectedColor) || other.selectedColor == selectedColor)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,product,quantity,selectedSize,selectedColor,tax,discount,subtotal,totalPrice);

@override
String toString() {
  return 'ProductInCartModel(product: $product, quantity: $quantity, selectedSize: $selectedSize, selectedColor: $selectedColor, tax: $tax, discount: $discount, subtotal: $subtotal, totalPrice: $totalPrice)';
}


}

/// @nodoc
abstract mixin class $ProductInCartModelCopyWith<$Res>  {
  factory $ProductInCartModelCopyWith(ProductInCartModel value, $Res Function(ProductInCartModel) _then) = _$ProductInCartModelCopyWithImpl;
@useResult
$Res call({
 ProductModel product, int quantity, String selectedSize, String selectedColor, double tax, double discount, double subtotal, double totalPrice
});


$ProductModelCopyWith<$Res> get product;

}
/// @nodoc
class _$ProductInCartModelCopyWithImpl<$Res>
    implements $ProductInCartModelCopyWith<$Res> {
  _$ProductInCartModelCopyWithImpl(this._self, this._then);

  final ProductInCartModel _self;
  final $Res Function(ProductInCartModel) _then;

/// Create a copy of ProductInCartModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,Object? quantity = null,Object? selectedSize = null,Object? selectedColor = null,Object? tax = null,Object? discount = null,Object? subtotal = null,Object? totalPrice = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedSize: null == selectedSize ? _self.selectedSize : selectedSize // ignore: cast_nullable_to_non_nullable
as String,selectedColor: null == selectedColor ? _self.selectedColor : selectedColor // ignore: cast_nullable_to_non_nullable
as String,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of ProductInCartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res> get product {
  
  return $ProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductInCartModel].
extension ProductInCartModelPatterns on ProductInCartModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductInCartModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductInCartModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductInCartModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductInCartModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductInCartModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductInCartModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductModel product,  int quantity,  String selectedSize,  String selectedColor,  double tax,  double discount,  double subtotal,  double totalPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductInCartModel() when $default != null:
return $default(_that.product,_that.quantity,_that.selectedSize,_that.selectedColor,_that.tax,_that.discount,_that.subtotal,_that.totalPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductModel product,  int quantity,  String selectedSize,  String selectedColor,  double tax,  double discount,  double subtotal,  double totalPrice)  $default,) {final _that = this;
switch (_that) {
case _ProductInCartModel():
return $default(_that.product,_that.quantity,_that.selectedSize,_that.selectedColor,_that.tax,_that.discount,_that.subtotal,_that.totalPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductModel product,  int quantity,  String selectedSize,  String selectedColor,  double tax,  double discount,  double subtotal,  double totalPrice)?  $default,) {final _that = this;
switch (_that) {
case _ProductInCartModel() when $default != null:
return $default(_that.product,_that.quantity,_that.selectedSize,_that.selectedColor,_that.tax,_that.discount,_that.subtotal,_that.totalPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductInCartModel implements ProductInCartModel {
  const _ProductInCartModel({required this.product, required this.quantity, required this.selectedSize, required this.selectedColor, required this.tax, required this.discount, required this.subtotal, required this.totalPrice});
  factory _ProductInCartModel.fromJson(Map<String, dynamic> json) => _$ProductInCartModelFromJson(json);

@override final  ProductModel product;
@override final  int quantity;
@override final  String selectedSize;
@override final  String selectedColor;
@override final  double tax;
@override final  double discount;
@override final  double subtotal;
@override final  double totalPrice;

/// Create a copy of ProductInCartModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductInCartModelCopyWith<_ProductInCartModel> get copyWith => __$ProductInCartModelCopyWithImpl<_ProductInCartModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductInCartModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductInCartModel&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.selectedSize, selectedSize) || other.selectedSize == selectedSize)&&(identical(other.selectedColor, selectedColor) || other.selectedColor == selectedColor)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,product,quantity,selectedSize,selectedColor,tax,discount,subtotal,totalPrice);

@override
String toString() {
  return 'ProductInCartModel(product: $product, quantity: $quantity, selectedSize: $selectedSize, selectedColor: $selectedColor, tax: $tax, discount: $discount, subtotal: $subtotal, totalPrice: $totalPrice)';
}


}

/// @nodoc
abstract mixin class _$ProductInCartModelCopyWith<$Res> implements $ProductInCartModelCopyWith<$Res> {
  factory _$ProductInCartModelCopyWith(_ProductInCartModel value, $Res Function(_ProductInCartModel) _then) = __$ProductInCartModelCopyWithImpl;
@override @useResult
$Res call({
 ProductModel product, int quantity, String selectedSize, String selectedColor, double tax, double discount, double subtotal, double totalPrice
});


@override $ProductModelCopyWith<$Res> get product;

}
/// @nodoc
class __$ProductInCartModelCopyWithImpl<$Res>
    implements _$ProductInCartModelCopyWith<$Res> {
  __$ProductInCartModelCopyWithImpl(this._self, this._then);

  final _ProductInCartModel _self;
  final $Res Function(_ProductInCartModel) _then;

/// Create a copy of ProductInCartModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,Object? quantity = null,Object? selectedSize = null,Object? selectedColor = null,Object? tax = null,Object? discount = null,Object? subtotal = null,Object? totalPrice = null,}) {
  return _then(_ProductInCartModel(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductModel,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedSize: null == selectedSize ? _self.selectedSize : selectedSize // ignore: cast_nullable_to_non_nullable
as String,selectedColor: null == selectedColor ? _self.selectedColor : selectedColor // ignore: cast_nullable_to_non_nullable
as String,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of ProductInCartModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductModelCopyWith<$Res> get product {
  
  return $ProductModelCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
