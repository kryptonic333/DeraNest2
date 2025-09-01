import 'package:deranest/features/messages/data/model/message_model.dart';
import 'package:deranest/features/profile/data/model/profile_model.dart';

class Conversation {
  final String id;

  final Profile participant;

  final List<Message> messages;

  Conversation({
    required this.id,
    required this.participant,
    required this.messages,
  });
 Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participant': participant.toJson(),
      'messages': messages.map((msg) => msg.toJson()).toList(),
    };
  }
}
