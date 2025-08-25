import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class ImageMessage extends StatelessWidget {
  final String imageUrl;
  final bool isMe;
  final Profile participant;
  const ImageMessage({
    super.key,
    required this.imageUrl,
    required this.isMe,
    required this.participant,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isMe)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: context.h(2),

                  backgroundImage: AssetImage(
                    participant.profilePictureUrl ?? AppImages.profileImage,
                  ),
                  backgroundColor: AppColors.kHintTextColor,
                ),
              ],
            ),
          if (!isMe) context.h(0.5).heightBox,
          Container(
            constraints: BoxConstraints(
              maxWidth: context.w(60),
              maxHeight: context.h(25),
            ),
            padding: EdgeInsets.all(context.w(0.75)),
            decoration: BoxDecoration(
              gradient: isMe
                  ? LinearGradient(
                      colors: [
                        AppColors.kSecondarySupport,
                        AppColors.kAbortColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: isMe ? null : AppColors.kHintTextColor.withAlpha(20),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  isMe ? context.w(1.7) : context.h(0.5),
                ),
                topRight: Radius.circular(
                  isMe ? context.h(0.5) : context.w(1.7),
                ),
                bottomLeft: const Radius.circular(12),
                bottomRight: const Radius.circular(12),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                width: context.h(60),
                fit: BoxFit.cover,
              ),
            ),
          ).padSymmetric(vertical: context.h(0.5), horizontal: context.w(1.7)),
          context.h(0.5).heightBox,
          Text(
            // time utility - Specified for specific functionality
            // formatTimeOnly(message.sentAt),
            '12:34 Am',
            style: AppTextStyle.kSmallBodyText,
          ),
        ],
      ).padSymmetric(vertical: context.h(0.5), horizontal: context.w(1.7)),
    );
  }
}
