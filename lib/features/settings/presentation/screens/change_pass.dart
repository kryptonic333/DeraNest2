import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_password_text_field.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        title: Text('Change Password', style: AppTextStyle.kLargeBodyText),
      ),
      body: Column(
        children: [
          _buildTextFieldSection(
            label: 'Old Password',
            field: CustomElevatedPasswordTextField(
              labelText: null,
              fontColor: AppColors.kBlack,
              keyboardType: TextInputType.visiblePassword,
              controller: null,
              hintText: 'Password',
              textInputAction: TextInputAction.done,
              validator: null,
            ),
          ),
          _buildTextFieldSection(
            label: 'New Password',
            field: CustomElevatedPasswordTextField(
              labelText: null,
              fontColor: AppColors.kBlack,
              keyboardType: TextInputType.visiblePassword,
              controller: null,
              hintText: 'Password',
              textInputAction: TextInputAction.done,
              validator: null,
            ),
          ),
          _buildTextFieldSection(
            label: 'Confirm Password',
            field: CustomElevatedPasswordTextField(
              labelText: null,
              fontColor: AppColors.kBlack,
              keyboardType: TextInputType.visiblePassword,
              controller: null,
              hintText: 'Password',
              textInputAction: TextInputAction.done,
              validator: null,
            ),
          ),
          SizedBox(height: context.h(10)),
          CustomElevatedButton(
            height: context.h(7),
            width: context.w(95),
            borderRadius: 18,
            buttonColor: AppColors.kSecondarySupport,
            title: 'Change Password',
            onPress: () {},
          ),
        ],
      ).padAll(context.w(3)),
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
