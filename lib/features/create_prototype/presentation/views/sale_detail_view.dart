import 'package:experience_app/features/create_prototype/data/models/sale_model.dart';
import 'package:experience_app/features/create_prototype/data/repositories/sales_repository_impl.dart';
import 'package:experience_app/features/create_prototype/presentation/widgets/detail_sale_modal.dart';
import 'package:flutter/material.dart';

class SaleDetailView extends StatefulWidget {
  final String saleId;

  const SaleDetailView({super.key, required this.saleId});

  @override
  State<SaleDetailView> createState() => _SaleDetailViewState();
}

class _SaleDetailViewState extends State<SaleDetailView> {
  late final Future<SaleModel> _saleFuture;

  @override
  void initState() {
    super.initState();
    _saleFuture = SalesRepositoryImpl().getSale(widget.saleId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de venta')),
      body: FutureBuilder<SaleModel>(
        future: _saleFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return Center(
              child: Text('No se pudo cargar la venta ${widget.saleId}'),
            );
          }
          return DetailSaleModal(sale: snapshot.data);
        },
      ),
    );
  }
}
