import 'package:experience_app/features/create_prototype/domain/models/product_in_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:experience_app/core/consts.dart';

class LocalCartDataSource {
  final SharedPreferences sharedPreferences;

  LocalCartDataSource(this.sharedPreferences);

  Future<void> saveCartData(List<ProductInCartModel> products) async {
    final cartData = products.map((product) => product.toJson()).toList();
    await sharedPreferences.setString(Consts.cartDataKey, cartData.toString());
  }

  Future<String?> getCartData() async {
    return sharedPreferences.getString(Consts.cartDataKey);
  }
}
