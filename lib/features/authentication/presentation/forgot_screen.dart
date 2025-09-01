import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_text_field.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/features/authentication/data/auth_provider/auth_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authCtrl = ref.read(authProvider.notifier);

    return CustomSafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          title:
              // Forgot Pass Text
              Text(
                'Forgot Password',
                style: AppTextStyle.kLargeBodyText.copyWith(
                  fontSize: context.h(2.9),
                ),
              ),
        ),
        backgroundColor: AppColors.kTransparent,
        body: Form(
          key: authState.forgetFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Email Text
              Text('Email', style: AppTextStyle.kLargeBodyText),

              context.h(1.5).heightBox,

              // Email text field
              CustomElevatedTextField(
                cursorColor: AppColors.kBlack,
                fontColor: AppColors.kBlack,
                controller: authState.forgotPasswordController,
                hintText: '....@gmail.com',
                labelText: null,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                validator: FieldValidator.required(),
              ),

              context.h(2).heightBox,

              // Description Text
              Text(
                'Enter Email on which you want to Reset Password',
                style: AppTextStyle.kMediumBodyText,
              ),
              context.h(20).heightBox,

              // Elevated Button
              Center(
                child: CustomElevatedButton(
                  borderRadius: context.h(1.2),
                  buttonColor: AppColors.kSecondary,
                  width: context.w(90),
                  title: 'Send',
                  onPress: () async {
                    // Store the Status of Process
                    await authCtrl.resetPassword(context);
                   
                    
                  },
                ),
              ),
            ],
          ),
        ).padHrz(context.h(2)),
      ),
    );
  }
}