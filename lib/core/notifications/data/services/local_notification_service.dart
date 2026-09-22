import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Envuelve `flutter_local_notifications` para mostrar una notificación del
/// sistema cuando FCM entrega un mensaje mientras la app está en primer
/// plano (Android/iOS no la muestran automáticamente en ese caso).
class LocalNotificationService {
  LocalNotificationService._();

  static final LocalNotificationService instance = LocalNotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _salesChannel =
      AndroidNotificationChannel(
        'sales_channel',
        'Ventas',
        description: 'Notificaciones de nuevas ventas registradas',
        importance: Importance.high,
      );

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings();
    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(settings: settings);

    await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_salesChannel);

    _initialized = true;
  }

  Future<void> show({required String title, required String body}) async {
    await initialize();

    final androidDetails = AndroidNotificationDetails(
      _salesChannel.id,
      _salesChannel.name,
      channelDescription: _salesChannel.description,
      importance: Importance.high,
      priority: Priority.high,
    );
    const iosDetails = DarwinNotificationDetails();
    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _plugin.show(
      id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title: title,
      body: body,
      notificationDetails: details,
    );
  }
}
