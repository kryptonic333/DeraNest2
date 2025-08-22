import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/splash/presentation/widgets/app_header.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body: Column(
          children: [
            context.h(24).heightBox,
            // Screen Header
            AppHeader(),
            context.h(2.25).heightBox,

            // App Tagline
            Text(
              'Digital Baithak for GupShup\nConnect with friends and family\nIt\'s all here for you.',
              textAlign: TextAlign.center,
              style: AppTextStyle.kLargeBodyText.copyWith(
                color: AppColors.kSecondarySupport,
              ),
            ),
            context.h(28.75).heightBox,
            // have an account?
            Text(
              'Have an Account?',
              style: AppTextStyle.kHeadingText.copyWith(
                color: AppColors.kSecondarySupport,
              ),
            ),
            context.h(3).heightBox,
            // login button
            CustomElevatedButton(
              borderRadius: context.h(1.2),
              buttonColor: AppColors.kSecondary,
              width: context.w(90),
              title: 'Login',
              onPress: () {
                // Navigate to Login Screen
                context.go(Routes.login);
              },
            ),
            context.h(2.5).heightBox,
            // register button
            CustomElevatedButton(
              borderRadius: context.h(1.2),

              buttonColor: AppColors.kWhite,
              textColor: AppColors.kBlack,
              title: 'Register',
              width: context.w(90),
              onPress: () {
                // Navigate to SignUp Screen
                context.go(Routes.register);
              },
            ),
          ],
        ).padHrz(context.w(5)),
      ),
    );
  }
}
