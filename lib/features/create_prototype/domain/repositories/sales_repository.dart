import 'package:experience_app/features/create_prototype/data/models/sale_model.dart';

abstract class SalesRepository {
  Future<SaleModel> getSale(String idSale);
  Future<List<SaleModel>> getSalesHistory(String idClient);
  Future<bool> addSale(SaleModel sale);
  Future<bool> updateSale(SaleModel sale);
}
