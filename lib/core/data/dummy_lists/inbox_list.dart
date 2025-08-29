import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/features/messages/data/model/inbox_thread_model.dart';

List<InboxThread> dummyMessageThreadList = [
  InboxThread(
    id: 'thread_001',
    participantIds: ['user_001', 'user_002'],
    title: 'Claire Dawson',
    imageUrl: AppImages.profileImage,
    lastMessageContent: 'Hey! Are we still meeting tomorrow?',
    lastMessageTime: DateTime.now().subtract(Duration(minutes: 10)),
    unreadCount: 2,
    isGroupChat: false,
  ),
  InboxThread(
    id: 'thread_002',
    participantIds: ['user_001', 'user_003'],
    title: 'John Doe',
    imageUrl: AppImages.profileImage,
    lastMessageContent: 'Got it. Thanks!',
    lastMessageTime: DateTime.now().subtract(Duration(hours: 1)),
    unreadCount: 0,
    isGroupChat: false,
  ),
  InboxThread(
    id: 'thread_003',
    participantIds: ['user_001', 'user_004', 'user_005', 'user_006'],
    title: 'Team Project Chat',
    imageUrl: AppImages.postDetailImage,
    lastMessageContent: 'Let\'s push the code by EOD.',
    lastMessageTime: DateTime.now().subtract(Duration(hours: 4)),
    unreadCount: 5,
    isGroupChat: true,
  ),
  InboxThread(
    id: 'thread_004',
    participantIds: ['user_001', 'user_007'],
    title: 'Alice Smith',
    imageUrl: AppImages.profileImage,
    lastMessageContent: 'Happy Birthday! 🎉',
    lastMessageTime: DateTime.now().subtract(Duration(days: 1)),
    unreadCount: 0,
    isGroupChat: false,
  ),
  InboxThread(
    id: 'thread_005',
    participantIds: ['user_001', 'user_008', 'user_009'],
    title: 'Family Group',
    imageUrl: AppImages.postDetailImage,
    lastMessageContent: 'Dinner is ready 🥘',
    lastMessageTime: DateTime.now().subtract(Duration(minutes: 30)),
    unreadCount: 1,
    isGroupChat: true,
  ),
];

