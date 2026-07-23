import 'dart:async';
import 'package:experience_app/features/create_prototype/data/repositories/sales_repository_impl.dart';
import 'package:experience_app/features/create_prototype/presentation/states/sales_error_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final salesErrorProvider =
    StateNotifierProvider<SalesErrorNotifier, SalesErrorState>(
      (ref) => SalesErrorNotifier(),
    );

class SalesErrorNotifier extends StateNotifier<SalesErrorState> {
  SalesErrorNotifier({SalesRepositoryImpl? getSalesStreamUseCase})
    : _getSalesStreamUseCase = getSalesStreamUseCase ?? SalesRepositoryImpl(),
      super(SalesErrorState.initial()) {
    initSubscription();
  }

  final SalesRepositoryImpl _getSalesStreamUseCase;

  StreamSubscription? _subscription;

  Future<void> initSubscription() async {
    state = SalesErrorState.loading(sales: []);

    try {
      _subscription = _getSalesStreamUseCase
          .getSalesHistoryFailed('client_id')
          .listen((sales) {
            state = SalesErrorState.loaded(sales: sales);
          });
    } catch (e) {
      state = SalesErrorState.error(
        message: 'Error al cargar compras fallidas: ' + e.toString(),
      );
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
