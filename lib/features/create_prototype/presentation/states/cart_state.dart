import 'package:experience_app/features/create_prototype/data/models/product_in_cart_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default(0) int itemCount,
    @Default([]) List<ProductInCartModel> products,
    @Default(0) double totalSubTotal,
    @Default(0) double totalTax,
    @Default(0) double totalDiscount,
    @Default(0) double totalPrice,
  }) = _CartState;
}
