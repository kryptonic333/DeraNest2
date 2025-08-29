
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// enum CallType { voice, video }

// @HiveType(typeId: 0)
// class Call extends HiveObject {
//   @HiveField(0)
//   final String id;
//   @HiveField(1)
//   final String initiatorId;
//   @HiveField(2)
//   final List<String> participantIds;
//   @HiveField(3)
//   final CallType type;
//   @HiveField(4)
//   final DateTime startTime;
//   @HiveField(5)
//   final DateTime? endTime;
//   @HiveField(6)
//   final String status;
//   @HiveField(7)
//   final Duration? duration;
//   @HiveField(8)
//   final String? conversationId;

//   Call({
//     required this.id,
//     required this.initiatorId,
//     required this.participantIds,
//     required this.type,
//     required this.startTime,
//     this.endTime,
//     required this.status,
//     this.duration,
//     this.conversationId,
//   });

//   Call copyWith({
//     String? id,
//     String? initiatorId,
//     List<String>? participantIds,
//     CallType? type,
//     DateTime? startTime,
//     DateTime? endTime,
//     String? status,
//     Duration? duration,
//     String? conversationId,
//   }) {
//     return Call(
//       id: id ?? this.id,
//       initiatorId: initiatorId ?? this.initiatorId,
//       participantIds: participantIds ?? this.participantIds,
//       type: type ?? this.type,
//       startTime: startTime ?? this.startTime,
//       endTime: endTime ?? this.endTime,
//       status: status ?? this.status,
//       duration: duration ?? this.duration,
//       conversationId: conversationId ?? this.conversationId,
//     );
//   }
// }

// @HiveType(typeId: 2)
// class Conversation extends HiveObject {
//   @HiveField(0)
//   final String id;
//   @HiveField(1)
//   final Profile participant;
//   @HiveField(2)
//   final List<Message> messages;

//   Conversation({
//     required this.id,
//     required this.participant,
//     required this.messages,
//   });
// }

// @HiveType(typeId: 3)
// class InboxThread extends HiveObject {
//   @HiveField(0)
//   final String id;
//   @HiveField(1)
//   final List<String> participantIds;
//   @HiveField(2)
//   final String title;
//   @HiveField(3)
//   final String? imageUrl;
//   @HiveField(4)
//   final String lastMessageContent;
//   @HiveField(5)
//   final DateTime lastMessageTime;
//   @HiveField(6)
//   final int unreadCount;
//   @HiveField(7)
//   final bool isGroupChat;

//   InboxThread({
//     required this.id,
//     required this.participantIds,
//     required this.title,
//     this.imageUrl,
//     required this.lastMessageContent,
//     required this.lastMessageTime,
//     this.unreadCount = 0,
//     this.isGroupChat = false,
//   });

//   InboxThread copyWith({
//     String? id,
//     List<String>? participantIds,
//     String? title,
//     String? imageUrl,
//     String? lastMessageContent,
//     DateTime? lastMessageTime,
//     int? unreadCount,
//     bool? isGroupChat,
//   }) {
//     return InboxThread(
//       id: id ?? this.id,
//       participantIds: participantIds ?? this.participantIds,
//       title: title ?? this.title,
//       imageUrl: imageUrl ?? this.imageUrl,
//       lastMessageContent: lastMessageContent ?? this.lastMessageContent,
//       lastMessageTime: lastMessageTime ?? this.lastMessageTime,
//       unreadCount: unreadCount ?? this.unreadCount,
//       isGroupChat: isGroupChat ?? this.isGroupChat,
//     );
//   }
// }

// enum MessageType { sentText, receivedText, sentVoice, receivedVoice ,sentImage,
//   receivedImage,}

// @HiveType(typeId: 4)
// class Message extends HiveObject {
//   @HiveField(0)
//   final String id;
//   @HiveField(1)
//   final String title;
//   @HiveField(2)
//   final String senderId;
//   @HiveField(3)
//   final String receiverId;
//   @HiveField(4)
//   final String? message;
//   @HiveField(5)
//   final String? imageUrl;
//   @HiveField(6)
//   final String? videoUrl;
//   @HiveField(7)
//   final String? audioUrl;
//   @HiveField(8)
//   final DateTime sentAt;
//   @HiveField(9)
//   final DateTime? readAt;
//   @HiveField(10)
//   final bool isDelivered;
//   @HiveField(11)
//   final bool isRead;
//   @HiveField(12)
//   final MessageType messageType;

//   Message({
//     required this.title,
//     required this.id,
//     required this.senderId,
//     required this.receiverId,
//     this.message,
//     this.imageUrl,
//     this.videoUrl,
//     this.audioUrl,
//     required this.sentAt,
//     this.readAt,
//     this.isDelivered = false,
//     this.isRead = false,
//     required this.messageType,
//   });

//   Message copyWith({
//     String? title,
//     String? id,
//     String? senderId,
//     String? receiverId,
//     String? message,
//     String? imageUrl,
//     String? videoUrl,
//     String? audioUrl,
//     DateTime? sentAt,
//     DateTime? readAt,
//     bool? isDelivered,
//     bool? isRead,
//     MessageType? messageType,
//   }) {
//     return Message(
//       title: title ?? this.title,
//       id: id ?? this.id,
//       senderId: senderId ?? this.senderId,
//       receiverId: receiverId ?? this.receiverId,
//       message: message ?? this.message,
//       imageUrl: imageUrl ?? this.imageUrl,
//       videoUrl: videoUrl ?? this.videoUrl,
//       audioUrl: audioUrl ?? this.audioUrl,
//       sentAt: sentAt ?? this.sentAt,
//       readAt: readAt ?? this.readAt,
//       isDelivered: isDelivered ?? this.isDelivered,
//       isRead: isRead ?? this.isRead,
//       messageType: messageType ?? this.messageType,
//     );
//   }
// }

// @HiveType(typeId: 5)
// class Comment extends HiveObject {
//   @HiveField(0)
//   final String id;
//   @HiveField(1)
//   final String postId;
//   @HiveField(2)
//   final Profile user;
//   @HiveField(3)
//   final String commentText;
//   @HiveField(4)
//   final DateTime commentedAt;

//   Comment({
//     required this.id,
//     required this.postId,
//     required this.user,
//     required this.commentText,
//     required this.commentedAt,
//   });
// }

// @HiveType(typeId: 6)
// class Feed extends HiveObject {
//   @HiveField(0)
//   final String id;
//   @HiveField(1)
//   final String userId;
//   @HiveField(2)
//   final String? imageUrl;
//   @HiveField(3)
//   final String? videoUrl;
//   @HiveField(4)
//   final String? caption;
//   @HiveField(5)
//   final int likesCount;
//   @HiveField(6)
//   final int commentsCount;
//   @HiveField(7)
//   final int sharesCount;
//   @HiveField(8)
//   final bool isLiked;
//   @HiveField(9)
//   final bool isBookmarked;
//   @HiveField(10)
//   final DateTime createdAt;
//   @HiveField(11)
//   final DateTime? updatedAt;

//   Feed({
//     required this.id,
//     required this.userId,
//     this.imageUrl,
//     this.videoUrl,
//     this.caption,
//     this.likesCount = 0,
//     this.commentsCount = 0,
//     this.sharesCount = 0,
//     this.isLiked = false,
//     this.isBookmarked = false,
//     required this.createdAt,
//     this.updatedAt,
    
//   });

//   Feed copyWith({
//     String? id,
//     String? userId,
//     String? imageUrl,
//     String? videoUrl,
//     String? caption,
//     int? likesCount,
//     int? commentsCount,
//     int? sharesCount,
//     bool? isLiked,
//     bool? isBookmarked,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) {
//     return Feed(
//       id: id ?? this.id,
//       userId: userId ?? this.userId,
//       imageUrl: imageUrl ?? this.imageUrl,
//       videoUrl: videoUrl ?? this.videoUrl,
//       caption: caption ?? this.caption,
//       likesCount: likesCount ?? this.likesCount,
//       commentsCount: commentsCount ?? this.commentsCount,
//       sharesCount: sharesCount ?? this.sharesCount,
//       isLiked: isLiked ?? this.isLiked,
//       isBookmarked: isBookmarked ?? this.isBookmarked,
//       createdAt: createdAt ?? this.createdAt,
//       updatedAt: updatedAt ?? this.updatedAt,
//     );
//   }
// }

// @HiveType(typeId: 7)
// class PostDetailModel extends HiveObject {
//   @HiveField(0)
//   final Feed feed;
//   @HiveField(1)
//   final List<Comment> comments;
//   @HiveField(2)
//   final List<Profile> likedBy;
//   @HiveField(3)
//   final Profile user;
//   @HiveField(4)
//   final List<String> tags;

//   PostDetailModel({
//     required this.feed,
//     required this.comments,
//     required this.likedBy,
//     required this.user,
//     required this.tags,
//   });
// }

// @HiveType(typeId: 8)
// class Notification extends HiveObject {
//   @HiveField(0)
//   final String id;
//   @HiveField(1)
//   final String userId;
//   @HiveField(2)
//   final String type;
//   @HiveField(3)
//   final String? sourceUserId;
//   @HiveField(4)
//   final String? sourceObjectId;
//   @HiveField(5)
//   final String? message;
//   @HiveField(6)
//   final bool isRead;
//   @HiveField(7)
//   final DateTime createdAt;
//   @HiveField(8)
//   final Map<String, dynamic>? metadata;

//   Notification({
//     required this.id,
//     required this.userId,
//     required this.type,
//     this.sourceUserId,
//     this.sourceObjectId,
//     this.message,
//     this.isRead = false,
//     required this.createdAt,
//     this.metadata,
//   });

//   Notification copyWith({
//     String? id,
//     String? userId,
//     String? type,
//     String? sourceUserId,
//     String? sourceObjectId,
//     String? message,
//     bool? isRead,
//     DateTime? createdAt,
//     Map<String, dynamic>? metadata,
//   }) {
//     return Notification(
//       id: id ?? this.id,
//       userId: userId ?? this.userId,
//       type: type ?? this.type,
//       sourceUserId: sourceUserId ?? this.sourceUserId,
//       sourceObjectId: sourceObjectId ?? this.sourceObjectId,
//       message: message ?? this.message,
//       isRead: isRead ?? this.isRead,
//       createdAt: createdAt ?? this.createdAt,
//       metadata: metadata ?? this.metadata,
//     );
//   }
// }

// @HiveType(typeId: 9)
// class OnBoardingModel extends HiveObject {
//   @HiveField(0)
//   final String image;
//   @HiveField(1)
//   final String title;
//   @HiveField(2)
//   final String subTitle;

//   OnBoardingModel({
//     required this.image,
//     required this.title,
//     required this.subTitle,
//   });
// }

// @HiveType(typeId: 10)
// class PeopleOnApp extends HiveObject {
//   @HiveField(0)
//   final String id;
//   @HiveField(1)
//   final String name;
//   @HiveField(2)
//   final String username;
//   @HiveField(3)
//   final String email;
//   @HiveField(4)
//   final String? profilePictureUrl;
//   @HiveField(5)
//   final String? gender;
//   @HiveField(6)
//   final List<String>? followers;
//   @HiveField(7)
//   final List<String>? following;
//   @HiveField(8)
//   final DateTime createdAt;

//   PeopleOnApp({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//     this.profilePictureUrl,
//     this.gender,
//     this.followers = const [],
//     this.following = const [],
//     required this.createdAt,
//   });

//   PeopleOnApp copyWith({
//     String? id,
//     String? name,
//     String? username,
//     String? email,
//     String? profilePictureUrl,
//     String? bio,
//     String? gender,
//     List<String>? followers,
//     List<String>? following,
//     DateTime? createdAt,
//   }) {
//     return PeopleOnApp(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       username: username ?? this.username,
//       email: email ?? this.email,
//       profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
//       gender: gender ?? this.gender,
//       followers: followers ?? this.followers,
//       following: following ?? this.following,
//       createdAt: createdAt ?? this.createdAt,
//     );
//   }
// }

// @HiveType(typeId: 11)
// class Profile extends HiveObject {
//   @HiveField(0)
//   final String id;
//   @HiveField(1)
//   final String name;
//   @HiveField(2)
//   final String username;
//   @HiveField(3)
//   final String? profilePictureUrl;
//   @HiveField(4)
//   final String bio;
//   @HiveField(5)
//   final int followersCount;
//   @HiveField(6)
//   final int followingCount;
//   @HiveField(7)
//   final int postsCount;
//   @HiveField(8)
//   final bool isVerified;
//   @HiveField(9)
//   final DateTime createdAt;
//   @HiveField(10)
//   final DateTime? lastSeen;
//   @HiveField(11)
//   final List<String>? posts;
//   @HiveField(12)
//   final String? coverPictureUrl;

//   Profile({
//     required this.id,
//     required this.name,
//     required this.username,
//     this.profilePictureUrl,
//     this.bio = '',
//     this.followersCount = 0,
//     this.followingCount = 0,
//     this.postsCount = 0,
//     this.isVerified = false,
//     required this.createdAt,
//     this.lastSeen,
//     this.posts = const [],
//     this.coverPictureUrl,
//   });

//   Profile copyWith({
//     String? id,
//     String? name,
//     String? username,
//     String? profilePictureUrl,
//     String? bio,
//     int? followersCount,
//     int? followingCount,
//     int? postsCount,
//     bool? isVerified,
//     DateTime? createdAt,
//     DateTime? lastSeen,
//     List<String>? posts,
//     String? coverPictureUrl,
//   }) {
//     return Profile(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       username: username ?? this.username,
//       profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
//       bio: bio ?? this.bio,
//       followersCount: followersCount ?? this.followersCount,
//       followingCount: followingCount ?? this.followingCount,
//       postsCount: postsCount ?? this.postsCount,
//       isVerified: isVerified ?? this.isVerified,
//       createdAt: createdAt ?? this.createdAt,
//       lastSeen: lastSeen ?? this.lastSeen,
//       posts: posts ?? this.posts,
//       coverPictureUrl: coverPictureUrl ?? this.coverPictureUrl,
//     );
//   }
// }

// @HiveType(typeId: 12)
// class Story extends HiveObject {
//   @HiveField(0)
//   final String name;
//   @HiveField(1)
//   final String id;
//   @HiveField(2)
//   final String userId;
//   @HiveField(3)
//   final String? imageUrl;
//   @HiveField(4)
//   final String? videoUrl;
//   @HiveField(5)
//   final String? text;
//   @HiveField(6)
//   final DateTime createdAt;
//   @HiveField(7)
//   final DateTime expiresAt;
//   @HiveField(8)
//   final List<String> viewedBy;
//   @HiveField(9)
//   final bool isViewed;

//   Story({
//     required this.name,
//     required this.id,
//     required this.userId,
//     this.imageUrl,
//     this.videoUrl,
//     this.text,
//     required this.createdAt,
//     required this.expiresAt,
//     this.viewedBy = const [],
//     this.isViewed = false,
//   });

//   Story copyWith({
//     String? name,
//     String? id,
//     String? userId,
//     String? imageUrl,
//     String? videoUrl,
//     String? text,
//     DateTime? createdAt,
//     DateTime? expiresAt,
//     List<String>? viewedBy,
//     bool? isViewed,
//   }) {
//     return Story(
//       name: name ?? this.name,
//       id: id ?? this.id,
//       userId: userId ?? this.userId,
//       imageUrl: imageUrl ?? this.imageUrl,
//       videoUrl: videoUrl ?? this.videoUrl,
//       text: text ?? this.text,
//       createdAt: createdAt ?? this.createdAt,
//       expiresAt: expiresAt ?? this.expiresAt,
//       viewedBy: viewedBy ?? this.viewedBy,
//       isViewed: isViewed ?? this.isViewed,
//     );
//   }
// }

// @HiveType(typeId: 13)
// class Destination extends HiveObject {
//   @HiveField(0)
//   final String label;
//   @HiveField(1)
//   final IconData icon;

//   Destination({required this.label, required this.icon});
// }




