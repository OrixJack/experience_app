import 'package:experience_app/core/assets/app_fontSize.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:experience_app/features/create_prototype/data/models/sale_model.dart';
import 'package:experience_app/features/create_prototype/data/repositories/sales_repository_impl.dart';
import 'package:experience_app/features/create_prototype/presentation/widgets/detail_sale_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SalesHistoryView extends ConsumerWidget {
  const SalesHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesAsyncValue = ref.watch(salesProvider);

    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.arrow_back, size: 30),
                onPressed: () {
                  router.goNamed(Routes.ecommerceDashboard);
                },
              ),
              const SizedBox(width: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Sales History',
                  style: TextStyle(
                    fontSize: AppFontSize.title,
                    color: Colors.black,
                    fontWeight: AppFontSize.wtitle,
                  ),
                ),
              ),
            ],
          ),
          salesAsyncValue.when(
            data: (sales) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sales.length,
                itemBuilder: (context, index) {
                  final sale = sales[index];
                  return ListTile(
                    title: Text('Sale ID: ${sale.id}'),
                    subtitle: Text('Client ID: ${sale.idClient}'),
                    trailing: Text('Total: ${sale.total.toStringAsFixed(2)}'),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => DetailSaleModal(sale: sale),
                      );
                    },
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
          ),
        ],
      ),
    );
  }
}

final salesProvider = FutureProvider.autoDispose<List<SaleModel>>((ref) async {
  return SalesRepositoryImpl().getSalesHistory('client_id');
});
