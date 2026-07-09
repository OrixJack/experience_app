import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:experience_app/features/create_prototype/data/models/credit_card_model.dart';
import 'package:experience_app/features/create_prototype/data/models/payment_payload_model.dart';
import 'package:experience_app/features/create_prototype/data/models/sale_model.dart';
import 'package:experience_app/features/create_prototype/data/repositories/process_payment_repository_impl.dart';
import 'package:experience_app/features/create_prototype/data/repositories/sales_repository_impl.dart';
import 'package:experience_app/features/create_prototype/presentation/providers/cart_provider.dart';
import 'package:experience_app/features/create_prototype/presentation/providers/credit_card_provider.dart';
import 'package:experience_app/features/create_prototype/presentation/widgets/add_credit_card_modal.dart';
import 'package:experience_app/features/create_prototype/presentation/widgets/credit_card_widget.dart';
import 'package:experience_app/features/create_prototype/presentation/widgets/step_payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentView extends ConsumerStatefulWidget {
  const PaymentView({super.key});

  @override
  ConsumerState<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends ConsumerState<PaymentView> {
  String selectedPaymentMethod = 'credit_card';
  CreditCardModel? selectedCard;
  bool sameAsShippingAddress = true;
  bool isLoading = false;

  // Datos de prueba (en el futuro vendrán del datasource)
  List<CreditCardModel> initialCards = [
    const CreditCardModel(
      cardNumber: '4242 4242 4242 2211',
      cardHolderName: 'No Funciona',
      expiryDate: '12/25',
      currency: 'USD',
    ),
    const CreditCardModel(
      cardNumber: '4111 1111 1111 1111',
      cardHolderName: 'Con 50 de fondo',
      expiryDate: '11/26',
      currency: 'USD',
    ),
  ];

  @override
  void initState() {
    super.initState();
    // Se inicializará cuando se acceda al primer widget que lo use
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartProvider);
    final creditCards = List<CreditCardModel>.from({
      ...initialCards,
      ...ref.watch(creditCardProvider),
    });

    // Establecer la tarjeta seleccionada si no hay una seleccionada
    if (creditCards.isNotEmpty && selectedCard == null) {
      selectedCard = creditCards.first;
    } else if (selectedCard != null && !creditCards.contains(selectedCard)) {
      selectedCard = creditCards.isNotEmpty ? creditCards.first : null;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => router.goNamed(Routes.cart),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const StepsPayment(),
          const SizedBox(height: 24),
          const Text(
            'Choose a payment method',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 8),
          const Text(
            'You won\'t be charged until you review the order on the next page',
            style: TextStyle(fontSize: 12, color: AppColors.gray),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 20),
          _buildPaymentMethodOption(
            title: 'Credit Card',
            value: 'credit_card',
            isSelected: selectedPaymentMethod == 'credit_card',
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          ),
          if (selectedPaymentMethod == 'credit_card') ...[
            const SizedBox(height: 12),
            if (creditCards.isEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'No credit cards added yet. Tap "Add new card" to get started.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              )
            else
              CreditCardOption(
                cards: creditCards,
                onCardSelected: (card) {
                  setState(() {
                    selectedCard = card;
                  });
                },
              ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => AddCreditCardModal(
                    onCardAdded: () {
                      setState(() {});
                    },
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  '+ Add new card',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          _buildPaymentMethodOption(
            title: 'Apple Pay',
            value: 'apple_pay',
            isSelected: selectedPaymentMethod == 'apple_pay',
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: sameAsShippingAddress,
                onChanged: (value) {
                  setState(() {
                    sameAsShippingAddress = value!;
                  });
                },
                activeColor: Colors.blue,
              ),
              const Expanded(
                child: Text(
                  'My billing address is the same as my shipping address',
                  style: TextStyle(fontSize: 12, color: AppColors.gray),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      _processPayment(cartState);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      'Process Payment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodOption({
    required String title,
    required String value,
    required bool isSelected,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: RadioListTile<String>(
        title: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        value: value,
        groupValue: selectedPaymentMethod,
        onChanged: onChanged,
        activeColor: Colors.blue,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }

  void _processPayment(cartState) {
    if (cartState.products.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('El carrito está vacío'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Validar que haya una tarjeta seleccionada
    if (selectedCard == null || selectedCard!.cardNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor selecciona una tarjeta de crédito'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    final PaymentPayloadModel paymentData = PaymentPayloadModel(
      amount: cartState.totalPrice,
      cardNumber: selectedCard!.cardNumber,
      currency: selectedCard!.currency,
    );

    //construyendo el modelo de venta para guardar en el historial
    final finalSale = SaleModel(
      id: '',
      idClient: 'client_id',
      total: cartState.totalPrice,
      date: DateTime.now().toIso8601String(),
      moneda: selectedCard!.currency,
      products: cartState.products,
      discount: 0.0,
      totalProducts: cartState.products.length,
      typePayment: 1, // 1 para tarjeta de crédito
      last4Digits: int.parse(
        selectedCard!.cardNumber.substring(selectedCard!.cardNumber.length - 4),
      ),
    );

    // Llamando al datasource para procesar el pago
    ProcessPaymentRepositoryImpl()
        .processPayment(paymentData)
        .then((result) {
          if (result['status'] == 'approved') {
            //guardar la venta en el historial de ventas
            SalesRepositoryImpl().addSale(finalSale);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(result['message']),
                backgroundColor: Colors.green,
              ),
            );
            // Limpiar el carrito
            ref.read(cartProvider.notifier).clearCart();
            router.goNamed(Routes.ecommerceDashboard);
          } else {
            //guardar la venta en el historial de ventas con error
            final errorSale = finalSale.copyWith(
              status: 'error',
              errorMessage: result['message'] ?? 'Unknown error',
            );
            SalesRepositoryImpl().addSaleError(errorSale);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(result['message']),
                backgroundColor: Colors.red,
              ),
            );
          }
        })
        .catchError((error) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: $error'),
              backgroundColor: Colors.red,
            ),
          );
        });
  }
}

class StepsPayment extends StatelessWidget {
  const StepsPayment({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> steps = ['Your bag', 'Shipping', 'Payment'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: steps.map((step) {
          int index = steps.indexOf(step);
          bool isActive = index == 2; // El paso actual es "Payment"
          StepPaymentWidget stepWidget = StepPaymentWidget(
            title: step,
            status: isActive,
            number: index + 1,
          );
          return stepWidget;
        }).toList(),
      ),
    );
  }
}

class CreditCardOption extends StatefulWidget {
  final List<CreditCardModel> cards;
  final Function(CreditCardModel)? onCardSelected;

  const CreditCardOption({super.key, required this.cards, this.onCardSelected});

  @override
  State<CreditCardOption> createState() => _CreditCardOptionState();
}

class _CreditCardOptionState extends State<CreditCardOption> {
  int selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.cards.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(widget.cards.length, (index) {
        final card = widget.cards[index];
        final isSelected = selectedCardIndex == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedCardIndex = index;
            });
            widget.onCardSelected?.call(card);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: CreditCardWidget(
              cardNumber: card.cardNumber,
              cardHolderName: card.cardHolderName,
              expiryDate: card.expiryDate,
              currency: card.currency,
              isSelected: isSelected,
            ),
          ),
        );
      }),
    );
  }
}
