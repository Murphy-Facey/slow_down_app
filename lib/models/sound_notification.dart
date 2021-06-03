import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;

class SoundNotification {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  SoundNotification.init() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if(Platform.isIOS) {
      requestIOSPermission();
    }
    initializePlatform();
  }

  requestIOSPermission() {
    flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      IOSFlutterLocalNotificationsPlugin
      >().requestPermissions(
      alert: true,
      badge: true,
      sound: true
    );
  }

  initializePlatform() {
    // var  initSettingIOS = IOSInitializationSettings(
    //   requestAlertPermission: true,
    //   requestBadgePermission: true,
    //   requestSoundPermission: true,
    //   onDidReceiveLocalNotification: (id, title, body, payload): {
    //
    //   }
    // );
    // initSetting = InitializationSettings();
  }

}