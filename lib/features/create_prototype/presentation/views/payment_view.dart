import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:experience_app/features/create_prototype/data/models/credit_card_model.dart';
import 'package:experience_app/features/create_prototype/presentation/providers/cart_provider.dart';
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
  late CreditCardModel selectedCard;
  bool sameAsShippingAddress = true;

  // Datos de prueba (en el futuro vendrán del datasource)
  List<CreditCardModel> creditCards = [
    const CreditCardModel(
      cardNumber: '**** **** **** 1234',
      cardHolderName: 'Mastercard',
      expiryDate: '12/25',
      currency: 'USD',
    ),
    const CreditCardModel(
      cardNumber: '**** **** **** 9876',
      cardHolderName: 'Visa',
      expiryDate: '11/26',
      currency: 'USD',
    ),
  ];

  @override
  void initState() {
    super.initState();
    selectedCard = creditCards.first;
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartProvider);

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
            CreditCardOption(
              cards: creditCards,
              onCardSelected: (card) {
                setState(() {
                  selectedCard = card;
                });
              },
            ),
            GestureDetector(
              onTap: () {},
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
              onPressed: () {
                _processPayment();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
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

  void _processPayment() {
    print('Procesando pago con: $selectedPaymentMethod');
    if (selectedPaymentMethod == 'credit_card') {
      print('Tarjeta seleccionada: ${selectedCard.cardHolderName}');
      print('Número: ${selectedCard.cardNumber}');
      print('Vencimiento: ${selectedCard.expiryDate}');
    }
    print('Dirección de facturación igual a envío: $sameAsShippingAddress');
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
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue[50] : Colors.grey[50],
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey[300]!,
                  width: isSelected ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.2),
                          blurRadius: 8,
                          spreadRadius: 0,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : [],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            card.cardHolderName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            card.cardNumber,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.gray,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isSelected)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
