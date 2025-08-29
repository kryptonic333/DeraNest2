import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_fonts.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/dummy_lists/on_board_list.dart';
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

    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body: PageView.builder(
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
                // Back Button, Skip, Illustration
                TopSection(
                  index: index,
                  onPrevious: notifier.previousPage,
                  onSkip: () => state.controller.jumpToPage(
                    onBoardingContents.length - 1,
                  ),
                ),
                // Title
                Expanded(
                  child: Text(
                    content.title,
                    style: AppTextStyle.kHeadingText.copyWith(
                      fontSize: context.h(3.7),
                      fontFamily: AppFonts.kBold,
                      color: AppColors.kBlack,
                    ),
                    textAlign: TextAlign.center,
                  ).padOnly(top: context.h(1)),
                ),
                // Subtitle
                Text(
                  content.subTitle,
                  style: AppTextStyle.kHeadingText.copyWith(
                    color: AppColors.kBlack,
                    fontSize: context.h(2.3),
                    fontFamily: AppFonts.kRegular,
                  ),
                  textAlign: TextAlign.center,
                ).padOnly(top: context.h(1), bottom: context.h(0.3)),
                // Dots Indicator
                DotsIndicator(currentIndex: state.currentPage),
                context.h(4).heightBox,
                // Next/Get Started Button
                CustomElevatedButton(
                  borderRadius: context.h(1.2),
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
    );
  }
}
