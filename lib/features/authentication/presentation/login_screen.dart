import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_password_text_field.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_text_field.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/presentation/widgets/custom_text_button.dart';
import 'package:deranest/features/splash/presentation/widgets/app_header.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

// Authentication Screen Controller Required
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body:  SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: context.h(5)),
                  const AppHeader(),
                  SizedBox(height: context.h(2)),

                  // App Tagline
                  Text(
                    'Digital Baithak for GupShup\nConnect with friends and family\nIt\'s all here for you.',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.kLargeBodyText,
                  ),
                  SizedBox(height: context.h(6)),

                  // Email Field Section
                  _buildTextFieldSection(
                    labelText: 'Email',
                    child: CustomElevatedTextField(
                      cursorColor: AppColors.kBlack,
                      fontColor: AppColors.kBlack,
                      controller: controller.loginEmailController.value,
                      hintText: 'Email',
                      labelText: null,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: FieldValidator.required(),
                    ),
                  ),
                  SizedBox(height: context.h(1.75)),

                  // Password Field Section
                  _buildTextFieldSection(
                    labelText: 'Password',
                    child: CustomElevatedPasswordTextField(
                      cursorColor: AppColors.kBlack,
                      fontColor: AppColors.kBlack,
                      controller: controller.loginPasswordController.value,
                      hintText: 'Password',
                      labelText: null,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      validator: FieldValidator.required(),
                    ),
                  ),
                  SizedBox(height: context.h(1)),

                  // Terms and conditions and forgot password
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.updateTermsAgreed();
                        },
                        child: Container(
                          height: context.h(2.45),
                          width: context.w(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColors.kWhite,
                            border: Border.all(
                              color: controller.isTermsAgreed1.value
                                  ? AppColors.kWhite
                                  : AppColors.kBlack,
                            ),
                          ),
                          child: controller.isTermsAgreed1.value
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.kSecondarySupport,
                                ).centerWidget
                              : null,
                        ),
                      ),
                      CustomTextButton(
                        fontSize: 14,
                        onPressed: () {
                          // Navigate to Terms and Conditions Screen
                        },
                        text: 'Terms & Conditions',
                      ),
                      const Spacer(),
                      CustomTextButton(
                        text: 'Forgot Password',
                        fontSize: 14,
                        onPressed: () =>
                          //  Navigate to Forgot Password Screen
                      ),
                    ],
                  ),
                  SizedBox(height: context.h(2)),
                  // Login button
                  CustomElevatedButton(
                    borderRadius: 10,
                    buttonColor: AppColors.kSecondary,
                    width: double.infinity,
                    title: 'Login',
                    onPress: () {
                      if (controller.isTermsAgreed1.value == false) {
                        // Show SnackBar for Error
                        return;
                      }
                      if (controller.loginFormKey.currentState?.validate() ??
                          false) {
                        // Navigate to MainScreen
                      }
                    },
                  ),
                  SizedBox(height: context.h(1.7)),

                  Text('OR', style: AppTextStyle.kDefaultBodyText),
                  SizedBox(height: context.h(1.7)),

                  // Register button
                  CustomElevatedButton(
                    borderRadius: 10,
                    textColor: AppColors.kBlack,
                    buttonColor: AppColors.kWhite,
                    title: 'Register',
                    width: double.infinity,
                    onPress: () {
                      // Navigate to Signup Screen 
                    },
                  ),
                  SizedBox(height: context.h(5)),
                ],
              ),
            ).padHrz(context.w(4)),
          ),
        ),
      
    );
  }

  // Helper method to avoid duplicating the label + textfield column structure.
  Widget _buildTextFieldSection({
    required String labelText,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: AppTextStyle.kMediumBodyText.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        child,
      ],
    );
  }
}
