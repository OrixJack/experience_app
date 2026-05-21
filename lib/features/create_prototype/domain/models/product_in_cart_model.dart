import 'package:freezed_annotation/freezed_annotation.dart';
import 'product_model.dart';

part 'product_in_cart_model.freezed.dart';
part 'product_in_cart_model.g.dart';

@freezed
abstract class ProductInCartModel with _$ProductInCartModel {
  const factory ProductInCartModel({
    required ProductModel product,
    required int quantity,
    required String selectedSize,
    required String selectedColor,
    required double tax,
    required double discount,
    required double subtotal,
    required double totalPrice,
  }) = _ProductInCartModel;

  factory ProductInCartModel.fromJson(Map<String, dynamic> json) =>
      _$ProductInCartModelFromJson(json);
}
