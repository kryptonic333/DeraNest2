import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/splash/data/providers/splash_provider.dart';
import 'package:deranest/features/splash/presentation/widgets/app_header.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashState = ref.watch(splashProvider);

    // Navigate to FeedScreen after a 3-second delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (splashState.loginStatus) {
          context.go(Routes.feed);
        } else {
          context.go(Routes.onBoard);
        }
      });
    });
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: CustomSafeArea(child: AppHeader().centerWidget),
    );
  }
}
