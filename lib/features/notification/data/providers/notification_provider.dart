import 'package:deranest/core/data/dummy_lists/notification_list.dart';
import 'package:deranest/core/data/dummy_lists/user_names_notify.dart';
import 'package:deranest/features/notification/data/model/notification_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationProvider =
    StateNotifierProvider<NotificationNotifier, List<Notification>>(
  (ref) => NotificationNotifier(),
);


// --- State Notifier ---
class NotificationNotifier extends StateNotifier<List<Notification>> {
  NotificationNotifier() : super(dummyNotificationList);

  List<Notification> get newNotifications =>
      state.where((n) => !n.isRead).toList();

  List<Notification> get earlierNotifications =>
      state.where((n) => n.isRead).toList();

  String getUserName(String? userId) {
    if (userId == null) return 'Someone';
    return dummyUserNames[userId] ?? 'Someone';
  }

  void markAsRead(String id) {
    state = state
        .map((n) => n.id == id ? Notification(
          createdAt: DateTime(2025),
          type: '',id: n.id, isRead: true, userId: n.userId) : n)
        .toList();
  }
}


