class Profile {  
  final String id;
  final String name;  
  final String username;
  final String? profilePictureUrl;  
  final String bio;  
  final int followersCount;
  final int followingCount;
  final int postsCount;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime? lastSeen;
  final List<String>? posts;
  final String? coverPictureUrl;

  Profile({
    required this.id,
    required this.name,
    required this.username,
    this.profilePictureUrl,
    this.bio = '',
    this.followersCount = 0,
    this.followingCount = 0,
    this.postsCount = 0,
    this.isVerified = false,
    required this.createdAt,
    this.lastSeen,
    this.posts = const [],
    this.coverPictureUrl,
  });

  Profile copyWith({
    String? id,
    String? name,
    String? username,
    String? profilePictureUrl,
    String? bio,
    int? followersCount,
    int? followingCount,
    int? postsCount,
    bool? isVerified,
    DateTime? createdAt,
    DateTime? lastSeen,
    List<String>? posts,
    String? coverPictureUrl,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      bio: bio ?? this.bio,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      postsCount: postsCount ?? this.postsCount,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      lastSeen: lastSeen ?? this.lastSeen,
      posts: posts ?? this.posts,
      coverPictureUrl: coverPictureUrl ?? this.coverPictureUrl,
    );
  }
}