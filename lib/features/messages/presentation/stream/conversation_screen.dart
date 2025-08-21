import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/features/messages/presentation/widgets/conversation_app_bar.dart';
import 'package:deranest/features/messages/presentation/widgets/message_input_bar.dart';
import 'package:deranest/features/messages/presentation/widgets/message_list.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatelessWidget {
  final Conversation conversation;

  final Profile currentUser;

  const ConversationScreen({
    super.key,
    required this.conversation,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: 
        // Custom App Bar
        ConversationAppBar(
          userName: conversation.participant.name,
          activeTime:
              conversation.participant.lastSeen ??
              conversation.participant.createdAt,
          profileImageUrl:
              conversation.participant.profilePictureUrl ??
              AppImages.profileImage,
        ),
        body: Column(
          children: [
            // Message List
            Expanded(
              child: MessageList(
                messages: conversation.messages,
                currentUserId: currentUser.id,
                participant: conversation.participant,
              ),
            ),
            // Bottom Bar
            MessageInputBar(),
          ],
        ),
      ),
    );
  }
}
