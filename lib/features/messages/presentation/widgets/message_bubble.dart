import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/features/messages/presentation/widgets/text_message.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
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
                    radius: 18,

                    backgroundImage: AssetImage(
                      participant.profilePictureUrl ?? AppImages.profileImage,
                    ),
                    backgroundColor: AppColors.kHintTextColor,
                  ),
                ],
              ),
            if (!isMe) const SizedBox(height: 4),
            if (message.message != null)
              TextMessage(message: message.message!, isMe: isMe),
            const SizedBox(height: 4),
            Text(
              // time utility - Specified for specific functionality
              // formatTimeOnly(message.sentAt),
              '12:34 Am',
              style: AppTextStyle.kSmallBodyText,
            ),
          ],
        ),
      ),
    );
  }
}