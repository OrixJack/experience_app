import 'dart:async';
import 'package:experience_app/features/create_prototype/data/repositories/sales_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:experience_app/features/create_prototype/presentation/states/sales_state.dart';

final salesProvider = StateNotifierProvider<SalesNotifier, SalesState>(
  (ref) => SalesNotifier(),
);

class SalesNotifier extends StateNotifier<SalesState> {
  SalesNotifier({SalesRepositoryImpl? getSalesStreamUseCase})
    : _getSalesStreamUseCase = getSalesStreamUseCase ?? SalesRepositoryImpl(),
      super(SalesState.initial()) {
    initSubscription();
  }

  final SalesRepositoryImpl _getSalesStreamUseCase;

  StreamSubscription? _subscription;

  Future<void> initSubscription() async {
    state = SalesState.loading(sales: []);

    try {
      _subscription = _getSalesStreamUseCase
          .getSalesHistory('client_id')
          .listen((sales) {
            state = SalesState.loaded(sales: sales);
          });
    } catch (e) {
      state = SalesState.error(message: 'Error al cargar ventas realizadas');
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
