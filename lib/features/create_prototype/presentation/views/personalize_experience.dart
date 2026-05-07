import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/assets/app_fontSize.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:experience_app/features/create_prototype/presentation/widgets/interest_option_widget.dart';
import 'package:flutter/material.dart';

class PersonalizeExperience extends StatelessWidget {
  const PersonalizeExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  'Personalise your experience',
                  style: TextStyle(
                    fontSize: AppFontSize.title,
                    fontWeight: AppFontSize.wtitle,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Choose your interests.',
                  style: TextStyle(
                    fontSize: AppFontSize.body,
                    color: AppColors.gray,
                  ),
                ),
                SizedBox(height: 30),
                InterestOptions(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    router.goNamed(Routes.personalizeExperience);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.btnBlue,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.4,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 16, color: AppColors.white),
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

class InterestOptions extends StatelessWidget {
  const InterestOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InterestOptionWidget(interest: 'User Interface'),
        SizedBox(height: 10),
        InterestOptionWidget(interest: 'User Experience'),
        SizedBox(height: 10),
        InterestOptionWidget(interest: 'User Research'),
        SizedBox(height: 10),
        InterestOptionWidget(interest: 'UX Writing'),
        SizedBox(height: 10),
        InterestOptionWidget(interest: 'User Testing'),
        SizedBox(height: 10),
        InterestOptionWidget(interest: 'Service Design'),
        SizedBox(height: 10),
        InterestOptionWidget(interest: 'Strategy'),
        SizedBox(height: 10),
        InterestOptionWidget(interest: 'Design Systems'),
      ],
    );
  }
}
