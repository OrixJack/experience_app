import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_model.freezed.dart';
part 'credit_card_model.g.dart';

@freezed
abstract class CreditCardModel with _$CreditCardModel {
  const factory CreditCardModel({
    required String cardNumber,
    required String cardHolderName,
    required String expiryDate,
    required String currency,
  }) = _CreditCardModel;

  factory CreditCardModel.fromJson(Map<String, Object?> json) =>
      _$CreditCardModelFromJson(json);
}
