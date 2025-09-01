import 'package:deranest/features/profile/data/model/profile_model.dart';

class Comment {  
  final String id;
  final String postId; 
  final Profile user;
  final String commentText;
  final DateTime commentedAt;

  Comment({
    required this.id,
    required this.postId,
    required this.user,
    required this.commentText,
    required this.commentedAt,
  });

  // toJson() Method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'postId': postId,
      'user': user.toJson(), 
      'commentText': commentText,
      'commentedAt': commentedAt.toIso8601String(),
    };
  }
}