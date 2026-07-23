import 'package:experience_app/features/create_prototype/data/data_sources/firebase_product_data_source.dart';
import 'package:experience_app/features/create_prototype/data/models/product_model.dart';
import 'package:experience_app/features/create_prototype/domain/repositories/products_repository.dart';
import 'package:image_picker/image_picker.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final FirebaseProductDataSource firebaseProductDataSource =
      FirebaseProductDataSource();

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final products = await firebaseProductDataSource.getAllProducts();
    return List<ProductModel>.from(products);
  }

  @override
  Future<bool> addProduct(ProductModel product, XFile imageFile) async {
    return await firebaseProductDataSource.addProduct(product, imageFile);
  }

  @override
  Future<bool> editProduct(ProductModel product) async {
    return await firebaseProductDataSource.editProduct(product);
  }
}
