import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_text_field.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class PollCreationScreen extends StatelessWidget {
  const PollCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          foregroundColor: AppColors.kSecondary,
          elevation: 1,
          title: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [AppColors.kSecondarySupport, AppColors.kAbortColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),

            child: Text(
              'Create Poll',
              style: AppTextStyle.kVeryLargeBodyText.copyWith(
                color: AppColors.kWhite,
                fontSize: context.w(2.9),
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(context.w(2)),
          child: Column(
            children: [
              // --- The main card containing the poll creation form ---
              Card(
                elevation: 4,
                shadowColor: Colors.black.withAlpha(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // --- Question Input Field ---
                    const Text(
                      "Your Question",
                      style: AppTextStyle.kLargeBodyText,
                    ),
                    context.h(1).heightBox,

                    _buildInputField(
                      hintText: "Ask a question...",
                      isQuestion: true,
                    ),

                    context.h(3).heightBox,
                    const Divider(),
                    context.h(3).heightBox,

                    // --- Options Input Fields ---
                    const Text("Options", style: AppTextStyle.kLargeBodyText),
                    context.h(2).heightBox,
                    _buildInputField(hintText: "Option 1"),
                    context.h(2).heightBox,
                    _buildInputField(hintText: "Option 2"),
                    context.h(2).heightBox,

                    // --- Add Option Button ---
                    _buildAddOptionButton(context),
                    context.h(4).heightBox,

                    // --- Create Poll Button (Primary Action) ---
                    _buildCreatePollButton(),
                  ],
                ).padAll(context.w(2.7)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A styled helper for creating text form fields.
  Widget _buildInputField({required String hintText, bool isQuestion = false}) {
    return CustomElevatedTextField(
      maxLength: isQuestion ? 3:1,
      minLines: isQuestion?2:1,
      controller: null,
      hintText: hintText,
      labelText: null,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.done,
      validator: null,
    );
  }

  // Design for the "Add Option" button.
  Widget _buildAddOptionButton(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          iconSize: context.w(2.7),
          onTap: () {},
          icon: Icons.add_circle_outline,
          iconColor: AppColors.kSecondary,
        ),
        Text(
          'Add Option',
          style: AppTextStyle.kMediumBodyText.copyWith(
            color: AppColors.kSecondary,
          ),
        ),
      ],
    );
  }

  // Design for the main "Create Poll" action button.
  Widget _buildCreatePollButton() {
    return CustomElevatedButton(
      onPress: () {
        // No logic here - pure UI
      },
      buttonColor: AppColors.kSecondary,
      title: "Create Poll",
    );
  }
}
