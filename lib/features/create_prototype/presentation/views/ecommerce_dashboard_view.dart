import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/assets/app_fontSize.dart';
import 'package:experience_app/core/assets/app_icons.dart';
import 'package:experience_app/features/create_prototype/presentation/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EcommerceDashboardView extends ConsumerWidget {
  const EcommerceDashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView(
        children: const [
          SizedBox(height: 30),
          IconNavigation(),
          SizedBox(height: 30),
          ItemsCarrousel(),
          SizedBox(height: 30),
          CategoryCarrousel(title: 'Perfect for you'),
        ],
      ),
    );
  }
}

class IconNavigation extends StatelessWidget {
  const IconNavigation({super.key});

  @override
  Widget build(BuildContext context) {
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
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(AppIcons.shoppingCart),
        ),
      ],
    );
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
  const CategoryCarrousel({super.key, required this.title});

  final String title;

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
            itemCount: 10,
            itemBuilder: (context, index) {
              return ProductWidget(
                productName: 'Product $index',
                price: 10.0 + index,
                imageUrl: 'assets/product_default.png',
                moneda: 'Q',
              );
            },
          ),
        ),
      ],
    );
  }
}
