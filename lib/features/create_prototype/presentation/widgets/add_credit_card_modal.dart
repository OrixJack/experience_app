import 'package:experience_app/features/create_prototype/data/models/credit_card_model.dart';
import 'package:experience_app/features/create_prototype/presentation/providers/credit_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCreditCardModal extends ConsumerStatefulWidget {
  final VoidCallback? onCardAdded;

  const AddCreditCardModal({super.key, this.onCardAdded});

  @override
  ConsumerState<AddCreditCardModal> createState() => _AddCreditCardModalState();
}

class _AddCreditCardModalState extends ConsumerState<AddCreditCardModal> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _cardNumberController;
  late TextEditingController _cardHolderController;
  late TextEditingController _expiryDateController;
  late TextEditingController _currencyController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _cardNumberController = TextEditingController();
    _cardHolderController = TextEditingController();
    _expiryDateController = TextEditingController();
    _currencyController = TextEditingController(text: 'USD');
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderController.dispose();
    _expiryDateController.dispose();
    _currencyController.dispose();
    super.dispose();
  }

  void _formatCardNumber(String value) {
    // Remover espacios y caracteres especiales
    String cleanValue = value.replaceAll(RegExp(r'[^0-9]'), '');

    // Limitar a 16 dígitos
    if (cleanValue.length > 16) {
      cleanValue = cleanValue.substring(0, 16);
    }

    // Formatear con espacios cada 4 dígitos
    if (cleanValue.isNotEmpty) {
      final formatted = cleanValue
          .replaceAllMapped(
            RegExp(r'(.{1,4})'),
            (match) => '${match.group(0)} ',
          )
          .trim();
      _cardNumberController.value = _cardNumberController.value.copyWith(
        text: formatted,
        selection: TextSelection.fromPosition(
          TextPosition(offset: formatted.length),
        ),
      );
    }
  }

  void _formatExpiryDate(String value) {
    String cleanValue = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanValue.length > 4) {
      cleanValue = cleanValue.substring(0, 4);
    }

    if (cleanValue.length >= 2) {
      final formatted =
          '${cleanValue.substring(0, 2)}/${cleanValue.substring(2)}';
      _expiryDateController.value = _expiryDateController.value.copyWith(
        text: formatted,
        selection: TextSelection.fromPosition(
          TextPosition(offset: formatted.length),
        ),
      );
    }
  }

  Future<void> _addCard() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final newCard = CreditCardModel(
          cardNumber: _cardNumberController.text,
          cardHolderName: _cardHolderController.text,
          expiryDate: _expiryDateController.text,
          currency: _currencyController.text,
        );

        await ref.read(creditCardProvider.notifier).addCreditCard(newCard);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tarjeta agregada exitosamente'),
              backgroundColor: Colors.green,
            ),
          );
          widget.onCardAdded?.call();
          Navigator.of(context).pop();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error al agregar tarjeta: $e'),
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
                'Add New Credit Card',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  hintText: '0000 0000 0000 0000',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.credit_card),
                ),
                keyboardType: TextInputType.number,
                maxLength: 19,
                onChanged: _formatCardNumber,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Card number is required';
                  }
                  final cleanNumber = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (cleanNumber.length != 16) {
                    return 'Card number must be 16 digits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _cardHolderController,
                decoration: InputDecoration(
                  labelText: 'Card Holder Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Card holder name is required';
                  }
                  if (value.length < 2) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _expiryDateController,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                        hintText: 'MM/YY',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: const Icon(Icons.calendar_today),
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 5,
                      onChanged: _formatExpiryDate,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Expiry date is required';
                        }
                        if (!value.contains('/') || value.length != 5) {
                          return 'Use MM/YY format';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _currencyController,
                      decoration: InputDecoration(
                        labelText: 'Currency',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _addCard,
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
                      : const Text(
                          'Add Card',
                          style: TextStyle(
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
