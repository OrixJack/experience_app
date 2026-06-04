import 'package:experience_app/features/create_prototype/data/data_sources/firebase_product_data_source.dart';
import 'package:experience_app/features/create_prototype/data/models/product_model.dart';
import 'package:experience_app/features/create_prototype/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final FirebaseProductDataSource firebaseProductDataSource =
      FirebaseProductDataSource();

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final products = await firebaseProductDataSource.getAllProducts();
    print('fetchProducts retrieved ${products.length} products');
    return List<ProductModel>.from(products);
  }
}
