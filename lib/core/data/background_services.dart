// import 'package:flutter/foundation.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:workmanager/workmanager.dart';

// @pragma('vm:entry-point')
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     try {
//       if (!Hive.isBoxOpen('localDb')) {
//         await BackgroundServices.initHiveInBackground();
//       }
//       return Future.value(true);
//     } catch (e, stack) {
//       debugPrint("Background task error: $e\n$stack");
//       return Future.value(false);
//     }
//   });
// }

// class BackgroundServices {
//   // Initialize Hive
//   static Future<void> initHiveInBackground() async {
//     await Hive.initFlutter();

//     // Register adapters for background isolate

//     // Open hive box
//     await Hive.openBox("localDb");
//   }
// }
