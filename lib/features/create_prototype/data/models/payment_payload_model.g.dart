// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentPayloadModel _$PaymentPayloadModelFromJson(Map<String, dynamic> json) =>
    _PaymentPayloadModel(
      amount: (json['amount'] as num).toDouble(),
      cardNumber: json['cardNumber'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$PaymentPayloadModelToJson(
  _PaymentPayloadModel instance,
) => <String, dynamic>{
  'amount': instance.amount,
  'cardNumber': instance.cardNumber,
  'currency': instance.currency,
};
