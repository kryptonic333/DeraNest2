import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class TopSection extends StatelessWidget {
  final int index;
  final VoidCallback onPrevious;
  final VoidCallback onSkip;

  const TopSection({
    super.key,
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
              // Skip Button
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
                      buttonColor: AppColors.kWhite,
                      textColor: AppColors.kBlack,
                      title: 'Skip',
                      onPress: onSkip,
                    ).padAll(context.h(1)),
            ],
          ),
          // Circle for Illustration
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
