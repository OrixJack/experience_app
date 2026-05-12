import 'package:experience_app/core/assets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductWidget extends ConsumerWidget {
  const ProductWidget({
    super.key,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.moneda,
  });

  final String productName;
  final double price;
  final String imageUrl;
  final String moneda;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 120,
            color: AppColors.gray,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Text(
            productName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            '$moneda$price',
            style: TextStyle(fontSize: 14, color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
