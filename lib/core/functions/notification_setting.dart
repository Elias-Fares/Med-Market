



import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pharmachy_app/firebase_options.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  if (kDebugMode) {
    print('Handling a background message ${message.messageId}');
  }
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
    );
  }
}

Future<void> firebaseMessagingPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final settings = await messaging.requestPermission(
 alert: true,
 announcement: false,
 badge: true,
 carPlay: false,
 criticalAlert: false,
 provisional: false,
 sound: true,
);

 if (kDebugMode) {
   print('Permission granted: ${settings.authorizationStatus}');
 }
}

Future<String?> getFCMToken() async {
  final token = await FirebaseMessaging.instance.getToken();
  if (kDebugMode) {
    print("FCM = $token");
    print("____________________________________________________");
  }
  return token;
}

// List onFcmPress({required RemoteMessage remoteMessage}) {
//   if (kDebugMode) {
//     print('Message data: ${remoteMessage.data.toString()}');
//     print('Message data: ${remoteMessage.senderId}');
//     print('Message data: ${remoteMessage.messageType}');
//     print('Message data: ${remoteMessage.notification}');
//   }

//   final res = remoteMessage.data['additional_data'];

//   final data = NotificationBody.fromJson(json.decode(res));

//   String? type, note = "";
//   int? chatId;
//   chatId = int.tryParse(data.orderId??"");
//   type = data.ntType;
//   note = data.title;




//   return [type, chatId];

//   // add Get.to here
//   // or do some  function
//   // or try to parse remote message
// }
