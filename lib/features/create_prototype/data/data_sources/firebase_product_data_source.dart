import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:experience_app/features/create_prototype/data/data_sources/product_data_source.dart';
import 'package:experience_app/features/create_prototype/data/models/product_model.dart';

class FirebaseProductDataSource implements ProductDataSource {
  final FirebaseFirestore _firestore;

  FirebaseProductDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final querySnapshot = await _firestore.collection('products').get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      return products;
    } catch (e) {
      throw Exception('Error al obtener productos de Firestore: $e');
    }
  }
}
