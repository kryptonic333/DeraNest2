
class Notification  {
  
  final String id;
 
  final String userId;
  
  final String type;
 
  final String? sourceUserId;

  final String? sourceObjectId;

  final String? message;
 
  final bool isRead;

  final DateTime createdAt;

  final Map<String, dynamic>? metadata;

  Notification({
    required this.id,
    required this.userId,
    required this.type,
    this.sourceUserId,
    this.sourceObjectId,
    this.message,
    this.isRead = false,
    required this.createdAt,
    this.metadata,
  });

  Notification copyWith({
    String? id,
    String? userId,
    String? type,
    String? sourceUserId,
    String? sourceObjectId,
    String? message,
    bool? isRead,
    DateTime? createdAt,
    Map<String, dynamic>? metadata,
  }) {
    return Notification(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      sourceUserId: sourceUserId ?? this.sourceUserId,
      sourceObjectId: sourceObjectId ?? this.sourceObjectId,
      message: message ?? this.message,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      metadata: metadata ?? this.metadata,
    );
  }
}