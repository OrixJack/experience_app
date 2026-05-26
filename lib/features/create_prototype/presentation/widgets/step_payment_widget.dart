import 'package:experience_app/core/assets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StepPaymentWidget extends ConsumerWidget {
  const StepPaymentWidget({
    super.key,
    required this.title,
    required this.status,
    required this.number,
  });

  final String title;
  final bool status;
  final int number;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: status ? AppColors.btnBlue : AppColors.lightBlue,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: status
                  ? Text(
                      '$number',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : const Icon(
                      Icons.check,
                      color: AppColors.btnBlue,
                      size: 16,
                      weight: 900,
                    ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
