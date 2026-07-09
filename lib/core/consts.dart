abstract class Consts {
  /// Shared preferences keys
  static const String cartDataKey = 'cart_data';
  static const String creditCardsDataKey = 'credit_cards_data';

  /// API endpoints
  static String paymentEndpoint =
      "https://processpayment-sfdkfoab2q-uc.a.run.app";
  static String getProductsEndpoint =
      "https://getproducts-sfdkfoab2q-uc.a.run.app/products";

  /// Firebase collection names
  static const String salesCollection = 'sales';
  static const String productsCollection = 'products';
  static const String salesErrorCollection = 'error_sales';
}
