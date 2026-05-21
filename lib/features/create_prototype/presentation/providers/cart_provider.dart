import 'package:experience_app/features/create_prototype/data/data_sources/local_cart_data_source.dart';
import 'package:experience_app/features/create_prototype/domain/models/product_in_cart_model.dart';
import 'package:experience_app/features/create_prototype/presentation/states/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartCountProvider = StateProvider<int>((ref) => 0);

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState());

  void addProductToCart(ProductInCartModel product) {
    final existingProduct = state.products
        .where(
          (p) =>
              p.product.name == product.product.name &&
              p.selectedSize == product.selectedSize &&
              p.selectedColor == product.selectedColor,
        )
        .firstOrNull;

    if (existingProduct != null) {
      increaseQuantity(existingProduct);
    } else {
      final updatedProducts = [...state.products, product];
      _updateState(updatedProducts);

      //guardar en shared preferences
      LocalCartDataSource.saveCartData(updatedProducts);
    }
  }

  void increaseQuantity(ProductInCartModel product) {
    final updatedProducts = state.products.map((p) {
      if (p.product.name == product.product.name &&
          p.selectedSize == product.selectedSize &&
          p.selectedColor == product.selectedColor) {
        final newQuantity = p.quantity + 1;
        final newSubtotal = p.product.price * newQuantity;

        return p.copyWith(
          quantity: newQuantity,
          subtotal: newSubtotal,
          totalPrice: newSubtotal,
        );
      }
      return p;
    }).toList();

    _updateState(updatedProducts);
  }

  void decreaseQuantity(ProductInCartModel product) {
    final updatedProducts = state.products
        .map((p) {
          if (p.product.name == product.product.name &&
              p.selectedSize == product.selectedSize &&
              p.selectedColor == product.selectedColor) {
            if (p.quantity <= 1) {
              return null;
            }
            final newQuantity = p.quantity - 1;
            final newSubtotal = p.product.price * newQuantity;

            return p.copyWith(
              quantity: newQuantity,
              subtotal: newSubtotal,
              totalPrice: newSubtotal,
            );
          }
          return p;
        })
        .whereType<ProductInCartModel>()
        .toList();

    _updateState(updatedProducts);
  }

  void removeProduct(ProductInCartModel product) {
    final updatedProducts = state.products.where((p) {
      return !(p.product.name == product.product.name &&
          p.selectedSize == product.selectedSize &&
          p.selectedColor == product.selectedColor);
    }).toList();

    _updateState(updatedProducts);
  }

  void _updateState(List<ProductInCartModel> products) {
    double totalSubTotal = 0;
    double totalTax = 0;
    double totalDiscount = 0;

    for (var product in products) {
      totalSubTotal += product.subtotal;
      totalTax += product.tax;
      totalDiscount += product.discount;
    }

    final totalPrice = totalSubTotal;
    final itemCount = products.fold<int>(
      0,
      (sum, product) => sum + product.quantity,
    );

    state = CartState(
      products: products,
      itemCount: itemCount,
      totalSubTotal: totalSubTotal,
      totalTax: totalTax,
      totalDiscount: totalDiscount,
      totalPrice: totalPrice,
    );
  }

  void clearCart() {
    state = const CartState();
  }
}
