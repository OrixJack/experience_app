import 'package:flutter/material.dart';

/// Renderiza la imagen de un producto soportando tanto rutas de assets
/// locales (ej. 'assets/product_default.png') como URLs remotas
/// (ej. una URL de descarga de Firebase Storage).
class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.errorBuilder,
    this.loadingBuilder,
  });

  final String imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  final Widget Function(BuildContext, Widget, ImageChunkEvent?)?
  loadingBuilder;

  bool get _isAsset => imageUrl.startsWith('assets/');

  @override
  Widget build(BuildContext context) {
    if (_isAsset) {
      // Image.asset no soporta loadingBuilder (se carga de forma síncrona
      // desde el bundle de la app, no requiere indicador de progreso).
      return Image.asset(
        imageUrl,
        fit: fit,
        height: height,
        width: width,
        errorBuilder: errorBuilder,
      );
    }
    return Image.network(
      imageUrl,
      fit: fit,
      height: height,
      width: width,
      errorBuilder: errorBuilder,
      loadingBuilder: loadingBuilder,
    );
  }
}
