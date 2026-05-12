import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/assets/app_fontSize.dart';
import 'package:experience_app/core/assets/app_icons.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:experience_app/features/create_prototype/domain/models/product_model.dart';
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
    final cartCount = ref.watch(cartCountProvider);
    return Row(
      children: [
        const SizedBox(width: 30),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(AppIcons.search),
        ),
        const SizedBox(width: 30),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(AppIcons.favorite),
        ),
        const SizedBox(width: 30),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(AppIcons.shoppingCart),
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
            decoration: BoxDecoration(color: AppColors.blueSky),
            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: TextStyle(
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

class CategoryCarrousel extends StatelessWidget {
  CategoryCarrousel({super.key, required this.title});

  final String title;
  final List<ProductModel> products = List.generate(
    10,
    (index) => ProductModel(
      name: 'Product $index',
      price: 10.0 + index,
      imageUrl: 'assets/product_default.png',
      moneda: 'Q',
      description: 'Description for product $index',
      sizes: ['S', 'M', 'L'],
      colors: [Colors.red, Colors.green, Colors.blue],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 189,
          child: ListView.builder(
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
      ],
    );
  }
}
