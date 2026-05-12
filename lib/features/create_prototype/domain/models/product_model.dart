import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String name,
    required double price,
    required String imageUrl,
    required String moneda,
    required String description,
    required List<String> sizes,
    required List<Color> colors,
  }) = _ProductModel;
}
