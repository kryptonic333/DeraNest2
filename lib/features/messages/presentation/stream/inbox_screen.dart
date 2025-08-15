import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/data/dummy_lists/conversation_list.dart';
import 'package:deranest/core/data/dummy_lists/profile_list.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/features/messages/presentation/widgets/chat_list_view.dart';
import 'package:deranest/features/messages/presentation/widgets/inbox_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InboxScreen extends ConsumerWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            InboxSearchBar(),
            Expanded(
              child: ChatListView(
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
