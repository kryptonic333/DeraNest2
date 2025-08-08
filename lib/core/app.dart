import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/providers/app_analytics.dart';
import 'package:deranest/core/providers/app_lifecycle_provider.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // App Open Log Analytics
    ref.read(analyticsProvider);
    // Initialize app lifecycle provider
    ref.read(appLifecycleProvider);
    
    return MaterialApp.router(
      title: 'Logo Quiz',
      
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(routerProvider),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimary),
      ),
    );
  }
}