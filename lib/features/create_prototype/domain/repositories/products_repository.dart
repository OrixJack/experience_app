import 'package:experience_app/features/create_prototype/data/models/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> fetchProducts();
  Future<bool> addProduct(ProductModel product);
  Future<bool> editProduct(ProductModel product);
}
