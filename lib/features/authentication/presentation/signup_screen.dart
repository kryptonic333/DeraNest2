import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_drop_down_menu_button.dart';
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

// Authentication Screen Controller Required
class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

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
            key: authState.signUpFormKey,
            child: Column(
              children: [
                SizedBox(height: context.h(5)),
                const AppHeader(),
                SizedBox(height: context.h(2)),

                // App tagline
                Text(
                  'Digital Baithak for GupShup\nConnect with friends and family\nIt\'s all here for you.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.kLargeBodyText.copyWith(
                    color: AppColors.kSecondarySupport,
                  ),
                ),
                SizedBox(height: context.h(2.5)),

                // --- Form Fields ---
                // Name field
                _buildTextFieldSection(
                  label: 'Name',
                  field: CustomElevatedTextField(
                    maxLength: 1,
                    fontColor: AppColors.kBlack,
                    labelText: null,
                    keyboardType: TextInputType.name,
                    controller: authState.nameController,
                    hintText: 'Name',
                    textInputAction: TextInputAction.next,
                    validator: FieldValidator.required(),
                  ),
                ),

                // Gender field
                _buildTextFieldSection(
                  label: 'Gender',
                  field: CustomDropDownMenuButton(
                    textFontColor: AppColors.kBlack,

                    textController: authState.genderController,
                    width: double.infinity,
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: 'Male', label: 'Male'),
                      DropdownMenuEntry(value: 'Female', label: 'Female'),
                      DropdownMenuEntry(
                        value: 'Rather not say',
                        label: 'Rather not say',
                      ),
                    ],
                    onSelected: (value) {
                      authState.genderController;
                    },
                  ),
                ),

                // Phone field
                _buildTextFieldSection(
                  label: 'Phone Number',
                  field: CustomElevatedTextField(
                    fontColor: AppColors.kBlack,
                    labelText: null,
                    controller: authState.phoneController,
                    hintText: '03xxxxxxxxx',
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    validator: FieldValidator.required(),
                  ),
                ),

                // Email field
                _buildTextFieldSection(
                  label: 'Email',
                  field: CustomElevatedTextField(
                    labelText: null,
                    fontColor: AppColors.kBlack,
                    controller: authState.signupEmailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: FieldValidator.required(),
                  ),
                ),

                // Password field
                _buildTextFieldSection(
                  label: 'Password',
                  field: CustomElevatedPasswordTextField(
                    fontColor: AppColors.kBlack,
                    keyboardType: TextInputType.visiblePassword,
                    labelText: null,
                    controller: authState.signupPasswordController,
                    hintText: 'Password',
                    textInputAction: TextInputAction.next,
                    validator: FieldValidator.required(),
                  ),
                ),

                // Confirm Password field
                _buildTextFieldSection(
                  label: 'Confirm Password',
                  field: CustomElevatedPasswordTextField(
                    labelText: null,
                    fontColor: AppColors.kBlack,
                    keyboardType: TextInputType.visiblePassword,
                    controller: authState.confirmPasswordController,
                    hintText: 'Password',
                    textInputAction: TextInputAction.done,
                    validator: FieldValidator.required(),
                  ),
                ),

                // Agree Term Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            color: authState.isTermsAgreed
                                ? AppColors.kWhite
                                : AppColors.kBlack,
                          ),
                        ),
                        child: authState.isTermsAgreed
                            ? Icon(
                                Icons.check,
                                color: AppColors.kSecondarySupport,
                              ).centerWidget
                            : null,
                      ),
                    ),
                    CustomTextButton(
                      fontSize: 16,
                      onPressed: () {
                        // Navigate to Terms and Conditions Screen
                        context.push(Routes.termsCondition);
                      },
                      text: 'Terms & Conditions',
                    ),
                  ],
                ),
                SizedBox(height: context.h(3)),

                // --- Action Buttons ---
                CustomElevatedButton(
                  borderRadius: 10,
                  buttonColor: AppColors.kSecondary,
                  width: double.infinity,
                  title: 'Register',
                  onPress: () {
                    if (authState.isTermsAgreed == false) {
                      // Show Snackbar For Error
                      return;
                    }

                    if (authState.signUpFormKey.currentState?.validate() ??
                        false) {
                      //  Navigate to Show People Screen
                      context.go(Routes.userDiscovery);
                    }
                  },
                ),
                SizedBox(height: context.h(1.7)),

                Text('OR', style: AppTextStyle.kDefaultBodyText),
                SizedBox(height: context.h(1.7)),

                CustomElevatedButton(
                  borderRadius: 10,
                  textColor: AppColors.kBlack,
                  buttonColor: AppColors.kWhite,
                  title: 'Login',
                  width: double.infinity,
                  onPress: () {
                    // Navigate to Login Screen
                    context.go('/login');
                  },
                ),
                SizedBox(height: context.h(3)),
              ],
            ),
          ).padHrz(context.w(4)),
        ),
      ),
    );
  }

  // A private helper widget to build a labeled form field, reducing code duplication.
  Widget _buildTextFieldSection({
    required String label,
    required Widget field,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.kLargeBodyText.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        field,
        const SizedBox(height: 16),
      ],
    );
  }
}
