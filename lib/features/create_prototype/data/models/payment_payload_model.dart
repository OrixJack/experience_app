import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_payload_model.freezed.dart';
part 'payment_payload_model.g.dart';

@freezed
abstract class PaymentPayloadModel with _$PaymentPayloadModel {
  const factory PaymentPayloadModel({
    required double amount,
    required String cardNumber,
    required String currency,
  }) = _PaymentPayloadModel;

  factory PaymentPayloadModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentPayloadModelFromJson(json);
}
