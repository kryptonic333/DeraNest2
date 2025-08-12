import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

// Provider
final addPostProvider = StateNotifierProvider<AddPostController, AddPostState>(
  (ref) => AddPostController(),
);






// State class to hold all the fields
class AddPostState {
  final bool isExpanded;
  final bool isGesture;
  final bool isStoryScreen;
  final TextEditingController textController;

  AddPostState({
    required this.isExpanded,
    required this.isGesture,
    required this.isStoryScreen,
    required this.textController,
  });

  //copyWith Method
  AddPostState copyWith({
    bool? isExpanded,
    bool? isGesture,
    bool? isStoryScreen,
    TextEditingController? textController,
  }) {
    return AddPostState(
      isExpanded: isExpanded ?? this.isExpanded,
      isGesture: isGesture ?? this.isGesture,
      isStoryScreen: isStoryScreen ?? this.isStoryScreen,
      textController: textController ?? this.textController,
    );
  }
}

class AddPostController extends StateNotifier<AddPostState> {
  AddPostController()
      : super(
          AddPostState(
            isExpanded: false,
            isGesture: true,
            isStoryScreen: false,
            textController: TextEditingController(),
          ),
        );

  void toggleStoryScreen() {
    state = state.copyWith(isStoryScreen: !state.isStoryScreen);
  }

  void toggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  void toggleGesture() {
    state = state.copyWith(isGesture: !state.isGesture);
  }

  void collapse() {
    state = state.copyWith(isExpanded: false);
  }

  @override
  void dispose() {
    state.textController.dispose();
    super.dispose();
  }
}
