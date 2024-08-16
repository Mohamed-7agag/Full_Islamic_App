import 'package:advanced_quran_app/Core/utils/days_difference_function.dart';
import 'package:advanced_quran_app/Features/prayer/presentation/view_model/prayer_cubit/prayer_cubit.dart';
import 'package:advanced_quran_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workmanager/workmanager.dart';
import 'notification_service.dart';

class WorkManagerServices {
  //! Initialize WorkManager
  static Future<void> init() async {
    await Workmanager().initialize(actionTask);
    registerMyTask();
  }

//! Register My Task
  static Future<void> registerMyTask() async {
    await Workmanager().registerPeriodicTask(
      'id1',
      'show simple notification',
      frequency: const Duration(minutes: 15),
      inputData: {
        'prayerList': LocalNotificationServices.prayerList.join(','),
      },
    );
  }
}

//! Execute Task and must to be a top level function
@pragma('vm-entry-point')
void actionTask() {
  print('Action task started\n');
  Workmanager().executeTask((taskName, inputData) async {
    String prayerListData = inputData?['prayerList'] ?? '';
    List<String> prayerList = prayerListData.split(',');

    if (prayerList.isNotEmpty) {
      print("Scheduling notifications with prayerList: $prayerList");
      LocalNotificationServices.prayerList = prayerList;
      await LocalNotificationServices.schedulePrayerTimes();

      // Check if this is the last notification
      bool isLastNotification = inputData?['isLastNotification'] ?? false;
      if (isLastNotification) {
        print(
            "Last prayer notification triggered. Fetching new prayer times...");

        // Trigger the cubit to fetch new prayer times
        await fetchNewPrayerTimes();
      }
    } else {
      print("Prayer list is empty. Can't schedule notifications.");
    }
    return Future.value(true);
  });
}

Future<void> fetchNewPrayerTimes() async {
  // Assuming you have a way to access PrayerCubit, like through a global key or other dependency injection
  BuildContext context = navigatorKey.currentContext!;
  PrayerCubit cubit = context.read<PrayerCubit>();
  // Fetching the current year dynamically
  String currentYear = DateTime.now().year.toString();
  await cubit.getPrayerTiming(year: currentYear);

  // Once new timings are fetched, reschedule notifications
  if (cubit.state is PrayerSuccess) {
    List<String> prayerlist = [
      (cubit.state as PrayerSuccess)
          .prayerModelList[dayDifference()]
          .timings!
          .fajr!,
      (cubit.state as PrayerSuccess)
          .prayerModelList[dayDifference()]
          .timings!
          .dhuhr!,
      (cubit.state as PrayerSuccess)
          .prayerModelList[dayDifference()]
          .timings!
          .asr!,
      (cubit.state as PrayerSuccess)
          .prayerModelList[dayDifference()]
          .timings!
          .maghrib!,
      (cubit.state as PrayerSuccess)
          .prayerModelList[dayDifference()]
          .timings!
          .isha!,
    ];
    LocalNotificationServices.prayerList = prayerlist;
    await WorkManagerServices.registerMyTask();
    await LocalNotificationServices.schedulePrayerTimes();
  }
}
