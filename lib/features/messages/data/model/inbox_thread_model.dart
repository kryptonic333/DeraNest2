class InboxThread  {
 
  final String id;

  final List<String> participantIds;
  
  final String title;

  final String? imageUrl;
 
  final String lastMessageContent;
  
  final DateTime lastMessageTime;
 
  final int unreadCount;

  final bool isGroupChat;

  InboxThread({
    required this.id,
    required this.participantIds,
    required this.title,
    this.imageUrl,
    required this.lastMessageContent,
    required this.lastMessageTime,
    this.unreadCount = 0,
    this.isGroupChat = false,
  });

  InboxThread copyWith({
    String? id,
    List<String>? participantIds,
    String? title,
    String? imageUrl,
    String? lastMessageContent,
    DateTime? lastMessageTime,
    int? unreadCount,
    bool? isGroupChat,
  }) {
    return InboxThread(
      id: id ?? this.id,
      participantIds: participantIds ?? this.participantIds,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      lastMessageContent: lastMessageContent ?? this.lastMessageContent,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      unreadCount: unreadCount ?? this.unreadCount,
      isGroupChat: isGroupChat ?? this.isGroupChat,
    );
  }

  // toJson() Method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participantIds': participantIds,
      'title': title,
      'imageUrl': imageUrl,
      'lastMessageContent': lastMessageContent,
      'lastMessageTime': lastMessageTime.toIso8601String(),
      'unreadCount': unreadCount,
      'isGroupChat': isGroupChat,
    };
  }

  // fromJson() Method
  factory InboxThread.fromJson(Map<String, dynamic> json) {
    return InboxThread(
      id: json['id'] as String,
      participantIds: List<String>.from(json['participantIds'] ?? []),
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String?,
      lastMessageContent: json['lastMessageContent'] as String,
      lastMessageTime: DateTime.parse(json['lastMessageTime']),
      unreadCount: json['unreadCount'] ?? 0,
      isGroupChat: json['isGroupChat'] ?? false,
    );
  }
}