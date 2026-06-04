import 'package:experience_app/features/create_prototype/data/data_sources/remote_payment_data_source.dart';
import 'package:experience_app/features/create_prototype/data/models/payment_payload_model.dart';
import 'package:experience_app/features/create_prototype/domain/repositories/process_payment_repository.dart';

class ProcessPaymentRepositoryImpl extends ProcessPaymentRepository {
  ProcessPaymentRepositoryImpl() : super();

  final RemotePaymentDataSource _remotePaymentDataSource =
      RemotePaymentDataSource();

  @override
  Future<Map<String, dynamic>> processPayment(
    PaymentPayloadModel payload,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      return await _remotePaymentDataSource.payment(payload.toJson());
    } catch (e) {
      return {'status': 'error', 'message': 'Failed to process payment: $e'};
    }
  }
}
