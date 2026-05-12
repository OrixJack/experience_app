import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/assets/app_fontSize.dart';
import 'package:experience_app/features/create_prototype/presentation/providers/personalize_experience_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InterestOptionWidget extends ConsumerWidget {
  const InterestOptionWidget({super.key, required this.interest});

  final String interest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref
        .watch(personalizeExperienceProvider)
        .selectedInterests
        .contains(interest);
    final notifier = ref.read(personalizeExperienceProvider.notifier);

    return GestureDetector(
      onTap: () => notifier.toggleInterest(interest),
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE3F2FD) : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColors.btnBlue : AppColors.gray,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                interest,
                style: TextStyle(
                  fontSize: AppFontSize.body,
                  color: AppColors.black,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
              if (isSelected)
                Icon(Icons.check, color: AppColors.btnBlue, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
