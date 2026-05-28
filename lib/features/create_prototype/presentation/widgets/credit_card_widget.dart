import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String currency;
  final bool isSelected;

  const CreditCardWidget({
    super.key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.currency,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue.shade100 : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              Icons.credit_card,
              color: isSelected ? Colors.blue : Colors.grey,
              size: 24,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardNumber,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$currency - Exp. $expiryDate',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
