import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_password_text_field.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_text_field.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/presentation/widgets/custom_text_button.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/authentication/data/auth_provider/auth_provider.dart';
import 'package:deranest/features/splash/presentation/widgets/app_header.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authCtrl = ref.read(authProvider.notifier);
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: authState.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top Space
                context.h(5).heightBox,
                //  App Header
                const AppHeader(),
                // Header's bottom spacing
                context.h(5).heightBox,

                // App Tagline
                Text(
                  'Digital Baithak for GupShup\nConnect with friends and family\nIt\'s all here for you.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.kLargeBodyText.copyWith(color: AppColors.kSecondarySupport),
                ),
                context.h(6).heightBox,

                // Email Field Section
                _buildTextFieldSection(
                  context: context,
                  labelText: 'Email',
                  child: CustomElevatedTextField(
                    cursorColor: AppColors.kBlack,
                    fontColor: AppColors.kBlack,
                    controller: authState.loginEmailController,
                    hintText: '....@gmail.com',
                    labelText: null,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: FieldValidator.email(),
                  ),
                ),
                context.h(1.75).heightBox,

                // Password Field Section
                _buildTextFieldSection(
                  context: context,
                  labelText: 'Password',
                  child: CustomElevatedPasswordTextField(
                    cursorColor: AppColors.kBlack,
                    fontColor: AppColors.kBlack,
                    controller: authState.loginPasswordController,
                    hintText: '********',
                    labelText: null,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    validator: FieldValidator.password(),
                  ),
                ),
                context.h(1).heightBox,

                // Terms and conditions and forgot password
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        authCtrl.toggleTermsAgreed();
                      },
                      child: Container(
                        height: context.h(2.45),
                        width: context.w(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: AppColors.kWhite,
                          border: Border.all(
                            color: authState.isTermsAgreed ? AppColors.kWhite : AppColors.kBlack,
                          ),
                        ),
                        child: authState.isTermsAgreed
                            ? Icon(Icons.check, color: AppColors.kSecondarySupport).centerWidget
                            : null,
                      ),
                    ),
                    CustomTextButton(
                      fontSize: context.h(1.8),
                      onPressed: () {
                        // Navigate to Terms and Conditions Screen
                        context.push(Routes.termsCondition);
                      },
                      text: 'Terms & Conditions',
                      color: AppColors.kHintTextColor,
                    ),
                    const Spacer(),
                    CustomTextButton(
                      color: AppColors.kHintTextColor,
                      text: 'Forgot Password',
                      fontSize: context.h(1.6),
                      onPressed: () {
                        //  Navigate to Forgot Password Screen
                        context.push(Routes.forgotPass);
                      },
                    ),
                  ],
                ),
                context.h(2).heightBox,
                // Login button
                CustomElevatedButton(
                  borderRadius: context.h(1.2),
                  buttonColor: AppColors.kSecondary,
                  width: double.infinity,
                  title: 'Login',
                  onPress: () {
                    context.go(Routes.feed);
                  },
                ),
                context.h(1.7).heightBox,
                // OR Button
                Text('OR', style: AppTextStyle.kDefaultBodyText),
                context.h(1.7).heightBox,

                // Register button
                CustomElevatedButton(
                  borderRadius: context.h(1.2),
                  textColor: AppColors.kBlack,
                  buttonColor: AppColors.kWhite,
                  title: 'Register',
                  width: double.infinity,
                  onPress: () {
                    // Navigate to signup screen
                    context.go(Routes.register);
                  },
                ),
                context.h(5).heightBox,
              ],
            ),
          ).padHrz(context.w(4)),
        ),
      ),
    );
  }

  // Helper method (label + textfield)
  Widget _buildTextFieldSection({
    required BuildContext context,
    required String labelText,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: AppTextStyle.kLargeBodyText.copyWith(fontWeight: FontWeight.w800)),
        SizedBox(height: context.h(1)),
        child,
      ],
    );
  }
}
