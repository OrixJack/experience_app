// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_in_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductInCartModel _$ProductInCartModelFromJson(Map<String, dynamic> json) =>
    _ProductInCartModel(
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      selectedSize: json['selectedSize'] as String,
      selectedColor: json['selectedColor'] as String,
      tax: (json['tax'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductInCartModelToJson(_ProductInCartModel instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'selectedSize': instance.selectedSize,
      'selectedColor': instance.selectedColor,
      'tax': instance.tax,
      'discount': instance.discount,
      'subtotal': instance.subtotal,
      'totalPrice': instance.totalPrice,
    };
