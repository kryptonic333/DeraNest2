import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/data/dummy_lists/profile_list.dart';
import 'package:deranest/features/authentication/data/model/user_model.dart';
import 'package:deranest/features/messages/data/model/conversation_model.dart';
import 'package:deranest/features/messages/data/model/message_model.dart';
import 'package:deranest/features/profile/data/model/profile_model.dart';

List<Conversation> dummyConversations = [
  // --- Conversation 1: A one-on-one chat with Claire Dawson ---
  Conversation(
    id: 'congo_claire_001',
    participant: dummyProfileList[0],
    messages: [
      Message(
        title: 'Claire Dawson',
        id: 'msg_101',
        senderId: 'user_002',
        receiverId: 'user_001',

        imageUrl: AppImages.profileImage,
        sentAt: DateTime.now().subtract(const Duration(hours: 1)),
        messageType: MessageType.sentImage,
      ),

      Message(
        title: 'Claire Dawson',
        id: 'msg_102',
        senderId: 'user_001',
        receiverId: 'user_002',
        message: 'Thanks, John! Appreciate it. It was an amazing trip.',
        sentAt: DateTime.now().subtract(const Duration(minutes: 58)),
        messageType: MessageType.receivedText,
      ),
    ],
  ),

  // --- Conversation 2: A one-on-one chat with Alice Smith ---
  Conversation(
    id: 'congo_alice_003',
    participant: dummyProfileList[2],
    messages: [
      Message(
        title: 'Alice Smith',
        id: 'msg_201',
        senderId: 'user_002',
        receiverId: 'user_003',
        message: 'Hey Alice, your digital art is incredible!',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
        messageType: MessageType.sentText,
      ),
    ],
  ),

  // --- Conversation 3: A placeholder for a group chat ---
  Conversation(
    id: 'congo_group_tech',

    participant: Profile(
      person: UserModel(
     id: 'group_tech_01',
      name: 'Flutter Devs',
      email: '',
      phone: '',
      gender: '',
      profilePictureUrl: AppImages.profileImage,
      followersCount: 0,
      followingCount: 0,
      postsCount: 0,
      isVerified: false,
       createdAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
     username: 'flutter_devs_group',
    ),
    messages: [
      Message(
        title: 'Flutter Devs',
        id: 'msg_301',
        senderId: 'user_004',
        receiverId: 'group_tech_01',
        imageUrl: AppImages.postDetailImage,
        sentAt: DateTime.now().subtract(const Duration(minutes: 30)),
        messageType: MessageType.receivedImage,
      ),
      Message(
        title: 'Flutter Devs',
        id: 'msg_302',
        senderId: 'user_002',
        receiverId: 'group_tech_01',
        message: 'Yes! The performance improvements are noticeable.',
        sentAt: DateTime.now().subtract(const Duration(minutes: 25)),
        messageType: MessageType.sentText,
      ),
    ],
  ),
];
