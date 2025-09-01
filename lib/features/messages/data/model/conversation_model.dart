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


 // toJson() Method
 Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participant': participant.toJson(),
      'messages': messages.map((msg) => msg.toJson()).toList(),
    };
  }


  // fromJson() Method
  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['id'] as String,
      participant: Profile.fromJson(json['participant']), 
      messages: (json['messages'] as List<dynamic>)
          .map((msg) => Message.fromJson(msg))
          .toList(), 
    );
  }
}
