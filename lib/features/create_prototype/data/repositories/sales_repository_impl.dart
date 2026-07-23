import 'package:experience_app/features/create_prototype/domain/repositories/sales_repository.dart';
import 'package:experience_app/features/create_prototype/data/data_sources/firebase_sale_data_source.dart';
import 'package:experience_app/features/create_prototype/data/models/sale_model.dart';

class SalesRepositoryImpl extends SalesRepository {
  final FirebaseSaleDataSource firebaseSaleDataSource =
      FirebaseSaleDataSource();

  @override
  Stream<List<SaleModel>> getSalesHistory(String idClient) {
    return firebaseSaleDataSource.history(idClient);
  }

  @override
  Stream<List<SaleModel>> getSalesHistoryFailed(String idClient) {
    return firebaseSaleDataSource.historyFailed(idClient);
  }

  @override
  Future<SaleModel> getSale(String idSale) async {
    return await firebaseSaleDataSource.getSale(idSale);
  }

  @override
  Future<bool> addSale(SaleModel sale) async {
    return await firebaseSaleDataSource.addSale(sale);
  }

  @override
  Future<bool> addSaleError(SaleModel sale) async {
    return await firebaseSaleDataSource.addSaleError(sale);
  }

  @override
  Future<bool> updateSale(SaleModel sale) async {
    return await firebaseSaleDataSource.updateSale(sale);
  }
}
