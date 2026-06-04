import 'package:experience_app/core/consts.dart';
import 'package:dio/dio.dart';

class RemotePaymentDataSource {
  final Dio dioClient;

  RemotePaymentDataSource({Dio? dioClient}) : dioClient = dioClient ?? Dio();

  Future<Map<String, dynamic>> payment(Map<String, dynamic> data) async {
    try {
      final response = await dioClient.post(Consts.paymentEndpoint, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        return {
          'status': 'error',
          'message': 'Failed to process payment: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {'status': 'error', 'message': 'Failed to process payment: $e'};
    }
  }
}
