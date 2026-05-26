import 'package:experience_app/core/consts.dart';
import 'package:dio/dio.dart';

class RemotePaymentDataSource {
  final Dio dioClient;

  RemotePaymentDataSource(this.dioClient);

  Future<bool> payment() async {
    try {
      final response = await dioClient.get(Consts.paymentEndpoint);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error in payment request: $e');
      return false;
    }
  }
}
