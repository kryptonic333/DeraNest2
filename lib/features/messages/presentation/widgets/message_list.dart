import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/features/messages/presentation/widgets/date_chip.dart';
import 'package:deranest/features/messages/presentation/widgets/image_bubble.dart';
import 'package:deranest/features/messages/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageList extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msgIndex = messages.length - 1 - index;
        final msg = messages[msgIndex];
        final isMe = msg.senderId == currentUserId;

        final bool showDateChip = msgIndex == messages.length - 1;

        return Column(
          children: [
            switch (msg.messageType) {
              MessageType.sentText || MessageType.receivedText => MessageBubble(
                message: msg,
                isMe: isMe,
                participant: participant,
              ),
              MessageType.sentImage ||
              MessageType.receivedImage => ImageMessage(
                participant: participant,
                imageUrl: msg.imageUrl!,
                isMe: isMe,
              ),
              MessageType.sentVoice ||
              MessageType.receivedVoice => Placeholder(),
            },
            if (showDateChip) DateChip(time: msg.sentAt),
          ],
        );
      },
    );
  }
}
