import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/features/authentication/data/auth_provider/auth_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Authentication Screen Controller Required
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to Our Social App!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kSecondarySupport,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Last Updated: July 23, 2025',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('1. Introduction'),
              _buildSectionContent(
                'By accessing or using our service, you agree to be bound by these Terms. If you disagree with any part of the terms, then you may not access the service. These Terms and Conditions govern your use of our social media application and any related services provided.',
              ),
              _buildSectionTitle('2. User Accounts'),
              _buildSectionContent(
                'When you create an account with us, you must provide us with information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our service. You are responsible for safeguarding the password that you use to access the service and for any activities or actions under your password.',
              ),
              _buildSectionTitle('3. Content Ownership and Responsibility'),
              _buildSectionContent(
                'Our service allows you to post, link, store, share, and otherwise make available certain information, text, graphics, videos, or other material ("Content"). You are responsible for the Content that you post to the service, including its legality, reliability, and appropriateness. By posting Content to the service, you grant us the right and license to use, modify, publicly perform, publicly display, reproduce, and distribute such Content on and through the service.',
              ),
              _buildSectionTitle('4. Prohibited Activities'),
              _buildSectionContent(
                'You may not use the service for any illegal or unauthorized purpose. You agree to comply with all laws, rules, and regulations applicable to your use of the service. You are strictly prohibited from engaging in harassment, hate speech, impersonation, or distributing spam and malicious content.',
              ),
              _buildSectionTitle('5. Termination'),
              _buildSectionContent(
                'We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms. Upon termination, your right to use the service will immediately cease. If you wish to terminate your account, you may simply discontinue using the service.',
              ),
              _buildSectionTitle('6. Changes to Terms'),
              _buildSectionContent(
                'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. We will provide at least 30 days\' notice prior to any new terms taking effect. By continuing to access or use our service after those revisions become effective, you agree to be bound by the revised terms.',
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kSecondary,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(double.infinity, 50),
            ),
            onPressed: () {
              if (!state.isTermsAgreed) {
                authCtrl.toggleTermsAgreed();
              }

              context.pop();
            },
            child: const Text(
              'Accept & Continue',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.kWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for section titles to maintain consistency
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.kBlack,
      ),
    ).padOnly(top: 20.0, bottom: 8.0);
  }

  // Helper widget for section content for consistent styling
  Widget _buildSectionContent(String content) {
    return Text(
      content,
      textAlign: TextAlign.justify,
      style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.black54),
    );
  }
}
