import 'dart:convert';
import 'package:experience_app/features/create_prototype/data/models/product_in_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:experience_app/core/consts.dart';

class LocalCartDataSource {
  final SharedPreferences sharedPreferences;

  LocalCartDataSource(this.sharedPreferences);

  Future<void> saveCartData(List<ProductInCartModel> products) async {
    final cartData = products.map((product) => product.toJson()).toList();
    final jsonString = jsonEncode(cartData);
    await sharedPreferences.setString(Consts.cartDataKey, jsonString);
  }

  Future<List<ProductInCartModel>> getCartData() async {
    final jsonString = sharedPreferences.getString(Consts.cartDataKey);
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }
    try {
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList
          .map(
            (item) => ProductInCartModel.fromJson(item as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      print('Error al decodificar carrito: $e');
      return [];
    }
  }

  Future<void> clearCartData() async {
    await sharedPreferences.remove(Consts.cartDataKey);
  }
}
