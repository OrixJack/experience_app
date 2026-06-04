import 'package:experience_app/features/create_prototype/data/data_sources/local_credit_card_data_source.dart';
import 'package:experience_app/features/create_prototype/data/models/credit_card_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Provider simple para SharedPreferences
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((
  ref,
) async {
  return await SharedPreferences.getInstance();
});

final creditCardProvider =
    StateNotifierProvider<CreditCardNotifier, List<CreditCardModel>>((ref) {
      return CreditCardNotifier(ref);
    });

class CreditCardNotifier extends StateNotifier<List<CreditCardModel>> {
  final Ref ref;
  LocalCreditCardDataSource? _dataSource;

  CreditCardNotifier(this.ref) : super([]) {
    _initializeAndLoad();
  }

  Future<void> _initializeAndLoad() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _dataSource = LocalCreditCardDataSource(prefs);

      // Cargar tarjetas guardadas
      final savedCards = await _dataSource!.getCreditCards();
      state = savedCards;
    } catch (e) {
      print('Error inicializando tarjetas: $e');
    }
  }

  Future<void> _saveCards() async {
    if (_dataSource == null) return;
    try {
      await _dataSource!.saveCreditCards(state);
    } catch (e) {
      print('Error guardando tarjetas: $e');
    }
  }

  Future<void> addCreditCard(CreditCardModel card) async {
    // Evitar duplicados
    final exists = state.any((c) => c.cardNumber == card.cardNumber);
    if (!exists) {
      state = [...state, card];
      await _saveCards();
    }
  }

  Future<void> removeCreditCard(String cardNumber) async {
    state = state.where((card) => card.cardNumber != cardNumber).toList();
    await _saveCards();
  }

  Future<void> clearCreditCards() async {
    state = [];
    if (_dataSource != null) {
      await _dataSource!.clearCreditCards();
    }
  }
}
