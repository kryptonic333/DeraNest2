
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
}
