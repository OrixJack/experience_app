import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/assets/app_fontSize.dart';
import 'package:experience_app/core/assets/app_icons.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:experience_app/features/create_prototype/data/models/product_model.dart';
import 'package:experience_app/features/create_prototype/data/repositories/products_repository_impl.dart';
import 'package:experience_app/features/create_prototype/presentation/providers/cart_provider.dart';
import 'package:experience_app/features/create_prototype/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EcommerceDashboardView extends ConsumerWidget {
  const EcommerceDashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 30),
          const IconNavigationWithCart(),
          const SizedBox(height: 30),
          const ItemsCarrousel(),
          const SizedBox(height: 30),
          CategoryCarrousel(title: 'Perfect for you'),
          const SizedBox(height: 30),
          CategoryCarrousel(title: 'For this summer'),
        ],
      ),
    );
  }
}

class IconNavigationWithCart extends ConsumerWidget {
  const IconNavigationWithCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartCount = ref.watch(cartProvider).products.length;
    return Row(
      children: [
        const SizedBox(width: 30),
        IconButton(
          onPressed: () {},
          icon: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(AppIcons.search, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(width: 30),
        IconButton(
          onPressed: () {},
          icon: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(AppIcons.favorite, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(width: 30),
        IconButton(
          onPressed: () {
            router.goNamed(Routes.crudProducts);
          },
          icon: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(AppIcons.pencil, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(width: 30),
        IconButton(
          onPressed: () {
            router.goNamed(Routes.salesHistory);
          },
          icon: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(AppIcons.history, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(width: 30),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                router.goNamed(Routes.cart);
              },
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(AppIcons.shoppingCart, fit: BoxFit.contain),
              ),
            ),
            if (cartCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    '$cartCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class IconNavigation extends StatelessWidget {
  const IconNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconNavigationWithCart();
  }
}

class ItemsCarrousel extends StatelessWidget {
  const ItemsCarrousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 214,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 1,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: const BoxDecoration(color: AppColors.blueSky),
            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: const TextStyle(
                  fontSize: AppFontSize.body,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

final productsProvider = FutureProvider.autoDispose<List<ProductModel>>((
  ref,
) async {
  return ProductsRepositoryImpl().fetchProducts();
});

class CategoryCarrousel extends ConsumerWidget {
  CategoryCarrousel({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 189,
          child: productsAsyncValue.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Center(child: Text('Error: $error')),
            data: (products) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductWidget(
                  onTap: () {
                    router.goNamed(Routes.productDetails, extra: product);
                  },
                  productName: product.name,
                  price: product.price,
                  imageUrl: product.imageUrl,
                  moneda: product.moneda,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
