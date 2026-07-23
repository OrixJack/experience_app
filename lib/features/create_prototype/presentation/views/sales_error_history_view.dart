import 'package:experience_app/core/assets/app_fontSize.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:experience_app/features/create_prototype/presentation/providers/sales_error_provider.dart';
import 'package:experience_app/features/create_prototype/presentation/states/sales_error_state.dart';
import 'package:experience_app/features/create_prototype/presentation/widgets/detail_sale_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SalesErrorHistoryView extends ConsumerWidget {
  const SalesErrorHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesAsyncValue = ref.watch(salesErrorProvider);

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
                  router.goNamed(Routes.salesHistory);
                },
              ),
              const SizedBox(width: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Failed Sales History',
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
            initial: () => const SizedBox.shrink(),
            loading: (sales) =>
                const Center(child: CircularProgressIndicator()),
            loaded: (sales) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sales.length,
                itemBuilder: (context, index) {
                  final sale = sales[index];
                  return ListTile(
                    title: Text('Sale ID: ${sale.id}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Client ID: ${sale.idClient}'),
                        Text('Reason: ${sale.errorMessage}'),
                        Text('Card: **** **** **** ${sale.last4Digits}'),
                      ],
                    ),
                    subtitleTextStyle: const TextStyle(color: Colors.red),
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
            error: (error) => Center(child: Text('Error: $error')),
          ),
        ],
      ),
    );
  }
}
