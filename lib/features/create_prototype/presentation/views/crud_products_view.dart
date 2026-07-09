import 'package:experience_app/core/assets/app_fontSize.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:experience_app/features/create_prototype/data/models/product_model.dart';
import 'package:experience_app/features/create_prototype/data/repositories/products_repository_impl.dart';
import 'package:experience_app/features/create_prototype/presentation/widgets/add_edit_product_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CrudProductsView extends ConsumerWidget {
  const CrudProductsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productsProvider);

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
                  'My Products',
                  style: TextStyle(
                    fontSize: AppFontSize.title,
                    color: Colors.black,
                    fontWeight: AppFontSize.wtitle,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => AddEditProductModal(
                      onProductChange: () => ref.refresh(productsProvider),
                    ),
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 30),
                    SizedBox(width: 8),
                    Text('Add Product'),
                  ],
                ),
              ),
            ],
          ),
          productsAsyncValue.when(
            data: (products) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.description),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => AddEditProductModal(
                            product: product,
                            onProductChange: () =>
                                ref.refresh(productsProvider),
                          ),
                        );
                      },
                    ),
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

final productsProvider = FutureProvider.autoDispose<List<ProductModel>>((
  ref,
) async {
  return ProductsRepositoryImpl().fetchProducts();
});
