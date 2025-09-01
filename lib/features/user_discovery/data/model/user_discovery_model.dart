class UserDiscoveryModel { 
  final String id; 
  final String name;
  final String username;
  final String email; 
  final String? profilePictureUrl;
  final String? gender;
  final List<String>? followers;
  final List<String>? following;
  final DateTime createdAt;

  UserDiscoveryModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.profilePictureUrl,
    this.gender,
    this.followers = const [],
    this.following = const [],
    required this.createdAt,
  });

  UserDiscoveryModel copyWith({
    String? id,
    String? name,
    String? username,
    String? email,
    String? profilePictureUrl,
    String? bio,
    String? gender,
    List<String>? followers,
    List<String>? following,
    DateTime? createdAt,
  }) {
    return UserDiscoveryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      gender: gender ?? this.gender,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'gender': gender,
      'followers': followers,
      'following': following,
      'createdAt': createdAt, // Firestore handles DateTime automatically
    };
  }
}
