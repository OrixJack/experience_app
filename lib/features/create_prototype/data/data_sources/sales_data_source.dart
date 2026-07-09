import 'package:experience_app/features/create_prototype/data/models/sale_model.dart';

interface class SalesDataSource {
  SalesDataSource();

  Future<List<SaleModel>> history(String idClient) async {
    return [];
  }

  Future<SaleModel> getSale(String idClient) async {
    return SaleModel(
      idClient: idClient,
      total: 0.0,
      date: '',
      moneda: '',
      products: [],
      discount: 0.0,
      typePayment: 0,
      last4Digits: 0,
      totalProducts: 0,
    );
  }

  Future<bool> addSale(SaleModel sale) async {
    return false;
  }

  Future<bool> updateSale(SaleModel sale) async {
    return false;
  }
}
