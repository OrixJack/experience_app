import 'package:experience_app/core/consts.dart';
import 'package:experience_app/features/create_prototype/data/models/product_model.dart';
import 'package:dio/dio.dart';

class RemoteProductDataSource {
  final Dio dioClient;

  RemoteProductDataSource(this.dioClient);

  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await dioClient.get(Consts.getProductsEndpoint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return List<ProductModel>.from(
          response.data.map((item) => ProductModel.fromJson(item)),
        );
      } else {
        return List.generate(
          10,
          (index) => ProductModel(
            name: 'Product $index',
            price: 10.0 + index,
            imageUrl: 'assets/product_default.png',
            moneda: 'Q',
            description: 'Description for product $index',
            sizes: ['S', 'M', 'L'],
            colors: ['red', 'green', 'blue'],
          ),
        );
      }
    } catch (e) {
      print('Error in getAllProducts request: $e');
      return List.generate(
        10,
        (index) => ProductModel(
          name: 'Product ${index + 1}',
          price: 29.99 + (index * 5),
          imageUrl: 'assets/product_default.png',
          moneda: 'Q',
          description: 'High-quality product ${index + 1}',
          sizes: ['XS', 'S', 'M', 'L', 'XL'],
          colors: ['red', 'green', 'blue', 'black', 'white'],
        ),
      );
    }
  }
}
