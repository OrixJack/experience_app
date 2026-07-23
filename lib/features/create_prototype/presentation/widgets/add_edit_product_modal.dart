import 'dart:typed_data';

import 'package:experience_app/core/assets/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/repositories/local_image_repository_impl.dart';
import 'package:experience_app/features/create_prototype/data/models/product_model.dart';
import 'package:experience_app/features/create_prototype/data/repositories/products_repository_impl.dart';
import 'package:experience_app/features/create_prototype/presentation/views/crud_products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddEditProductModal extends ConsumerStatefulWidget {
  final VoidCallback? onProductChange;
  final ProductModel? product;
  final bool isEditMode;

  const AddEditProductModal({super.key, this.onProductChange, this.product})
    : isEditMode = product != null;

  @override
  ConsumerState<AddEditProductModal> createState() =>
      _AddEditProductModalState();
}

class _AddEditProductModalState extends ConsumerState<AddEditProductModal> {
  final _formKey = GlobalKey<FormState>();
  XFile? _imageFile;
  Uint8List? _imageBytes; // Para almacenar bytes de imagen en web
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _imageUrlController;
  late TextEditingController _monedaController;
  late TextEditingController _descriptionController;

  bool _isLoading = false;
  bool _hasNewImage = false; // Indica si se seleccionó una imagen nueva

  AsyncValue<List<ProductModel>> get productsAsyncValue =>
      ref.watch(productsProvider);
  bool get isEditMode => widget.isEditMode;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.name ?? '');
    _priceController = TextEditingController(
      text: widget.product?.price.toString() ?? '',
    );
    _imageUrlController = TextEditingController(
      text: widget.product?.imageUrl ?? '',
    );
    _monedaController = TextEditingController(
      text: widget.product?.moneda ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.product?.description ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _imageUrlController.dispose();
    _monedaController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _addProduct() async {
    if (_formKey.currentState!.validate()) {
      // Validar que se haya seleccionado una imagen
      if (_imageFile == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Por favor selecciona una imagen para el producto'),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      setState(() {
        _isLoading = true;
      });

      try {
        final newProduct = ProductModel(
          name: _nameController.text,
          price: double.tryParse(_priceController.text) ?? 0.0,
          imageUrl: _imageUrlController.text,
          moneda: _monedaController.text,
          description: _descriptionController.text,
        );

        await ProductsRepositoryImpl().addProduct(newProduct, _imageFile!);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Producto agregado exitosamente'),
              backgroundColor: Colors.green,
            ),
          );
          widget.onProductChange?.call();
          Navigator.of(context).pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al agregar producto: $e'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  Future<void> _editProduct() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final newProduct = ProductModel(
          id: widget.product?.id ?? '',
          name: _nameController.text,
          price: double.tryParse(_priceController.text) ?? 0.0,
          imageUrl: _imageUrlController.text,
          moneda: _monedaController.text,
          description: _descriptionController.text,
        );

        await ProductsRepositoryImpl().editProduct(newProduct);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Producto actualizado exitosamente'),
              backgroundColor: Colors.green,
            ),
          );
          widget.onProductChange?.call();
          Navigator.of(context).pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al editar producto: $e'),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.of(context).pop();
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  Widget _buildImagePreview() {
    // Mostrar preview de imagen nueva en web
    if (_hasNewImage && _imageBytes != null) {
      return Image.memory(
        _imageBytes!,
        height: 150,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }

    // Mostrar URL existente
    if (_imageUrlController.text.isNotEmpty && !_hasNewImage) {
      return Image.network(
        _imageUrlController.text,
        height: 150,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 150,
            width: double.infinity,
            color: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.broken_image, size: 50, color: Colors.red),
                const SizedBox(height: 8),
                const Text(
                  'Error al cargar imagen',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: 150,
            width: double.infinity,
            color: Colors.grey[300],
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
      );
    }

    // Mostrar placeholder
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.grey[300],
      child: const Icon(Icons.image, size: 50, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEditMode ? 'Edit Product' : 'Add New Product',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  hintText: 'Enter product name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.add_box_sharp),
                ),
                keyboardType: TextInputType.text,
                maxLength: 50,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product name is required';
                  }
                  if (value.length < 2) {
                    return 'Please enter a valid product name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Stack(
                children: [
                  _buildImagePreview(),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.blueSky,
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        onTap: () async {
                          _imageFile = await LocalImageRepositoryImpl()
                              .saveLocalImage();
                          if (_imageFile != null) {
                            // Obtener bytes para preview en web
                            if (kIsWeb) {
                              _imageBytes = await _imageFile!.readAsBytes();
                            }
                            setState(() {
                              _hasNewImage = true;
                              // En web, no mostramos el path, solo los bytes
                              if (!kIsWeb) {
                                _imageUrlController.text = _imageFile!.path;
                              }
                            });
                          }
                        },
                        child: const Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _priceController,
                      decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.attach_money),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price is required';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid price';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _monedaController,
                      decoration: InputDecoration(
                        labelText: 'Currency',
                        hintText: 'e.g. USD',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.attach_money),
                      ),
                      keyboardType: TextInputType.text,
                      maxLength: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Currency is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter product description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.description),
                ),
                keyboardType: TextInputType.text,
                maxLength: 200,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description is required';
                  }
                  if (value.length < 5) {
                    return 'Please enter a valid description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : isEditMode
                      ? _editProduct
                      : _addProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          isEditMode ? 'Update Product' : 'Add Product',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
