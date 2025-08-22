


import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  final String message;
  final bool isMe;
  const TextMessage({super.key,required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.w(75)),
      padding:  EdgeInsets.symmetric(horizontal: context.w(1.8), vertical: context.h(1.2)),
      decoration: BoxDecoration(
        gradient: isMe
            ? LinearGradient(
                colors: [AppColors.kSecondarySupport, AppColors.kAbortColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isMe ? null : AppColors.kHintTextColor.withAlpha(20),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isMe ? context.w(1.6) : context.w(0.5)),
          topRight: Radius.circular(isMe ? context.w(0.5) : context.w(1.6) ),
          bottomLeft: const Radius.circular(12),
          bottomRight: const Radius.circular(12),
        ),
      ),
      child: Text(
        message,
        style: AppTextStyle.kSmallBodyText.copyWith(
          color: isMe ? AppColors.kWhite : AppColors.kBlack,
        ),
      ),
    );
  }
}