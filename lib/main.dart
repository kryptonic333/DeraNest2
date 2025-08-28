import 'package:deranest/core/app.dart';
import 'package:deranest/core/config/app_config.dart';
import 'package:deranest/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  // Portrait Orientation
  await AppConfig.setPortraitOrientation();

  // Hide Status Bar and Indicator
  await AppConfig.hideStatusBarAndIndicator();

  // Initialize Hive
  await Hive.initFlutter();

  // Open local Hive database
  await Hive.openBox("localDb"); 

  // Set Status Bar Height
  AppConfig.setAllSizes();
  
  // Run the app
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}


