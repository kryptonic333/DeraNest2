import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/data/dummy_lists/profile_list.dart';

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
        message: 'Hey Claire! Loved your latest travel photos.',
        sentAt: DateTime.now().subtract(const Duration(hours: 1)),
        messageType: MessageType.sentText,
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
      id: 'group_tech_01',
      name: 'Flutter Devs',
      username: 'flutter_devs_group',
      profilePictureUrl: AppImages.profileImage,
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
    messages: [
      Message(
        title: 'Flutter Devs',
        id: 'msg_301',
        senderId: 'user_004', 
        receiverId: 'group_tech_01', 
        message: 'Has anyone tried the new Flutter update yet?',
        sentAt: DateTime.now().subtract(const Duration(minutes: 30)),
        messageType: MessageType.receivedText,
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