import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_fonts.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';

import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/onBoarding/data/providers/on_board_provider.dart';
import 'package:deranest/features/onBoarding/presentation/widgets/dots_indicator.dart';
import 'package:deranest/features/onBoarding/presentation/widgets/top_section.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onBoardingProvider);
    final notifier = ref.read(onBoardingProvider.notifier);

    return Container(
      height: double.infinity,
      color: AppColors.kRed,
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body: Container(
          color: AppColors.kWhite,
          child: CustomSafeArea(
            child: PageView.builder(
              controller: state.controller,
              onPageChanged: notifier.updateCurrentPage,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: onBoardingContents.length,
              itemBuilder: (context, index) {
                final content = onBoardingContents[index];
                final isLast = index == onBoardingContents.length - 1;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TopSection(
                      index: index,
                      onPrevious: notifier.previousPage,
                      onSkip: () => state.controller.jumpToPage(
                        onBoardingContents.length - 1,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        content.title,
                        style: AppTextStyle.kHeadingText.copyWith(
                          fontSize: 30,
                          fontFamily: AppFonts.kBold,
                          color: AppColors.kBlack,
                        ),
                        textAlign: TextAlign.center,
                      ).padOnly(top: 10),
                    ),
                    Text(
                      content.subTitle,
                      style: AppTextStyle.kHeadingText.copyWith(
                        color: AppColors.kBlack,
                        fontSize: 18,
                        fontFamily: AppFonts.kRegular,
                      ),
                      textAlign: TextAlign.center,
                    ).padOnly(top: 10, bottom: 3),
                    DotsIndicator(currentIndex: state.currentPage),
                    SizedBox(height: context.h(4)),
                    CustomElevatedButton(
                      borderRadius: 10,
                      buttonColor: AppColors.kSecondary,
                      width: context.w(93),
                      title: isLast ? 'Get Started' : 'Next',
                      onPress: () {
                        if (isLast) {
                          context.go(Routes.welcome);
                        } else {
                          notifier.nextPage();
                        }
                      },
                    ).padOnly(bottom: context.h(10)),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

