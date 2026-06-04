import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Experience App',
      theme: ThemeData(
        primaryColor: AppColors.btnBlue,
        scaffoldBackgroundColor: AppColors.bgColor,
      ),
      routerConfig: router,
    );
  }
}
