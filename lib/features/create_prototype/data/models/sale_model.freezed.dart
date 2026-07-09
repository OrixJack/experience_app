// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaleModel {

 String get id; String get idClient; double get total; int get totalProducts; String get date; String get moneda;@ProductListConverter() List<ProductInCartModel> get products; double get discount; int get typePayment; int get last4Digits; String get status; String get errorMessage;
/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleModelCopyWith<SaleModel> get copyWith => _$SaleModelCopyWithImpl<SaleModel>(this as SaleModel, _$identity);

  /// Serializes this SaleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.idClient, idClient) || other.idClient == idClient)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.date, date) || other.date == date)&&(identical(other.moneda, moneda) || other.moneda == moneda)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.typePayment, typePayment) || other.typePayment == typePayment)&&(identical(other.last4Digits, last4Digits) || other.last4Digits == last4Digits)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idClient,total,totalProducts,date,moneda,const DeepCollectionEquality().hash(products),discount,typePayment,last4Digits,status,errorMessage);

@override
String toString() {
  return 'SaleModel(id: $id, idClient: $idClient, total: $total, totalProducts: $totalProducts, date: $date, moneda: $moneda, products: $products, discount: $discount, typePayment: $typePayment, last4Digits: $last4Digits, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SaleModelCopyWith<$Res>  {
  factory $SaleModelCopyWith(SaleModel value, $Res Function(SaleModel) _then) = _$SaleModelCopyWithImpl;
@useResult
$Res call({
 String id, String idClient, double total, int totalProducts, String date, String moneda,@ProductListConverter() List<ProductInCartModel> products, double discount, int typePayment, int last4Digits, String status, String errorMessage
});




}
/// @nodoc
class _$SaleModelCopyWithImpl<$Res>
    implements $SaleModelCopyWith<$Res> {
  _$SaleModelCopyWithImpl(this._self, this._then);

  final SaleModel _self;
  final $Res Function(SaleModel) _then;

/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? idClient = null,Object? total = null,Object? totalProducts = null,Object? date = null,Object? moneda = null,Object? products = null,Object? discount = null,Object? typePayment = null,Object? last4Digits = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,idClient: null == idClient ? _self.idClient : idClient // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,totalProducts: null == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,moneda: null == moneda ? _self.moneda : moneda // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductInCartModel>,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,typePayment: null == typePayment ? _self.typePayment : typePayment // ignore: cast_nullable_to_non_nullable
as int,last4Digits: null == last4Digits ? _self.last4Digits : last4Digits // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleModel].
extension SaleModelPatterns on SaleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleModel value)  $default,){
final _that = this;
switch (_that) {
case _SaleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleModel value)?  $default,){
final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String idClient,  double total,  int totalProducts,  String date,  String moneda, @ProductListConverter()  List<ProductInCartModel> products,  double discount,  int typePayment,  int last4Digits,  String status,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
return $default(_that.id,_that.idClient,_that.total,_that.totalProducts,_that.date,_that.moneda,_that.products,_that.discount,_that.typePayment,_that.last4Digits,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String idClient,  double total,  int totalProducts,  String date,  String moneda, @ProductListConverter()  List<ProductInCartModel> products,  double discount,  int typePayment,  int last4Digits,  String status,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SaleModel():
return $default(_that.id,_that.idClient,_that.total,_that.totalProducts,_that.date,_that.moneda,_that.products,_that.discount,_that.typePayment,_that.last4Digits,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String idClient,  double total,  int totalProducts,  String date,  String moneda, @ProductListConverter()  List<ProductInCartModel> products,  double discount,  int typePayment,  int last4Digits,  String status,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SaleModel() when $default != null:
return $default(_that.id,_that.idClient,_that.total,_that.totalProducts,_that.date,_that.moneda,_that.products,_that.discount,_that.typePayment,_that.last4Digits,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SaleModel implements SaleModel {
  const _SaleModel({this.id = '', required this.idClient, required this.total, required this.totalProducts, required this.date, required this.moneda, @ProductListConverter() required final  List<ProductInCartModel> products, required this.discount, required this.typePayment, required this.last4Digits, this.status = 'OK', this.errorMessage = ''}): _products = products;
  factory _SaleModel.fromJson(Map<String, dynamic> json) => _$SaleModelFromJson(json);

@override@JsonKey() final  String id;
@override final  String idClient;
@override final  double total;
@override final  int totalProducts;
@override final  String date;
@override final  String moneda;
 final  List<ProductInCartModel> _products;
@override@ProductListConverter() List<ProductInCartModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  double discount;
@override final  int typePayment;
@override final  int last4Digits;
@override@JsonKey() final  String status;
@override@JsonKey() final  String errorMessage;

/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleModelCopyWith<_SaleModel> get copyWith => __$SaleModelCopyWithImpl<_SaleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SaleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.idClient, idClient) || other.idClient == idClient)&&(identical(other.total, total) || other.total == total)&&(identical(other.totalProducts, totalProducts) || other.totalProducts == totalProducts)&&(identical(other.date, date) || other.date == date)&&(identical(other.moneda, moneda) || other.moneda == moneda)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.typePayment, typePayment) || other.typePayment == typePayment)&&(identical(other.last4Digits, last4Digits) || other.last4Digits == last4Digits)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,idClient,total,totalProducts,date,moneda,const DeepCollectionEquality().hash(_products),discount,typePayment,last4Digits,status,errorMessage);

@override
String toString() {
  return 'SaleModel(id: $id, idClient: $idClient, total: $total, totalProducts: $totalProducts, date: $date, moneda: $moneda, products: $products, discount: $discount, typePayment: $typePayment, last4Digits: $last4Digits, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SaleModelCopyWith<$Res> implements $SaleModelCopyWith<$Res> {
  factory _$SaleModelCopyWith(_SaleModel value, $Res Function(_SaleModel) _then) = __$SaleModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String idClient, double total, int totalProducts, String date, String moneda,@ProductListConverter() List<ProductInCartModel> products, double discount, int typePayment, int last4Digits, String status, String errorMessage
});




}
/// @nodoc
class __$SaleModelCopyWithImpl<$Res>
    implements _$SaleModelCopyWith<$Res> {
  __$SaleModelCopyWithImpl(this._self, this._then);

  final _SaleModel _self;
  final $Res Function(_SaleModel) _then;

/// Create a copy of SaleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? idClient = null,Object? total = null,Object? totalProducts = null,Object? date = null,Object? moneda = null,Object? products = null,Object? discount = null,Object? typePayment = null,Object? last4Digits = null,Object? status = null,Object? errorMessage = null,}) {
  return _then(_SaleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,idClient: null == idClient ? _self.idClient : idClient // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,totalProducts: null == totalProducts ? _self.totalProducts : totalProducts // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,moneda: null == moneda ? _self.moneda : moneda // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductInCartModel>,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,typePayment: null == typePayment ? _self.typePayment : typePayment // ignore: cast_nullable_to_non_nullable
as int,last4Digits: null == last4Digits ? _self.last4Digits : last4Digits // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
