import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/onBoarding/data/providers/on_board_provider.dart';
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _TopSection(
                      index: index,
                      onPrevious: notifier.previousPage,
                      onSkip: () => state.controller.jumpToPage(
                        onBoardingContents.length - 1,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        content.title,
                        style: AppTextStyle.kDefaultBodyText,
                        textAlign: TextAlign.center,
                      ).padOnly(top: 10),
                    ),
                    Text(
                      content.subTitle,
                      style: AppTextStyle.kDefaultBodyText,
                      textAlign: TextAlign.center,
                    ).padOnly(top: 10, bottom: 3),
                    _DotsIndicator(currentIndex: state.currentPage),
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

class _TopSection extends StatelessWidget {
  final int index;
  final VoidCallback onPrevious;
  final VoidCallback onSkip;

  const _TopSection({
    required this.index,
    required this.onPrevious,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final content = onBoardingContents[index];
    final isFirst = index == 0;
    final isLast = index == onBoardingContents.length - 1;

    return Container(
      height: context.h(50),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.kSecondarySupport.withAlpha(0),
            AppColors.kSecondarySupport.withAlpha(50),
            AppColors.kSecondarySupport.withAlpha(100),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isFirst
                  ? SizedBox(width: context.h(1))
                  : CustomIconButton(
                      onTap: onPrevious,
                      iconColor: AppColors.kBlack,
                      icon: Icons.arrow_back_rounded,
                    ).padAll(context.h(1)),
              isLast
                  ? SizedBox(width: context.h(1))
                  : CustomElevatedButton(
                      buttonColor: AppColors.kPrimary,
                      textColor: AppColors.kBlack,
                      title: 'Skip',
                      onPress: onSkip,
                    ).padAll(context.h(1)),
            ],
          ),
          Expanded(
            child: CircleAvatar(
              backgroundColor: AppColors.kSecondarySupport.withAlpha(100),
              backgroundImage: AssetImage(content.image),
              radius: context.w(33),
            ).bottomAlign,
          ),
        ],
      ),
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  final int currentIndex;

  const _DotsIndicator({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onBoardingContents.length,
        (i) => AnimatedContainer(
          width: context.w(25),
          height: context.h(0.75),
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: i == currentIndex
                ? AppColors.kSecondarySupport
                : AppColors.kHintTextColor,
          ),
        ).padOnly(right: 5, top: context.h(8)),
      ),
    );
  }
}
