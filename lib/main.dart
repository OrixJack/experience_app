import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/local_storage.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize LocalStorage
  final localStorage = LocalStorage();
  await localStorage.init();

  runApp(ProviderScope(child: MainApp(localStorage: localStorage)));
}

class MainApp extends StatefulWidget {
  final LocalStorage localStorage;

  const MainApp({super.key, required this.localStorage});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    // Load saved session
    _loadSavedSession();
  }

  Future<void> _loadSavedSession() async {
    final session = await widget.localStorage.getSession();
    if (session != null && mounted) {
      // Session exists, will be handled by router
      setState(() {});
    }
  }

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
