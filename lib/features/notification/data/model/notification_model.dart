
class Notification  
{  
  // Variables
  final String id; 
  final String userId;  
  final String type; 
  final String? sourceUserId;
  final String? sourceObjectId;
  final String? message; 
  final bool isRead;
  final DateTime createdAt;
  final Map<String, dynamic>? metadata;
  // Constructors
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

  // Copy With Method
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

  // toJson() Method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'type': type,
      'sourceUserId': sourceUserId,
      'sourceObjectId': sourceObjectId,
      'message': message,
      'isRead': isRead,
      'createdAt': createdAt.toIso8601String(), // store as String
      'metadata': metadata,
    };
  }

  //fromJson() Method
  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: json['type'] as String,
      sourceUserId: json['sourceUserId'] as String?,
      sourceObjectId: json['sourceObjectId'] as String?,
      message: json['message'] as String?,
      isRead: json['isRead'] ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      metadata: json['metadata'] != null
          ? Map<String, dynamic>.from(json['metadata'])
          : null,
    );
  }
}