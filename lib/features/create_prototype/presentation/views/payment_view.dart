import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:experience_app/features/create_prototype/presentation/providers/cart_provider.dart';
import 'package:experience_app/features/create_prototype/presentation/views/ecommerce_dashboard_view.dart';
import 'package:experience_app/features/create_prototype/presentation/widgets/step_payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentView extends ConsumerWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        // Aquí iría la implementación del proceso de pago, como formulario de tarjeta, resumen de compra, etc.
        // Por simplicidad, solo mostramos un mensaje de éxito.
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StepsPayment(),
                SizedBox(height: 10),
                Text(
                  'Choose a payment method',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Text(
                  'You won\'t be charged until you review the order on the next page',
                  style: TextStyle(fontSize: 12, color: AppColors.gray),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
