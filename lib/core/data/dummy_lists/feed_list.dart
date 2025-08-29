import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/features/feed/data/model/feed_model.dart';

List<Feed> dummyFeedList = [
  //1
  Feed(
    id: 'feed_002',
    userId: 'user_john_d',
    imageUrl: AppImages.postDetailImage,
    videoUrl: null,
    caption:
        'My new coding project is finally taking shape! #coding #developer',
    likesCount: 85,
    commentsCount: 7,
    sharesCount: 2,
    isLiked: false,
    isBookmarked: true,
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
    
  ),
  //2
  Feed(
    id: 'feed_003',
    userId: 'user_alice_s',
    imageUrl: AppImages.postDetailImage,
    caption: 'Weekend vibes with friends. So much fun! #friends #weekend',
    likesCount: 205,
    commentsCount: 25,
    sharesCount: 12,
    isLiked: true,
    isBookmarked: true,
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
    
  ),
  //3
  Feed(
    id: 'feed_004',
    userId: 'user_bob_m',
    imageUrl: AppImages.profileImage,
    caption:
        'A delicious homemade meal. What are you cooking today? #foodie #cooking',
    likesCount: 98,
    commentsCount: 15,
    sharesCount: 3,
    isLiked: false,
    isBookmarked: false,
    createdAt: DateTime.now().subtract(const Duration(hours: 12)),
    
  ),
  //4
  Feed(
    id: 'feed_005',
    userId: 'user_claire_d',
    imageUrl: AppImages.profileImage,
    caption: 'Morning run views. Stay active! #fitness #morning',
    likesCount: 70,
    commentsCount: 5,
    sharesCount: 1,
    isLiked: true,
    isBookmarked: false,
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
   
  ),
];
