import 'package:experience_app/features/create_prototype/data/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

interface class ProductDataSource {
  ProductDataSource();

  Future<List<ProductModel>> getAllProducts() async {
    return [];
  }

  Future<bool> addProduct(ProductModel product, XFile image) async {
    return false;
  }

  Future<bool> editProduct(ProductModel product) async {
    return false;
  }
}
