import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmachy_app/app/app.dart';
import 'package:pharmachy_app/core/functions/notification_setting.dart';
import 'core/widgets/style/color.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.greenPrimaryColor.withOpacity(.6)));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }

  runApp(const App());
}
