import 'package:deranest/features/authentication/data/model/user_model.dart';

class Profile 
{
  final UserModel person;
  final String username;
  final String? bio;
  final DateTime? lastSeen;
  final List<String>? posts
  ;
  final String? coverPictureUrl;

  Profile({
    required this.person,
    required this.username,
    this.bio = '',
    this.lastSeen,
    this.posts = const [],
    this.coverPictureUrl,
  });

  Profile copyWith({
    UserModel? person,
    String? username,
    String? bio,
    DateTime? lastSeen,
    List<String>? posts,
    String? coverPictureUrl,
  }) {
    return Profile(
      person: person ?? this.person,
      username: username ?? this.username,
      bio: bio ?? this.bio,
      lastSeen: lastSeen ?? this.lastSeen,
      posts: posts ?? this.posts,
      coverPictureUrl: coverPictureUrl ?? this.coverPictureUrl,
    );
  }

  // toJson() Method
  Map<String, dynamic> toJson() {
    return {
      'person': person.toJson(),
      'username': username,
      'bio': bio,
      'lastSeen': lastSeen?.toIso8601String(),
      'posts': posts,
      'coverPictureUrl': coverPictureUrl,
    };
  }

  // fromJson() Method
  factory Profile.fromJson(Map<String, dynamic> json, String documentId) {
    return Profile(
      person: UserModel.fromJson(json['person'], documentId),
      username: json['username'] ?? '',
      bio: json['bio'] ?? '',
      lastSeen: json['lastSeen'] != null ? DateTime.tryParse(json['lastSeen']) : null,
      posts: json['posts'] != null ? List<String>.from(json['posts']) : [],
      coverPictureUrl: json['coverPictureUrl'],
    );
  }
}
