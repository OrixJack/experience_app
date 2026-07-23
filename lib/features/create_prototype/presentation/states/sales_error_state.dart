import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:experience_app/features/create_prototype/data/models/sale_model.dart';

part 'sales_error_state.freezed.dart';

@freezed
abstract class SalesErrorState with _$SalesErrorState {
  const factory SalesErrorState.initial() = _Initial;

  const factory SalesErrorState.loading({required List<SaleModel> sales}) =
      _Loading;

  const factory SalesErrorState.loaded({required List<SaleModel> sales}) =
      _Loaded;

  const factory SalesErrorState.error({required String message}) = _Error;
}
