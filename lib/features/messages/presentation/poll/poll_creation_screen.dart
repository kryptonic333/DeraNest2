
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:flutter/material.dart';



class PollCreationScreen extends StatelessWidget {
  const PollCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                fontSize: 22,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // --- The main card containing the poll creation form ---
              Card(
                elevation: 4,
                shadowColor: Colors.black.withAlpha(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // --- Question Input Field ---
                      const Text(
                        "Your Question",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildInputField(
                        hintText: "Ask a question...",
                        isQuestion: true,
                      ),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 24),
      
                      // --- Options Input Fields ---
                      const Text(
                        "Options",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildInputField(hintText: "Option 1"),
                      const SizedBox(height: 12),
                      _buildInputField(hintText: "Option 2"),
                      const SizedBox(height: 16),
      
                      // --- Add Option Button ---
                      _buildAddOptionButton(),
                      const SizedBox(height: 32),
      
                      // --- Create Poll Button (Primary Action) ---
                      _buildCreatePollButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- UI BUILDER HELPER METHODS ---

  /// A styled helper for creating text form fields.
  Widget _buildInputField({required String hintText, bool isQuestion = false}) {
    return TextFormField(
      // No controllers or validators, pure UI
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontWeight: FontWeight.normal,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.kSecondary, width: 2),
        ),
      ),
      maxLines: isQuestion ? 3 : 1,
      minLines: isQuestion ? 2 : 1,
    );
  }

  /// Design for the "Add Option" button.
  Widget _buildAddOptionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          iconSize: 20,
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

  /// Design for the main "Create Poll" action button.
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
