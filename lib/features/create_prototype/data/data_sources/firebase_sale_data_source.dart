import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:experience_app/core/consts.dart';
import 'dart:math';
import 'package:experience_app/features/create_prototype/data/data_sources/sales_data_source.dart';
import 'package:experience_app/features/create_prototype/data/models/sale_model.dart';

class FirebaseSaleDataSource implements SalesDataSource {
  final FirebaseFirestore _firestore;

  FirebaseSaleDataSource({FirebaseFirestore? firestore})
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

  // Convierte recursivamente objetos a JSON
  Map<String, dynamic> _serializeToJson(Map<String, dynamic> json) {
    final result = <String, dynamic>{};
    json.forEach((key, value) {
      if (value is List) {
        result[key] = value.map((item) {
          if (item is Map<String, dynamic>) {
            return _serializeToJson(item);
          } else if (item.runtimeType.toString().contains('_')) {
            // Es un modelo generado con freezed
            return item.toJson();
          }
          return item;
        }).toList();
      } else if (value is Map<String, dynamic>) {
        result[key] = _serializeToJson(value);
      } else if (value != null && value.runtimeType.toString().contains('_')) {
        // Es un modelo generado con freezed
        result[key] = value.toJson();
      } else {
        result[key] = value;
      }
    });
    return result;
  }

  @override
  Future<List<SaleModel>> history(String idClient) async {
    try {
      final querySnapshot = await _firestore
          .collection(Consts.salesCollection)
          .where('idClient', isEqualTo: idClient)
          .orderBy('date', descending: true)
          .get();

      final sales = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return SaleModel.fromJson({...data, 'id': doc.id});
      }).toList();

      return sales;
    } catch (e) {
      throw Exception('Error getting Sales from Firestore: $e');
    }
  }

  @override
  Future<List<SaleModel>> historyFailed(String idClient) async {
    try {
      final querySnapshot = await _firestore
          .collection(Consts.salesErrorCollection)
          .where('idClient', isEqualTo: idClient)
          .orderBy('date', descending: true)
          .get();

      final sales = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return SaleModel.fromJson({...data, 'id': doc.id});
      }).toList();

      return sales;
    } catch (e) {
      throw Exception('Error getting Sales from Firestore: $e');
    }
  }

  @override
  Future<SaleModel> getSale(String idClient) async {
    try {
      final querySnapshot = await _firestore
          .collection(Consts.salesCollection)
          .where('idClient', isEqualTo: idClient)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception('Not found sale for client $idClient');
      }

      final doc = querySnapshot.docs.first;
      final data = doc.data();
      return SaleModel.fromJson({...data, 'id': doc.id});
    } catch (e) {
      throw Exception('Error getting Sale from Firestore: $e');
    }
  }

  @override
  Future<bool> addSale(SaleModel sale) async {
    try {
      final idHex = _generateRandomHex(16);
      final saleWithId = sale.copyWith(id: idHex);
      final saleJson = saleWithId.toJson();

      // Serializar completamente todos los objetos anidados
      final serializedJson = _serializeToJson(saleJson);

      await _firestore
          .collection(Consts.salesCollection)
          .doc(idHex)
          .set(serializedJson);
      return true;
    } catch (e) {
      throw Exception('Error adding Sale to Firestore: $e');
    }
  }

  @override
  Future<bool> addSaleError(SaleModel sale) async {
    try {
      final idHex = _generateRandomHex(16);
      final saleWithId = sale.copyWith(id: idHex);
      final saleJson = saleWithId.toJson();

      // Serializar completamente todos los objetos anidados
      final serializedJson = _serializeToJson(saleJson);

      await _firestore
          .collection(Consts.salesErrorCollection)
          .doc(idHex)
          .set(serializedJson);
      return true;
    } catch (e) {
      throw Exception('Error adding Sale to Firestore: $e');
    }
  }

  @override
  Future<bool> updateSale(SaleModel sale) async {
    try {
      if (sale.id.isEmpty) {
        throw Exception('Sale ID cannot be empty');
      }
      final saleJson = sale.toJson();

      // Serializar completamente todos los objetos anidados
      final serializedJson = _serializeToJson(saleJson);

      await _firestore
          .collection(Consts.salesCollection)
          .doc(sale.id)
          .update(serializedJson);
      return true;
    } catch (e) {
      throw Exception('Error editing Sale in Firestore: $e');
    }
  }
}
