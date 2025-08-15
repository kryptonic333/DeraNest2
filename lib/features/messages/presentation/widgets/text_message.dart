
// NO CHANGES NEEDED FOR THE WIDGETS BELOW

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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
          topLeft: Radius.circular(isMe ? 12 : 4),
          topRight: Radius.circular(isMe ? 4 : 12),
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