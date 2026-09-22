import 'package:experience_app/core/assets/app_colors.dart';
import 'package:experience_app/core/local_storage.dart';
import 'package:experience_app/core/navigation/router.dart';
import 'package:experience_app/core/notifications/data/services/local_notification_service.dart';
import 'package:experience_app/core/notifications/presentation/providers/notification_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void _navigateToSaleFromNotificationData(Map<String, dynamic> data) {
  final saleId = data['saleId'];
  if (saleId != null && saleId is String && saleId.isNotEmpty) {
    router.push('/sale_detail/$saleId');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Configurar Firebase Messaging solo en plataformas móviles/desktop nativas
  if (!kIsWeb) {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    // App en background y el usuario toca la notificación del sistema.
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _navigateToSaleFromNotificationData(message.data);
    });

    // App cerrada (terminated) y se abre tocando la notificación.
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _navigateToSaleFromNotificationData(initialMessage.data);
    }

    // App en primer plano: la notificación local mostrada manualmente
    // también debe navegar al detalle cuando se toca.
    LocalNotificationService.instance.onNotificationTap = (payload) {
      if (payload != null && payload.isNotEmpty) {
        router.push('/sale_detail/$payload');
      }
    };
  }

  // Initialize LocalStorage
  final localStorage = LocalStorage();
  await localStorage.init();

  runApp(ProviderScope(child: MainApp(localStorage: localStorage)));
}

class MainApp extends ConsumerStatefulWidget {
  final LocalStorage localStorage;

  const MainApp({super.key, required this.localStorage});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
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
      // Registra/actualiza el token FCM del dispositivo para este usuario.
      ref.read(fcmTokenProvider(session['userId']!));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Cuando llega un push mientras la app está en primer plano, FCM no
    // muestra la notificación del sistema automáticamente: hay que hacerlo
    // manualmente con flutter_local_notifications.
    ref.listen(foregroundNotificationProvider, (previous, next) {
      next.whenData((notification) {
        LocalNotificationService.instance.show(
          title: notification.title.isNotEmpty
              ? notification.title
              : 'Nueva venta registrada',
          body: notification.body,
          payload: notification.data?['saleId'] as String?,
        );
      });
    });

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
