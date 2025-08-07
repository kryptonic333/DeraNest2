import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  // OnBoarding Screen Controller required
  // OnBoarding Contents Model required
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kTransparent,
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.kWhite,
        child: CustomSafeArea(
          child: PageView.builder(
            controller: controller.controller,
            onPageChanged: controller.updateCurrentPage,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: onBoardingContents.length,
            itemBuilder: (context, index) {
              final content = onBoardingContents[index];
              final isLast = index == onBoardingContents.length - 1;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _TopSection(index: index, controller: controller),
                  // SizedBox(height: context.h(2)),
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
                  _DotsIndicator(
                    index: index,
                    currentIndex: controller.currentPage.value,
                  ),

                  SizedBox(height: context.h(4)),
                  CustomElevatedButton(
                    borderRadius: 10,
                    buttonColor: AppColors.kSecondary,
                    width: context.w(93),
                    title: isLast ? 'Get Started' : 'Next',
                    onPress: () {
                      if (isLast) {
                        // Get.offAll(AskUserAuth());
                      } else {
                        // controller.nextPage();
                      }
                    },
                  ).padOnly(bottom: context.h(10)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

//Top Section
class _TopSection extends StatelessWidget {
  final int index;
  // OnBoard Controller
  final OnBoardingScreenController controller;

  const _TopSection({required this.index, required this.controller});

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
                      onTap: controller.previousPage,
                      iconColor: AppColors.kBlack,
                      icon: Icons.arrow_back_rounded,
                    ).padAll(context.h(1)),
              isLast
                  ? SizedBox(width: context.h(1))
                  : CustomElevatedButton(
                      buttonColor: AppColors.kPrimary,
                      textColor: AppColors.kBlack,
                      title: 'Skip',
                      onPress: () => controller.controller.jumpToPage(
                        onBoardingContents.length - 1,
                      ),
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

// Dots Indicator
class _DotsIndicator extends StatelessWidget {
  final int index;
  final int currentIndex;

  const _DotsIndicator({required this.index, required this.currentIndex});

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
