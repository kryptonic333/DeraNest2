import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/messages/presentation/widgets/in_box_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChatListView extends ConsumerWidget {
  final List<Conversation> conversations;

  final Profile currentUser;

  const ChatListView({super.key,required this.conversations, required this.currentUser});

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

          child: InboxListItem(conversation: conversation),
        );
      },
    );
  }
}