import 'dart:ui';

import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/data/local_storage.dart';
import 'package:flutter/services.dart';

class AppConfig {
  // Locks app orientation to portrait mode
  static Future<void> setPortraitOrientation() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  // Hides the status bar and system navigation indicators
  static Future<void> hideStatusBarAndIndicator() async {
    
    

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors.kTransparent),
    );
  }

  // Status bar height, Screen height and Screen Width variables
  static late final double statusBarHeight;
  static late final double screenHeight;
  static late final double screenWidth;

  // Set all sizes
  static void setAllSizes() {
    if (LocalStorage.screenWidth == 0.0 ||
        LocalStorage.screenHeight == 0.0 ||
        LocalStorage.topSafeArea == 0.0) {
      final view = PlatformDispatcher.instance.views.first;
      statusBarHeight = view.padding.top / view.devicePixelRatio;
      screenHeight = view.physicalSize.height / view.devicePixelRatio;
      screenWidth = view.physicalSize.width / view.devicePixelRatio;

      LocalStorage.updateScreenSizes(
        screenWidth,
        screenHeight,
        statusBarHeight,
      );
    }
  }
}
