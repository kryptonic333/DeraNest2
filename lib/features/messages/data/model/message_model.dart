enum MessageType { sentText, receivedText, sentVoice, receivedVoice ,sentImage,
  receivedImage,}

class Message  {
  final String id; 
  final String title;  
  final String senderId;  
  final String receiverId;
  final String? message; 
  final String? imageUrl;  
  final String? videoUrl;  
  final String? audioUrl; 
  final DateTime sentAt;
  final DateTime? readAt; 
  final bool isDelivered;
  final bool isRead;
  final MessageType messageType;

  Message({
    required this.title,
    required this.id,
    required this.senderId,
    required this.receiverId,
    this.message,
    this.imageUrl,
    this.videoUrl,
    this.audioUrl,
    required this.sentAt,
    this.readAt,
    this.isDelivered = false,
    this.isRead = false,
    required this.messageType,
  });

  Message copyWith({
    String? title,
    String? id,
    String? senderId,
    String? receiverId,
    String? message,
    String? imageUrl,
    String? videoUrl,
    String? audioUrl,
    DateTime? sentAt,
    DateTime? readAt,
    bool? isDelivered,
    bool? isRead,
    MessageType? messageType,
  }) {
    return Message(
      title: title ?? this.title,
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      message: message ?? this.message,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      audioUrl: audioUrl ?? this.audioUrl,
      sentAt: sentAt ?? this.sentAt,
      readAt: readAt ?? this.readAt,
      isDelivered: isDelivered ?? this.isDelivered,
      isRead: isRead ?? this.isRead,
      messageType: messageType ?? this.messageType,
    );
  }

  // toJson() Method
  Map<String, dynamic> toJson() {
  return {
    'id': id,
    'title': title,
    'senderId': senderId,
    'receiverId': receiverId,
    'message': message,
    'imageUrl': imageUrl,
    'videoUrl': videoUrl,
    'audioUrl': audioUrl,
    'sentAt': sentAt.toIso8601String(),
    'readAt': readAt?.toIso8601String(),
    'isDelivered': isDelivered,
    'isRead': isRead,
    'messageType': messageType.name,
  };
}


// fromJson() Method
factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      title: json['title'] as String,
      senderId: json['senderId'] as String,
      receiverId: json['receiverId'] as String,
      message: json['message'] as String?,
      imageUrl: json['imageUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      audioUrl: json['audioUrl'] as String?,
      sentAt: DateTime.parse(json['sentAt']),
      readAt: json['readAt'] != null ? DateTime.parse(json['readAt']) : null,
      isDelivered: json['isDelivered'] ?? false,
      isRead: json['isRead'] ?? false,
      messageType: MessageType.values.firstWhere(
        (e) => e.name == json['messageType'],
        orElse: () => MessageType.sentText, // fallback
      ),
    );
  }
}