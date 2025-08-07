import 'package:hive_flutter/adapters.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Initialize Hive in the background if not already initialized
    if (!Hive.isBoxOpen('localDb')) {
      await BackgroundServices.initHiveInBackground();
    }

    // Return true to indicate the task was successful
    return Future.value(true);
  });
}

class BackgroundServices 
{
    // Initialize Hive
    static Future<void> initHiveInBackground() async {
    await Hive.initFlutter();

    // Register adapters for background isolate
    
    // Open hive box
    await Hive.openBox("localDb");
  }



}
