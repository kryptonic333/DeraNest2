import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class DateChip extends StatelessWidget {
  final DateTime time;
  const DateChip({super.key,required this.time});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: context.w(1.7), vertical: context.h(0.5)),
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.kHintTextColor),
        ),
        child: Text(
          // time utility - Specified for specific functionality
          // messageTime(time),
          'Monday',
          style: AppTextStyle.kSmallBodyText.copyWith(color: AppColors.kBlack),
        ),
      ),
    ).padSymmetric(vertical: 8.0);
  }
}