
import 'package:deranest/features/feed/data/model/feed_model.dart';
import 'package:deranest/features/posts/data/model/comment_model.dart';
import 'package:deranest/features/profile/data/model/profile_model.dart';

class PostDetailModel {
  final Feed feed;
  final List<Comment> comments;
  final List<Profile> likedBy; 
  final Profile user;
  final List<String> tags;
  
  PostDetailModel({
    required this.feed,
    required this.comments,
    required this.likedBy,
    required this.user,
    required this.tags,
  });

  // toJson() Method
  Map<String, dynamic> toJson() {
    return {
      'feed': feed.toJson(),
      'comments': comments.map((c) => c.toJson()).toList(),
      'likedBy': likedBy.map((p) => p.toJson()).toList(),
      'user': user.toJson(),
      'tags': tags,
    };
  }


  // fromJson() Method
  factory PostDetailModel.fromJson(Map<String, dynamic> json) {
    return PostDetailModel(
      feed: Feed.fromJson(json['feed']),
      comments: (json['comments'] as List)
          .map((c) => Comment.fromJson(c))
          .toList(),
      likedBy: (json['likedBy'] as List)
          .map((p) => Profile.fromJson(p, p['id']))
          .toList(),
      user: Profile.fromJson(json['user'], json['user']['id']),
      tags: List<String>.from(json['tags']),
    );
  }
}
