import 'package:dio/dio.dart';
import 'package:experience_app/features/create_prototype/data/models/product_model.dart';
import 'package:experience_app/features/create_prototype/data/data_sources/remote_product_data_source.dart';
import 'package:experience_app/features/create_prototype/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final RemoteProductDataSource _remoteProductDataSource =
      RemoteProductDataSource(Dio());

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final products = await _remoteProductDataSource.getAllProducts();
    print('fetchProducts retrieved ${products.length} products');
    return List<ProductModel>.from(products);
  }
}
