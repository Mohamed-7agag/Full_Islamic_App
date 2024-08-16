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
    );
  }

//! Cancel all Tasks
  static Future<void> cancelAllTask(String id) async {
    await Workmanager().cancelAll();
  }

//! Cancel specific Tasks
  static Future<void> cancelSpecificTask(String taskID) async {
    await Workmanager().cancelByUniqueName(taskID);
  }
}

//! Execute Task and must to be a top level function
@pragma('vm-entry-point')
void actionTask() {
  print('action done\n');
  Workmanager().executeTask((taskName, inputData) {
    LocalNotificationServices.schedulePrayerTimes();
    return Future.value(true);
  });
}
