import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings settings = InitializationSettings(android: androidSettings);
    await _notificationsPlugin.initialize(settings);
  }

  static Future<void> showNotification({required int id, required String title, required String body}) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'todo_channel',
      'Todo Notifications',
      importance: Importance.high,
    );
    const NotificationDetails details = NotificationDetails(android: androidDetails);
    await _notificationsPlugin.show(id, title, body, details);
  }

  static Future<void> onMessage(RemoteMessage message) async {
    final notification = message.notification;
    if (notification != null) {
      await showNotification(
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        title: notification.title ?? 'Todo App',
        body: notification.body ?? 'Ada tugas baru?',
      );
    }
  }

  static Future<void> onBackgroundMessage(RemoteMessage message) async {
    print("Background message: ${message.messageId}");
  }
}