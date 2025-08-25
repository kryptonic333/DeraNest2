import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_fonts.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/features/authentication/data/auth_provider/auth_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TermsAndConditionsScreen extends ConsumerWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);

    final authCtrl = ref.read(authProvider.notifier);
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: AppBar(
          title: const Text(
            'Terms & Conditions',
            style: AppTextStyle.kHeadingText,
          ),
          backgroundColor: AppColors.kWhite,

          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.kBlack),
            onPressed: () => context.pop(),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(context.w(2.7)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Heading
              Text(
                'Welcome to Our Social App!',
                style: AppTextStyle.kHeadingText.copyWith(
                  color: AppColors.kSecondarySupport,
                ),
              ),
              context.h(1.75).heightBox,
              // Last Updated Text
              Text(
                'Last Updated: July 23, 2025',
                style: AppTextStyle.kDefaultBodyText.copyWith(
                  color: AppColors.kHintTextColor,
                ),
              ),
              context.h(4.5).heightBox,
              // Intro Title
              _buildSectionTitle('1. Introduction', context),
              // Intro Para
              _buildSectionContent(
                'By accessing or using our service, you agree to be bound by these Terms. If you disagree with any part of the terms, then you may not access the service. These Terms and Conditions govern your use of our social media application and any related services provided.',
                context,
              ),
              // UserAccount Title
              _buildSectionTitle('2. User Accounts', context),
              // UserAccount Para
              _buildSectionContent(
                'When you create an account with us, you must provide us with information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our service. You are responsible for safeguarding the password that you use to access the service and for any activities or actions under your password.',
                context,
              ),
              // Content Title
              _buildSectionTitle(
                '3. Content Ownership and Responsibility',
                context,
              ),
              // Content Para
              _buildSectionContent(
                'Our service allows you to post, link, store, share, and otherwise make available certain information, text, graphics, videos, or other material ("Content"). You are responsible for the Content that you post to the service, including its legality, reliability, and appropriateness. By posting Content to the service, you grant us the right and license to use, modify, publicly perform, publicly display, reproduce, and distribute such Content on and through the service.',
                context,
              ),
              // Prohibited Title
              _buildSectionTitle('4. Prohibited Activities', context),
              // Prohibited Para
              _buildSectionContent(
                'You may not use the service for any illegal or unauthorized purpose. You agree to comply with all laws, rules, and regulations applicable to your use of the service. You are strictly prohibited from engaging in harassment, hate speech, impersonation, or distributing spam and malicious content.',
                context,
              ),
              // Termination Title
              _buildSectionTitle('5. Termination', context),
              // Termination Para
              _buildSectionContent(
                'We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms. Upon termination, your right to use the service will immediately cease. If you wish to terminate your account, you may simply discontinue using the service.',
                context,
              ),
              // Changes to Terms Title
              _buildSectionTitle('6. Changes to Terms', context),
              // Changes to Terms Para
              _buildSectionContent(
                'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. We will provide at least 30 days\' notice prior to any new terms taking effect. By continuing to access or use our service after those revisions become effective, you agree to be bound by the revised terms.',
                context,
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            // Bottom Nav Bar
            CustomElevatedButton(
              borderRadius: context.h(1.2),
              buttonColor: AppColors.kSecondary,
              onPress: () {
                if (!state.isTermsAgreed) {
                  authCtrl.toggleTermsAgreed();
                }
                context.pop();
              },
              title: 'Accept & Continue',
            ).padSymmetric(
              horizontal: context.w(2.8),
              vertical: context.h(1.9),
            ),
      ),
    );
  }

  // Titles Helper widget
  Widget _buildSectionTitle(String title, BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.kLargeBodyText.copyWith(fontFamily: AppFonts.kBold),
    ).padBottom(context.h(0.6)).padTop(context.h(0.6));
  }

  // Section content Helper widget
  Widget _buildSectionContent(String content, BuildContext context) {
    return Text(
      content,
      textAlign: TextAlign.justify,
      style: AppTextStyle.kDefaultBodyText.copyWith(
        fontSize: context.h(2),
        height: context.w(0.5),
        color: AppColors.kHintTextColor,
      ),
    );
  }
}
