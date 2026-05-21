import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/assets/app_fontSize.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:flutter/material.dart';

class CreateView extends StatelessWidget {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: const AssetImage('assets/image1.jpg'),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.60,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Text(
                  'Create a Prototype in just a few minutes',
                  style: TextStyle(
                    fontSize: AppFontSize.title,
                    fontWeight: AppFontSize.wtitle,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enjoy these pre-made components and worry only about creating the best products ever.',
                  style: TextStyle(
                    fontSize: AppFontSize.body,
                    color: AppColors.gray,
                  ),
                ),
                const SizedBox(height: 20),
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
                  child: const Text(
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
