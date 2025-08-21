import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/data/adapters.dart';

List<Message> dummyMessages = [
  //1
  Message(
    title: 'Claire Dawson',
    id: 'msg_001',
    senderId: 'user_1',
    receiverId: 'user_2',
    message: 'Hey! How are you?',
    sentAt: DateTime.now().subtract(Duration(minutes: 5)),
    readAt: DateTime.now().subtract(Duration(minutes: 2)),
    isDelivered: true,
    isRead: true,
    messageType: MessageType.sentText,
  ),
  //2
  Message(
    title: 'John Doe',
    id: 'msg_002',
    senderId: 'user_2',
    receiverId: 'user_1',
    message: 'I\'m good, thanks! You?',
    sentAt: DateTime.now().subtract(Duration(minutes: 4)),
    readAt: DateTime.now().subtract(Duration(minutes: 2)),
    isDelivered: true,
    isRead: true,
    messageType: MessageType.receivedText,
  ),
  //3
  Message(
    title: 'Team Project Chat',
    id: 'msg_003',
    senderId: 'user_1',
    receiverId: 'user_2',
    audioUrl: null,
    sentAt: DateTime.now().subtract(Duration(minutes: 3)),
    isDelivered: true,
    isRead: false,
    messageType: MessageType.sentVoice,
  ),
  //4
  Message(
    title: 'Alice Smith',
    id: 'msg_004',
    senderId: 'user_2',
    receiverId: 'user_1',
    audioUrl: null,
    sentAt: DateTime.now().subtract(Duration(minutes: 2)),
    isDelivered: true,
    isRead: false,
    messageType: MessageType.receivedVoice,
  ),
  //5
  Message(
    title: 'Family Group',
    id: 'msg_005',
    senderId: 'user_1',
    receiverId: 'user_2',
    message: 'Check this image!',
    imageUrl: AppImages.profileImage,
    sentAt: DateTime.now().subtract(Duration(minutes: 1)),
    isDelivered: true,
    isRead: false,
    messageType: MessageType.sentImage,
  ),
];
