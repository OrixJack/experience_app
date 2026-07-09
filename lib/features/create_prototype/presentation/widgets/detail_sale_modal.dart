import 'package:experience_app/features/create_prototype/data/models/sale_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailSaleModal extends ConsumerStatefulWidget {
  final SaleModel? sale;
  const DetailSaleModal({super.key, this.sale});

  @override
  ConsumerState<DetailSaleModal> createState() => _DetailSaleModalState();
}

class _DetailSaleModalState extends ConsumerState<DetailSaleModal> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _idController;
  late TextEditingController _clientIdController;
  late TextEditingController _monedaController;
  late TextEditingController _totalController;
  late TextEditingController _discountController;
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController(text: widget.sale?.id ?? '');
    _clientIdController = TextEditingController(
      text: widget.sale?.idClient ?? '',
    );
    _monedaController = TextEditingController(text: widget.sale?.moneda ?? '');
    _totalController = TextEditingController(
      text: widget.sale?.total.toString() ?? '',
    );
    _discountController = TextEditingController(
      text: widget.sale?.discount.toString() ?? '',
    );
    _dateController = TextEditingController(text: widget.sale?.date ?? '');
  }

  @override
  void dispose() {
    _idController.dispose();
    _clientIdController.dispose();
    _monedaController.dispose();
    _totalController.dispose();
    _discountController.dispose();
    _dateController.dispose();
    super.dispose();
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
              const Text(
                'Detail Sale',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: 'ID',
                  hintText: 'No ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.key),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _clientIdController,
                decoration: InputDecoration(
                  labelText: 'Client ID',
                  hintText: 'No Client ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _monedaController,
                      decoration: InputDecoration(
                        labelText: 'Currency',
                        hintText: 'No Currency',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _discountController,
                      decoration: InputDecoration(
                        labelText: 'Discount',
                        hintText: 'No Discount',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _totalController,
                      decoration: InputDecoration(
                        labelText: 'Total',
                        hintText: 'No Total',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  hintText: 'No Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.calendar_today),
                ),
                keyboardType: TextInputType.datetime,
                readOnly: true,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: TextEditingController(
                  text:
                      widget.sale?.products
                          .map(
                            (product) =>
                                '(x${product.quantity})${product.product.name} (${product.product.moneda}${product.product.price})',
                          )
                          .join(', ') ??
                      '',
                ),
                decoration: InputDecoration(
                  labelText: 'Products',
                  hintText: 'No Products',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.shopping_cart),
                ),
                readOnly: true,
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
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
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
