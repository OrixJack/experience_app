import 'dart:convert';
import 'package:experience_app/features/create_prototype/data/models/credit_card_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:experience_app/core/consts.dart';

class LocalCreditCardDataSource {
  final SharedPreferences sharedPreferences;

  LocalCreditCardDataSource(this.sharedPreferences);

  Future<void> saveCreditCards(List<CreditCardModel> cards) async {
    final cardsData = cards.map((card) => card.toJson()).toList();
    final jsonString = jsonEncode(cardsData);
    await sharedPreferences.setString(Consts.creditCardsDataKey, jsonString);
  }

  Future<List<CreditCardModel>> getCreditCards() async {
    final jsonString = sharedPreferences.getString(Consts.creditCardsDataKey);
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }
    try {
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList
          .map((item) => CreditCardModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error al decodificar tarjetas: $e');
      return [];
    }
  }

  Future<void> clearCreditCards() async {
    await sharedPreferences.remove(Consts.creditCardsDataKey);
  }
}
