import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/features/messages/presentation/widgets/date_chip.dart';
import 'package:deranest/features/messages/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final List<Message> messages;
  final String currentUserId;

  final Profile participant;

  const MessageList({
    super.key,
    required this.messages,
    required this.currentUserId,
    required this.participant,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        final isMe = msg.senderId == currentUserId;

        final bool showDateChip = index == messages.length - 1;

        return Column(
          children: [
            MessageBubble(message: msg, isMe: isMe, participant: participant),
            if (showDateChip) DateChip(time: msg.sentAt),
          ],
        );
      },
    );
  }
}