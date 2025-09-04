import 'package:deranest/core/data/services/splash_services.dart';
import 'package:deranest/features/splash/presentation/widgets/app_header.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.checkLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: AppHeader()));
  }
}
