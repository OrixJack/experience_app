import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:experience_app/features/create_prototype/data/models/sale_model.dart';

part 'sales_state.freezed.dart';

@freezed
abstract class SalesState with _$SalesState {
  const factory SalesState.initial() = _Initial;

  const factory SalesState.loading({required List<SaleModel> sales}) = _Loading;

  const factory SalesState.loaded({required List<SaleModel> sales}) = _Loaded;

  const factory SalesState.error({required String message}) = _Error;
}
