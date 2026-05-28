// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditCardModel _$CreditCardModelFromJson(Map<String, dynamic> json) =>
    _CreditCardModel(
      cardNumber: json['cardNumber'] as String,
      cardHolderName: json['cardHolderName'] as String,
      expiryDate: json['expiryDate'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$CreditCardModelToJson(_CreditCardModel instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'cardHolderName': instance.cardHolderName,
      'expiryDate': instance.expiryDate,
      'currency': instance.currency,
    };
