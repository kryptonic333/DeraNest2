import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/features/stories/data/model/story_model.dart';

List<Story> dummyStories = [
  // 1
  Story(
    name: 'Ahmed',
    id: 'story_001',
    userId: 'profile_001',
    imageUrl: AppImages.postDetailImage,
    createdAt: DateTime.now().subtract(Duration(hours: 2)),
    expiresAt: DateTime.now().add(Duration(hours: 22)),
    viewedBy: ['profile_002'],
    isViewed: false,
  ),
  // 2
  Story(
    name: 'Joseph',
    id: 'story_002',
    userId: 'profile_002',
    imageUrl: AppImages.profileImage,
    text: 'Great day at the beach!',
    createdAt: DateTime.now().subtract(Duration(hours: 5)),
    expiresAt: DateTime.now().add(Duration(hours: 19)),
    viewedBy: [],
    isViewed: true,
  ),
  // 3
  Story(
    name: 'Subhan',
    id: 'story_002',
    userId: 'profile_002',
    imageUrl: AppImages.postDetailImage,
    text: 'Great day at the beach!',
    createdAt: DateTime.now().subtract(Duration(hours: 5)),
    expiresAt: DateTime.now().add(Duration(hours: 19)),
    viewedBy: [],
    isViewed: true,
  ),
  // 4
  Story(
    name: 'Usman',
    id: 'story_002',
    userId: 'profile_002',
    imageUrl: AppImages.profileImage,
    text: 'Great day at the beach!',
    createdAt: DateTime.now().subtract(Duration(hours: 5)),
    expiresAt: DateTime.now().add(Duration(hours: 19)),
    viewedBy: [],
    isViewed: true,
  ),
  Story(
    name: 'Usman',
    id: 'story_002',
    userId: 'profile_002',
    imageUrl: AppImages.profileImage,
    text: 'Great day at the beach!',
    createdAt: DateTime.now().subtract(Duration(hours: 5)),
    expiresAt: DateTime.now().add(Duration(hours: 19)),
    viewedBy: [],
    isViewed: true,
  ),
];
