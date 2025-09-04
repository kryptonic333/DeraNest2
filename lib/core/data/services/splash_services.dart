import 'dart:async';
import 'package:deranest/core/data/services/firebase_auth_services.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SplashServices {
  void checkLogin(BuildContext context) {
    final status = FirebaseAuthServices().isLogin();
    if (status) {
      Timer(Duration(seconds: 3), () => context.go(Routes.feed));
    } else {
      Timer(Duration(seconds: 3), () => context.go(Routes.onBoard));
    }
  }
}
