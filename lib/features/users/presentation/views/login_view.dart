import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/assets/app_fontSize.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:experience_app/features/users/presentation/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: AppFontSize.title,
                    fontWeight: AppFontSize.wtitle,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome! Please login to continue.',
                  style: TextStyle(
                    fontSize: AppFontSize.body,
                    color: AppColors.gray,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  enabled: !loginState.isLoading,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    ref.read(loginProvider.notifier).setEmail(value);
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  enabled: !loginState.isLoading,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    ref.read(loginProvider.notifier).setPassword(value);
                  },
                ),
                const SizedBox(height: 20),
                if (loginState.errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        loginState.errorMessage,
                        style: TextStyle(
                          color: Colors.red.shade800,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: loginState.isLoading
                      ? null
                      : () async {
                          final notifier = ref.read(loginProvider.notifier);
                          final success = await notifier
                              .loginWithEmailAndPassword();
                          if (success && context.mounted) {
                            router.goNamed(Routes.ecommerceDashboard);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.btnBlue,
                    disabledBackgroundColor: AppColors.btnBlue.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.4,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 52),
                  ),
                  child: loginState.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.white,
                            ),
                          ),
                        )
                      : const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                        ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
