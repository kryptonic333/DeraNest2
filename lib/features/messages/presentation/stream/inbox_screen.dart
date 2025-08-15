import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/data/dummy_lists/conversation_list.dart';
import 'package:deranest/core/data/dummy_lists/profile_list.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/presentation/widgets/custom_text_field.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/messages/data/stream_provider/stream_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class InboxScreen extends ConsumerWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatState = ref.watch(chatProvider);
    final List<Conversation> conversations = dummyConversations;

    final Profile currentUser = dummyProfileList[1];

    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          centerTitle: true,
          title: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [AppColors.kSecondarySupport, AppColors.kAbortColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: Text(
              'Chats',
              style: AppTextStyle.kLargeBodyText.copyWith(
                color: AppColors.kWhite,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            _SearchBar(controller: chatState.searchController),

            Expanded(
              child: _ChatListView(
                conversations: conversations,
                currentUser: currentUser,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Search Bar - No changes needed
class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  const _SearchBar({required this.controller});
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintTextColor: AppColors.kBlack,
      filled: true,
      contentPadding: const EdgeInsets.all(10),
      onSubmitted: (val) => FocusScope.of(context).unfocus(),
      fillColor: AppColors.kHintTextColor.withAlpha(50),
      onTap: () {},
      enabledBorderColor: AppColors.kWhite,
      isPrefixIconEnabled: true,
      preFixIcon: Icons.search,
      controller: controller,
      labelText: null,
      keyboardType: TextInputType.name,
      validator: null,
      textInputAction: TextInputAction.done,
      hintText: 'Search',
    ).padAll(context.h(1.5));
  }
}

class _ChatListView extends ConsumerWidget {
  final List<Conversation> conversations;

  final Profile currentUser;

  const _ChatListView({required this.conversations, required this.currentUser});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: conversations.length,
      itemBuilder: (context, index) {
        final conversation = conversations[index];

        return InkWell(
          onTap: () {
            context.push(
              Routes.conversation,
              extra: {'conversation': conversation, 'profile': currentUser},
            );
          },

          child: _InboxListItem(conversation: conversation),
        );
      },
    );
  }
}

// Chat List Item
class _InboxListItem extends StatelessWidget {
  // Conversation Model Required
  final Conversation conversation;

  const _InboxListItem({required this.conversation});

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
