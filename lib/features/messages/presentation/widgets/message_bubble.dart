import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/features/messages/presentation/widgets/text_message.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMe;
  final Profile participant;
  const MessageBubble({
    super.key,
    required this.message,
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
                  radius: context.h(2.2),
                  backgroundImage: AssetImage(
                    participant.profilePictureUrl ?? AppImages.profileImage,
                  ),
                  backgroundColor: AppColors.kHintTextColor,
                ),
              ],
            ),
          if (!isMe) context.h(0.5).heightBox,
          if (message.message != null)
            TextMessage(message: message.message!, isMe: isMe),
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
