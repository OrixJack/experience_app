import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String currency;
  final bool isSelected;

  CreditCardWidget({
    super.key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.currency,
    this.isSelected = false,
  });

  final Map<String, RegExp> cardType = {
    'Visa': RegExp(r'^4[0-9]{12}(?:[0-9]{3})?$'),
    'MasterCard': RegExp(
      r'^(5[1-5][0-9]{14}|2(2[2-9][0-9]{12}|[3-6][0-9]{13}|7[01][0-9]{12}|720[0-9]{12}))$',
    ),
    'American Express': RegExp(r'^3[47][0 -9]{13}$'),
    'Discover': RegExp(r'^6(?:011|5[0-9]{2})[0-9]{12}$'),
  };

  /// Limpia espacios y caracteres especiales del número de tarjeta
  String _cleanCardNumber(String cardNum) {
    return cardNum.replaceAll(RegExp(r'[^0-9]'), '');
  }

  /// Detecta el tipo de tarjeta basado en el número
  String _getCardType() {
    final cleanNumber = _cleanCardNumber(cardNumber);
    return cardType.entries
        .firstWhere(
          (entry) => entry.value.hasMatch(cleanNumber),
          orElse: () => MapEntry('Unknown', RegExp('')),
        )
        .key;
  }

  @override
  Widget build(BuildContext context) {
    final detectedCardType = _getCardType();

    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$detectedCardType - $cardHolderName',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$currency - Exp. $expiryDate',
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.white70 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
