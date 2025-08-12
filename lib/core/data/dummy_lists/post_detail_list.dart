import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/data/dummy_lists/feed_list.dart';

List<PostDetailModel> dummyPostDetailList = [
  // 1
  PostDetailModel(
    feed: dummyFeedList[0],
    user: Profile(
      id: 'user_claire_d',
      name: 'Claire D.',
      username: '@claire_d',
      profilePictureUrl: AppImages.profileImage,
      bio: 'Nature lover 🌿 | Traveler ✈️',
      createdAt: DateTime.now(),
    ),
    tags: ['nature', 'sunset'],
    likedBy: [
      Profile(
        id: 'user_1',
        name: 'Diego',
        username: '@diego222',
        profilePictureUrl: AppImages.profileImage,
        createdAt: DateTime.now(),
      ),
      Profile(
        id: 'user_2',
        name: 'Andres Louis',
        username: '@andres_l',
        profilePictureUrl: AppImages.profileImage,
        createdAt: DateTime.now(),
      ),
    ],
    comments: [
      Comment(
        id: 'comment_1',
        postId: 'feed_001',
        user: Profile(
          id: 'user_3',
          name: 'Emily Rose',
          username: '@emily',
          profilePictureUrl: AppImages.profileImage,
          createdAt: DateTime.now(),
        ),
        commentText: 'Wow, such a beautiful cat photo!',
        commentedAt: DateTime.now().subtract(Duration(minutes: 20)),
      ),
      Comment(
        id: 'comment_2',
        postId: 'feed_001',
        user: Profile(
          id: 'user_4',
          name: 'Noah Smith',
          username: '@noahs',
          profilePictureUrl: AppImages.profileImage,
          createdAt: DateTime.now(),
        ),
        commentText: 'Where is this place?',
        commentedAt: DateTime.now().subtract(Duration(hours: 1)),
      ),
    ],
  ),
  // 2
  PostDetailModel(
    feed: dummyFeedList[1],
    user: Profile(
      id: 'user_claire_d',
      name: 'Claire D.',
      username: '@claire_d',
      profilePictureUrl: AppImages.profileImage,
      bio: 'Nature lover 🌿 | Traveler ✈️',
      createdAt: DateTime.now(),
    ),
    tags: ['nature', 'sunset'],
    likedBy: [
      Profile(
        id: 'user_1',
        name: 'Diego',
        username: '@diego222',
        profilePictureUrl: AppImages.profileImage,
        createdAt: DateTime.now(),
      ),
      Profile(
        id: 'user_2',
        name: 'Andres Louis',
        username: '@andres_l',
        profilePictureUrl: AppImages.profileImage,
        createdAt: DateTime.now(),
      ),
    ],
    comments: [
      Comment(
        id: 'comment_1',
        postId: 'feed_001',
        user: Profile(
          id: 'user_3',
          name: 'Emily Rose',
          username: '@emilyr',
          profilePictureUrl: AppImages.profileImage,
          createdAt: DateTime.now(),
        ),
        commentText: 'Wow, such a beautiful cat photo!',
        commentedAt: DateTime.now().subtract(Duration(minutes: 20)),
      ),
      Comment(
        id: 'comment_2',
        postId: 'feed_001',
        user: Profile(
          id: 'user_4',
          name: 'Noah Smith',
          username: '@noahs',
          profilePictureUrl: AppImages.profileImage,
          createdAt: DateTime.now(),
        ),
        commentText: 'Where is this place?',
        commentedAt: DateTime.now().subtract(Duration(hours: 1)),
      ),
    ],
  ),
  // 3
  PostDetailModel(
    feed: dummyFeedList[2],
    user: Profile(
      id: 'user_claire_d',
      name: 'Claire D.',
      username: '@claire_d',
      profilePictureUrl: AppImages.profileImage,
      bio: 'Nature lover 🌿 | Traveler ✈️',
      createdAt: DateTime.now(),
    ),
    tags: ['nature', 'sunset'],
    likedBy: [
      Profile(
        id: 'user_1',
        name: 'Diego',
        username: '@diego222',
        profilePictureUrl: AppImages.profileImage,
        createdAt: DateTime.now(),
      ),
      Profile(
        id: 'user_2',
        name: 'Andres Louis',
        username: '@andres_l',
        profilePictureUrl: AppImages.profileImage,
        createdAt: DateTime.now(),
      ),
    ],
    comments: [
      Comment(
        id: 'comment_1',
        postId: 'feed_001',
        user: Profile(
          id: 'user_3',
          name: 'Emily Rose',
          username: '@emilyr',
          profilePictureUrl: AppImages.profileImage,
          createdAt: DateTime.now(),
        ),
        commentText: 'Wow, such a beautiful cat photo!',
        commentedAt: DateTime.now().subtract(Duration(minutes: 20)),
      ),
      Comment(
        id: 'comment_2',
        postId: 'feed_001',
        user: Profile(
          id: 'user_4',
          name: 'Noah Smith',
          username: '@noahs',
          profilePictureUrl: AppImages.profileImage,
          createdAt: DateTime.now(),
        ),
        commentText: 'Where is this place?',
        commentedAt: DateTime.now().subtract(Duration(hours: 1)),
      ),
    ],
  ),
  // 4
  PostDetailModel(
    feed: dummyFeedList[3],
    user: Profile(
      id: 'user_claire_d',
      name: 'Claire D.',
      username: '@claire_d',
      profilePictureUrl: AppImages.profileImage,
      bio: 'Nature lover 🌿 | Traveler ✈️',
      createdAt: DateTime.now(),
    ),
    tags: ['nature', 'sunset'],
    likedBy: [
      Profile(
        id: 'user_1',
        name: 'Diego',
        username: '@diego222',
        profilePictureUrl: AppImages.profileImage,
        createdAt: DateTime.now(),
      ),
      Profile(
        id: 'user_2',
        name: 'Andres Louis',
        username: '@andres_l',
        profilePictureUrl: AppImages.profileImage,
        createdAt: DateTime.now(),
      ),
    ],
    comments: [
      Comment(
        id: 'comment_1',
        postId: 'feed_001',
        user: Profile(
          id: 'user_3',
          name: 'Emily Rose',
          username: '@emilyr',
          profilePictureUrl: AppImages.profileImage,
          createdAt: DateTime.now(),
        ),
        commentText: 'Wow, such a beautiful cat photo!',
        commentedAt: DateTime.now().subtract(Duration(minutes: 20)),
      ),
      Comment(
        id: 'comment_2',
        postId: 'feed_001',
        user: Profile(
          id: 'user_4',
          name: 'Noah Smith',
          username: '@noahs',
          profilePictureUrl: AppImages.profileImage,
          createdAt: DateTime.now(),
        ),
        commentText: 'Where is this place?',
        commentedAt: DateTime.now().subtract(Duration(hours: 1)),
      ),
    ],
  ),
];
