import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/data/dummy_lists/feed_list.dart';
import 'package:deranest/features/authentication/data/model/user_model.dart';
import 'package:deranest/features/posts/data/model/comment_model.dart';
import 'package:deranest/features/posts/data/model/post_detail_model.dart';
import 'package:deranest/features/profile/data/model/profile_model.dart';

List<PostDetailModel> dummyPostDetailList = [
  // 1
  PostDetailModel(
    feed: dummyFeedList[0],
    user: Profile(
      person: UserModel(
      id: 'user_claire_d',
      name: 'Claire D.',
      email: '',
      phone: '',
      gender: '',
      profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
     
     
      username: '@claire_d',
      
      bio: 'Nature lover 🌿 | Traveler ✈️',
     
    ),
    tags: ['nature', 'sunset'],
    likedBy: [
      Profile(
        person: UserModel(
      id: 'user_1',
      name: 'Diego',
      email: '',
      phone: '',
      gender: '',
      profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),      
      username: '@diego222',
       
        
      ),
      Profile(
        person: UserModel(
      id: 'user_2',
      name: 'Andres Louis',
      email: '',
      phone: '',
      gender: '',
      profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
    username: '@andres_l',
    ),
    ],
    comments: [
      Comment(
        id: 'comment_1',
        postId: 'feed_001',
        user: Profile(
          person: UserModel(
      id: 'user_3',
      name: 'Emily Rose',
      email: '',
      phone: '',
      gender: '',
      profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
    username: '@emily',
    ),
        commentText: 'Wow, such a beautiful cat photo!',
        commentedAt: DateTime.now().subtract(Duration(minutes: 20)),
      ),
      Comment(
        id: 'comment_2',
        postId: 'feed_001',
        user: Profile(
          person: UserModel(
      id: 'user_4 ',
      name: 'Noah Smith',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
     username: '@noahs',
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
      person: UserModel(
      id: 'user_claire_d',
      name: 'Claire D.',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
    username: '@claire_d',
    bio: 'Nature lover 🌿 | Traveler ✈️',
    ),
    tags: ['nature', 'sunset'],
    likedBy: [
      Profile(
        person: UserModel(
        id: 'user_1',
     name: 'Diego',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
      
        
        username: '@diego222',
       
      ),
      Profile(
        person: UserModel(
        id: 'user_2',
        name: 'Andres Louis', 
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ), 
    username: '@andres_l',
    ),
    ],
    comments: [
      Comment(
        id: 'comment_1',
        postId: 'feed_001',
        user: Profile(
          person: UserModel(
         id: 'user_3',
          name: 'Emily Rose',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ), 
         
          username: '@emilyr',
         
        ),
        commentText: 'Wow, such a beautiful cat photo!',
        commentedAt: DateTime.now().subtract(Duration(minutes: 20)),
      ),
      Comment(
        id: 'comment_2',
        postId: 'feed_001',
        user: Profile(
          person: UserModel(
        id: 'user_4',
          name: 'Noah Smith',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
     username: '@noahs',
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
       person: UserModel(
        id: 'user_claire_d',
      name: 'Claire D.',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
     username: '@claire_d',
     bio: 'Nature lover 🌿 | Traveler ✈️',
      
    ),
    tags: ['nature', 'sunset'],
    likedBy: [
      Profile(
        person: UserModel(
       id: 'user_1',
        name: 'Diego',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
        
        username: '@diego222',
        
      ),
      Profile(
         person: UserModel(
      id: 'user_2',
        name: 'Andres Louis',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),        
        username: '@andres_l',
        
      ),
    ],
    comments: [
      Comment(
        id: 'comment_1',
        postId: 'feed_001',
        user: Profile(
           person: UserModel(
       id: 'user_3',
          name: 'Emily Rose',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
      username: '@emilyr',
    ),
        commentText: 'Wow, such a beautiful cat photo!',
        commentedAt: DateTime.now().subtract(Duration(minutes: 20)),
      ),
      Comment(
        id: 'comment_2',
        postId: 'feed_001',
        user: Profile(
          person: UserModel(
       id: 'user_4',
          name: 'Noah Smith',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
     username: '@noahs',
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
      person: UserModel(
      id: 'user_claire_d',
      name: 'Claire D.',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
     username: '@claire_d',   
      bio: 'Nature lover 🌿 | Traveler ✈️',      
    ),
    tags: ['nature', 'sunset'],
    likedBy: [
      Profile(
        person: UserModel(
        id: 'user_1',
        name: 'Diego',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
    username: '@diego222',
        
      ),
      Profile(
        person: UserModel(
        id: 'user_2',
        name: 'Andres Louis',
      email: '',
      phone: '',
      gender: '',
     profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
      createdAt: DateTime.now(),
    ),
     username: '@andres_l',
    ),
    ],
    comments: [
      Comment(
        id: 'comment_1',
        postId: 'feed_001',
        user: Profile(
          person: UserModel(
         id: 'user_3',
         name: 'Emily Rose',
         email: '',
         phone: '',
         gender: '',
         profilePictureUrl: AppImages.profileImage,
         followersCount: 0,
         followingCount: 0,
         postsCount: 0,
         isVerified: false,
         createdAt: DateTime.now(),
    ),
     username: '@emilyr',
     ),
        commentText: 'Wow, such a beautiful cat photo!',
        commentedAt: DateTime.now().subtract(Duration(minutes: 20)),
      ),
      Comment(
        id: 'comment_2',
        postId: 'feed_001',
        user: Profile(
          person: UserModel(
        id: 'user_4',
          name: 'Noah Smith',
         email: '',
         phone: '',
         gender: '',
         profilePictureUrl: AppImages.profileImage,
         followersCount: 0,
         followingCount: 0,
         postsCount: 0,
         isVerified: false,
         createdAt: DateTime.now(),
    ),
    username: '@noahs',
    ),
        commentText: 'Where is this place?',
        commentedAt: DateTime.now().subtract(Duration(hours: 1)),
      ),
    ],
  ),
];
