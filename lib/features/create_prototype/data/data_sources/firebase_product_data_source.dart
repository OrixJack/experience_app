import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:experience_app/core/consts.dart';
import 'package:experience_app/features/create_prototype/data/data_sources/product_data_source.dart';
import 'package:experience_app/features/create_prototype/data/models/product_model.dart';
import 'dart:math';

class FirebaseProductDataSource implements ProductDataSource {
  final FirebaseFirestore _firestore;

  FirebaseProductDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  // Genera un código hexadecimal aleatorio de 16 dígitos
  String _generateRandomHex(int length) {
    const chars = '0123456789abcdef';
    final random = Random();
    return List.generate(
      length,
      (index) => chars[random.nextInt(chars.length)],
    ).join();
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final querySnapshot = await _firestore
          .collection(Consts.productsCollection)
          .get();

      final products = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return ProductModel.fromJson({...data, 'id': doc.id});
      }).toList();

      return products;
    } catch (e) {
      throw Exception('Error getting products from Firestore: $e');
    }
  }

  @override
  Future<bool> addProduct(ProductModel product) async {
    try {
      final idHex = _generateRandomHex(16);
      final productWithId = product.copyWith(id: idHex);
      await _firestore
          .collection(Consts.productsCollection)
          .doc(idHex)
          .set(productWithId.toJson());
      return true;
    } catch (e) {
      throw Exception('Error adding product to Firestore: $e');
    }
  }

  @override
  Future<bool> editProduct(ProductModel product) async {
    try {
      if (product.id.isEmpty) {
        throw Exception('Product ID cannot be empty');
      }
      await _firestore
          .collection(Consts.productsCollection)
          .doc(product.id)
          .update(product.toJson());
      return true;
    } catch (e) {
      throw Exception('Error editing product in Firestore: $e');
    }
  }
}
