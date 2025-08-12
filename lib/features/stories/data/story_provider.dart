import 'package:deranest/core/routing/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:story_view/story_view.dart'; 


// Provider
final addStoryProvider =
    StateNotifierProvider<AddStoryNotifier, AddStoryState>(
  (ref) => AddStoryNotifier(),
);

// State class
class AddStoryState {
  final bool isCamera;
  final bool isShotTaken;
  final bool isStoryScreen;
  final bool showColors;
  final bool showTextField;
  final bool textPressed;
  final FocusNode focusNode;
  final StoryController storyController;
  final TextEditingController storyTextController;

  AddStoryState({
    required this.isCamera,
    required this.isShotTaken,
    required this.isStoryScreen,
    required this.showColors,
    required this.showTextField,
    required this.textPressed,
    required this.focusNode,
    required this.storyController,
    required this.storyTextController,
  });

  AddStoryState copyWith({
    bool? isCamera,
    bool? isShotTaken,
    bool? isStoryScreen,
    bool? showColors,
    bool? showTextField,
    bool? textPressed,
    FocusNode? focusNode,
    StoryController? storyController,
    TextEditingController? storyTextController,
  }) {
    return AddStoryState(
      isCamera: isCamera ?? this.isCamera,
      isShotTaken: isShotTaken ?? this.isShotTaken,
      isStoryScreen: isStoryScreen ?? this.isStoryScreen,
      showColors: showColors ?? this.showColors,
      showTextField: showTextField ?? this.showTextField,
      textPressed: textPressed ?? this.textPressed,
      focusNode: focusNode ?? this.focusNode,
      storyController: storyController ?? this.storyController,
      storyTextController:
          storyTextController ?? this.storyTextController,
    );
  }
}

// StateNotifier
class AddStoryNotifier extends StateNotifier<AddStoryState> {
  AddStoryNotifier()
      : super(
          AddStoryState(
            isCamera: false,
            isShotTaken: false,
            isStoryScreen: false,
            showColors: false,
            showTextField: false,
            textPressed: false,
            focusNode: FocusNode(),
            storyController: StoryController(),
            storyTextController: TextEditingController(),
          ),
        );

  void textPressedToggle() {
    state = state.copyWith(textPressed: !state.textPressed);
  }

  void toggleStoryScreen() {
    state = state.copyWith(isStoryScreen: !state.isStoryScreen);
  }

  void showColorsToggle() {
    state = state.copyWith(showColors: !state.showColors);
  }

  void showTextFieldToggle() {
    state = state.copyWith(showTextField: !state.showTextField);
  }

  void toggleCamera() {
    state = state.copyWith(isCamera: !state.isCamera);
  }

  void toggleShotTaken() {
    state = state.copyWith(isShotTaken: !state.isShotTaken);
  }

  void publishStory(BuildContext context) {
    context.push(Routes.storyViewer);
  }

  @override
  void dispose() {
    state.focusNode.dispose();
    state.storyController.dispose();
    state.storyTextController.dispose();
    super.dispose();
  }
}


