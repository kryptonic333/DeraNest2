import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider 
final chatProvider =
    StateNotifierProvider<ChatNotifier, ChatState>((ref) => ChatNotifier());

// State class
class ChatState {
  final TextEditingController searchController;
  final TextEditingController messageController;

  ChatState({
    required this.searchController,
    required this.messageController,
  });

  ChatState copyWith({
    TextEditingController? searchController,
    TextEditingController? messageController,
  }) {
    return ChatState(
      searchController: searchController ?? this.searchController,
      messageController: messageController ?? this.messageController,
    );
  }
}

// StateNotifier
class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier()
      : super(ChatState(
          searchController: TextEditingController(),
          messageController: TextEditingController(),
        ));

  @override
  void dispose() {
    state.searchController.dispose();
    state.messageController.dispose();
    super.dispose();
  }
}


