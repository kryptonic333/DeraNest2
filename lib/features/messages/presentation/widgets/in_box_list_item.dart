// Chat List Item
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class InboxListItem extends StatelessWidget {
  // Conversation Model Required
  final Conversation conversation;

  const InboxListItem({super.key,required this.conversation});

  @override
  Widget build(BuildContext context) {
    final participant = conversation.participant;
    final lastMessage = conversation.messages.isNotEmpty
        ? conversation.messages.last
        : null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: participant.profilePictureUrl != null
              ? AssetImage(participant.profilePictureUrl!)
              : null,
          radius: context.w(6),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                participant.name,
                style: AppTextStyle.kMediumBodyText.copyWith(
                  color: AppColors.kBlack,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                lastMessage?.message ?? 'No messages yet',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.kSmallBodyText,
              ),
            ],
          ),
        ),
        Center(
          child: Text(
            lastMessage != null ? '3:45 Am' : '',
            style: AppTextStyle.kDefaultBodyText.copyWith(
              color: AppColors.kHintTextColor,
              fontSize: 11,
            ),
          ),
        ),
      ],
    ).padSymmetric(horizontal: 12, vertical: 10);
  }
}
