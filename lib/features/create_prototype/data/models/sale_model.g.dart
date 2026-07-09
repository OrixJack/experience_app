// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaleModel _$SaleModelFromJson(Map<String, dynamic> json) => _SaleModel(
  id: json['id'] as String? ?? '',
  idClient: json['idClient'] as String,
  total: (json['total'] as num).toDouble(),
  totalProducts: (json['totalProducts'] as num).toInt(),
  date: json['date'] as String,
  moneda: json['moneda'] as String,
  products: const ProductListConverter().fromJson(json['products'] as List),
  discount: (json['discount'] as num).toDouble(),
  typePayment: (json['typePayment'] as num).toInt(),
  last4Digits: (json['last4Digits'] as num).toInt(),
  status: json['status'] as String? ?? 'OK',
  errorMessage: json['errorMessage'] as String? ?? '',
);

Map<String, dynamic> _$SaleModelToJson(_SaleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idClient': instance.idClient,
      'total': instance.total,
      'totalProducts': instance.totalProducts,
      'date': instance.date,
      'moneda': instance.moneda,
      'products': const ProductListConverter().toJson(instance.products),
      'discount': instance.discount,
      'typePayment': instance.typePayment,
      'last4Digits': instance.last4Digits,
      'status': instance.status,
      'errorMessage': instance.errorMessage,
    };
