import 'dart:convert';
import 'dart:math';
import 'package:advanced_quran_app/Core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../utils/constants.dart';

class LocalNotificationServices {
  static List<String> prayerList = [];

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

//! Initialize Notification Method for both android and IOS
  static Future<void> initialize() async {
    //? Initialize Notification for android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');
    //? Initialize Notification for IOS
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();
    //? Initialize Notification for both android and IOS
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onNotificationTapped,
      onDidReceiveBackgroundNotificationResponse: onNotificationTapped,
    );
  }

//! Function to display a Daily Scheduled Local Notification
  static Future<void> showDailyScheduledLocalNotification(
    String title,
    String body,
    int prayerHour,
    int prayerMinutes,
    Map<String, dynamic> data,
  ) async {
    //? Android Notification Details
    const androidNotificationDetails = AndroidNotificationDetails(
      "WorkManager_Scheduled_Local_Notification",
      "WorkManager_Scheduled_Local_Notification",
      channelDescription: "Show Daily Scheduled notifications",
      importance: Importance.max,
      priority: Priority.high,
    );

    //? IOS Notification Details
    const iOSNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iOSNotificationDetails,
    );
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
    var currentTime = tz.TZDateTime.now(tz.local);

    var scheduleTime = tz.TZDateTime(
      tz.local,
      currentTime.year,
      currentTime.month,
      currentTime.day,
      prayerHour,
      prayerMinutes,
    );

    if (scheduleTime.isBefore(currentTime)) {
      scheduleTime = scheduleTime.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      Random().nextInt(1000000),
      title,
      body,
      payload: json.encode(data),
      scheduleTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  /// Function to handle the daily prayer timing
  static Future<void> schedulePrayerTimes() async {
    print('------------prayerList : $prayerList');
    for (int i = 0; i < prayerList.length; i++) {
      List<String> parts = prayerList[i].split(':');
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1].substring(0, 2));

      await showDailyScheduledLocalNotification(
        prayerTitleAndBodyList[i][0],
        prayerTitleAndBodyList[i][1],
        hour,
        minute,
        {},
      );
    }
  }

//! Callback function when a local notification is selected
  static void onNotificationTapped(NotificationResponse details) {
    Navigator.pushNamed(
      rootNavigatorKey.currentContext!,
      Routes.homeViewRoute,
    );
  }
}
