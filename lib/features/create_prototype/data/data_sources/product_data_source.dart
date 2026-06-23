import 'package:experience_app/features/create_prototype/data/models/product_model.dart';

interface class ProductDataSource {
  ProductDataSource();

  Future<List<ProductModel>> getAllProducts() async {
    return [];
  }
}
