import 'package:hive/hive.dart';

class LocalStorage{
   // Box in Hive used to store and retrieve data
  static Box box = Hive.box("localDb");

  // Screen Sizes
  static double get screenWidth => box.get("screenWidth", defaultValue: 0.0);
  static double get screenHeight => box.get("screenHeight", defaultValue: 0.0);
  static double get topSafeArea => box.get("topSafeArea", defaultValue: 0.0);

  // Last Opened Date
  static get lastOpenedDate => box.get("lastOpenedDate", defaultValue: null);

  // Login status
  static bool get loginStatus => box.get("loginStatus", defaultValue: false);

  // App In Foreground Status
  static bool get isAppInForeground => box.get("isAppInForeground", defaultValue: true);

  // Updates Screen Sizes
  static Future<void> updateScreenSizes(double width, double height, double topArea) async {
    await box.put("screenWidth", width);
    await box.put("screenHeight", height);
    await box.put("topSafeArea", topArea);
  }

  // Updates OnboardingViewed status
  static Future updateLoginStatus(bool val) async {
    await box.put("loginStatus", val);
  }

  // Update App In Foreground Status
  static Future<void> updateIsAppInForeground(bool newValue) async {
    await box.put('isAppInForeground', newValue);
  }
}