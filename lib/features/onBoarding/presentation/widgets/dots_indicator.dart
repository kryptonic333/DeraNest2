import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int currentIndex;

  const DotsIndicator({super.key, required this.currentIndex});

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
        ).padOnly(right: context.w(0.9), top: context.h(8)),
      ),
    );
  }
}
