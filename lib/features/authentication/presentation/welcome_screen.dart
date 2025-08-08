import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/features/splash/presentation/widgets/app_header.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AskUserAuth extends StatelessWidget {
  const AskUserAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body: Column(
          children: [
            SizedBox(height: context.h(24)),
            // Screen Header
            AppHeader(),
            SizedBox(height: context.h(2.25)),

            // app tagline
            Text(
              'Digital Baithak for GupShup\nConnect with friends and family\nIt\'s all here for you.',
              textAlign: TextAlign.center,
              style: AppTextStyle.kLargeBodyText,
            ),
            SizedBox(height: context.h(28.75)),
            // have an account?
            Text('Have an Account?', style: AppTextStyle.kHeadingText),
            const SizedBox(height: 24),
            // login button
            CustomElevatedButton(
              borderRadius: 10,
              buttonColor: AppColors.kSecondary,
              width: context.w(90),
              title: 'Login',
              onPress: () {
                // Navigate to Login Screen
                context.go('/login');
              },
            ),
            SizedBox(height: context.h(2.5)),
            // register button
            CustomElevatedButton(
              borderRadius: 10,
              // i have changed the color but its not being displayed.
              buttonColor: AppColors.kWhite,
              textColor: AppColors.kBlack,
              title: 'Register',
              width: context.w(90),
              onPress: () {
                // Navigate to SignUp Screen
                context.go('/register');
              },
            ),
          ],
        ).padHrz(context.w(5)),
      ),
    );
  }
}
