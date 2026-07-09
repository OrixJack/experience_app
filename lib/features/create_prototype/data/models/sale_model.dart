import 'package:experience_app/features/create_prototype/data/models/product_in_cart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_model.freezed.dart';
part 'sale_model.g.dart';

class ProductListConverter
    implements JsonConverter<List<ProductInCartModel>, List<dynamic>> {
  const ProductListConverter();

  @override
  List<ProductInCartModel> fromJson(List<dynamic> json) {
    return json
        .map(
          (item) => item is ProductInCartModel
              ? item
              : ProductInCartModel.fromJson(item as Map<String, dynamic>),
        )
        .toList()
        .cast<ProductInCartModel>();
  }

  @override
  List<dynamic> toJson(List<ProductInCartModel> object) {
    return object.map((item) => item.toJson()).toList();
  }
}

@freezed
abstract class SaleModel with _$SaleModel {
  const factory SaleModel({
    @Default('') String id,
    required String idClient,
    required double total,
    required int totalProducts,
    required String date,
    required String moneda,
    @ProductListConverter() required List<ProductInCartModel> products,
    required double discount,
    required int typePayment,
    required int last4Digits,
  }) = _SaleModel;

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);
}
