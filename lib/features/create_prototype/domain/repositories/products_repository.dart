import 'package:experience_app/features/create_prototype/data/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> fetchProducts();
  Future<bool> addProduct(ProductModel product, XFile imageFile);
  Future<bool> editProduct(ProductModel product);
}
