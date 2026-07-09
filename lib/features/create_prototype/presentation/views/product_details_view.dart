import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/features/create_prototype/data/models/product_in_cart_model.dart';
import 'package:experience_app/features/create_prototype/data/models/product_model.dart';
import 'package:experience_app/features/create_prototype/presentation/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailsView extends ConsumerWidget {
  final ProductModel? product;

  const ProductDetailsView({super.key, this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (product == null) {
      return const Scaffold(body: Center(child: Text('No product found')));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageCarousel(product: product!),
            ProductDetailsContent(product: product!),
          ],
        ),
      ),
    );
  }
}

class ProductImageCarousel extends StatefulWidget {
  final ProductModel product;

  const ProductImageCarousel({super.key, required this.product});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 340,
          width: double.infinity,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: 4,
            itemBuilder: (context, index) {
              return Image.network(widget.product.imageUrl, fit: BoxFit.cover);
            },
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: GestureDetector(
            onTap: () {
              router.goNamed(Routes.ecommerceDashboard);
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.close, color: Colors.black),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _currentIndex
                      ? AppColors.btnBlue
                      : Colors.grey[300],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductDetailsContent extends ConsumerStatefulWidget {
  final ProductModel product;

  const ProductDetailsContent({super.key, required this.product});

  @override
  ConsumerState<ProductDetailsContent> createState() =>
      _ProductDetailsContentState();
}

class _ProductDetailsContentState extends ConsumerState<ProductDetailsContent> {
  String? _selectedSize;
  String? _selectedColor;

  // Mapeo de nombres de colores a Color objects
  final Map<String, Color> colorMap = {
    'red': Colors.red,
    'green': Colors.green,
    'blue': Colors.blue,
    'black': Colors.black,
    'white': Colors.white,
    'yellow': Colors.yellow,
    'orange': Colors.orange,
    'purple': Colors.purple,
    'pink': Colors.pink,
    'cyan': Colors.cyan,
  };

  @override
  void initState() {
    super.initState();
    _selectedSize = widget.product.sizes.isNotEmpty
        ? widget.product.sizes.first
        : null;
    _selectedColor = widget.product.colors.isNotEmpty
        ? widget.product.colors.first
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${widget.product.moneda}${widget.product.price.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            widget.product.description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 30),
          if (widget.product.sizes.isNotEmpty) ...[
            const Text(
              'Size',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.product.sizes.length,
                itemBuilder: (context, index) {
                  final size = widget.product.sizes[index];
                  final isSelected = size == _selectedSize;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSize = size;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? AppColors.btnBlue
                              : Colors.grey[300]!,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: isSelected
                            ? AppColors.btnBlue
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          size,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
          if (widget.product.colors.isNotEmpty) ...[
            const Text(
              'Color',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.product.colors.length,
                itemBuilder: (context, index) {
                  final colorName = widget.product.colors[index];
                  final isSelected = colorName == _selectedColor;
                  final colorValue =
                      colorMap[colorName.toLowerCase()] ?? Colors.grey;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = colorName;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorValue,
                        border: Border.all(
                          color: isSelected ? AppColors.btnBlue : Colors.grey,
                          width: isSelected ? 3 : 1,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                final newProduct = ProductInCartModel(
                  product: widget.product,
                  quantity: 1,
                  selectedSize: _selectedSize ?? '',
                  selectedColor: _selectedColor ?? '',
                  tax: 0,
                  discount: 0,
                  subtotal: widget.product.price,
                  totalPrice: widget.product.price,
                );
                ref.read(cartProvider.notifier).addProductToCart(newProduct);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to bag!'),
                    duration: Duration(seconds: 2),
                  ),
                );
                Future.delayed(const Duration(milliseconds: 500), () {
                  router.goNamed(Routes.ecommerceDashboard);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.btnBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Add to bag',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
