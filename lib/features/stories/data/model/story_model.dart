class Story {
  final String name;  
  final String id; 
  final String userId; 
  final String? imageUrl;
  final String? videoUrl;  
  final String? text;
  final DateTime createdAt; 
  final DateTime expiresAt;
  final List<String> viewedBy; 
  final bool isViewed;

  Story({
    required this.name,
    required this.id,
    required this.userId,
    this.imageUrl,
    this.videoUrl,
    this.text,
    required this.createdAt,
    required this.expiresAt,
    this.viewedBy = const [],
    this.isViewed = false,
  });

  Story copyWith({
    String? name,
    String? id,
    String? userId,
    String? imageUrl,
    String? videoUrl,
    String? text,
    DateTime? createdAt,
    DateTime? expiresAt,
    List<String>? viewedBy,
    bool? isViewed,
  }) {
    return Story(
      name: name ?? this.name,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      viewedBy: viewedBy ?? this.viewedBy,
      isViewed: isViewed ?? this.isViewed,
    );
  }
}