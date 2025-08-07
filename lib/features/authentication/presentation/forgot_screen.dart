
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/presentation/widgets/custom_text_field.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Authentication Screen Controller Required
   
    final formKey = GlobalKey<FormState>(); // Key for form validation.

    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.h(5)),

              Text(
                'Forgot Password',
                style: AppTextStyle.kLargeBodyText,
              ),

              SizedBox(height: context.h(25)),

              Text(
                'Email',
                style: AppTextStyle.kLargeBodyText,
              ),

              SizedBox(height: context.h(1.5)),

              // Email text field
              CustomTextField(
                cursorColor: AppColors.kBlack,
                fontColor: AppColors.kBlack,
                controller: controller.forgotPasswordController.value,
                hintText: 'Email',
                labelText: null,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                validator: FieldValidator.required(),
              ),

              SizedBox(height: context.h(2)),

              Text(
                'Enter Email on which you want to Reset Password',
                style: AppTextStyle.kMediumBodyText,
              ),
              SizedBox(height: context.h(20)),
              Center(
                child: CustomElevatedButton(
                  borderRadius: 10,
                  buttonColor: AppColors.kSecondary,
                  width: context.w(90),
                  title: 'Send',
                  onPress: () {
                    if (formKey.currentState?.validate() ?? false) {}
                  },
                ),
              ),

              SizedBox(height: context.h(8)),
            ],
          ),
        ).padHrz(context.h(3)),
      ),
    );
  }
}
