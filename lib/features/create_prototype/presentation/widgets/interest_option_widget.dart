import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/assets/app_fontSize.dart';
import 'package:flutter/material.dart';

class InterestOptionWidget extends StatelessWidget {
  const InterestOptionWidget({super.key, required this.interest});

  final String interest;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.gray, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          interest,
          style: TextStyle(fontSize: AppFontSize.body, color: AppColors.black),
        ),
      ),
    );
  }
}
