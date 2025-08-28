import 'package:deranest/core/routing/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_view/story_view.dart';

// Provider
final addStoryProvider = StateNotifierProvider<AddStoryNotifier, AddStoryState>(
  (ref) => AddStoryNotifier(),
);

// State class
class AddStoryState {
  final XFile? pickedImage;
  final bool isVideoPicked;
  final XFile? pickedVideo;
  final bool isImagePicked;
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
    this.pickedImage,
    this.pickedVideo,
    required this.isVideoPicked,
    required this.isImagePicked,
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
    final XFile? pickedVideo,
    final XFile? pickedImage,
    bool? isVideoPicked,
    bool? isImagePicked,
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
      pickedVideo: pickedVideo ?? this.pickedVideo,
      isVideoPicked: isVideoPicked ?? this.isVideoPicked,
      pickedImage: pickedImage ?? this.pickedImage,
      isImagePicked: isImagePicked ?? this.isImagePicked,
      isCamera: isCamera ?? this.isCamera,
      isShotTaken: isShotTaken ?? this.isShotTaken,
      isStoryScreen: isStoryScreen ?? this.isStoryScreen,
      showColors: showColors ?? this.showColors,
      showTextField: showTextField ?? this.showTextField,
      textPressed: textPressed ?? this.textPressed,
      focusNode: focusNode ?? this.focusNode,
      storyController: storyController ?? this.storyController,
      storyTextController: storyTextController ?? this.storyTextController,
    );
  }
}

// StateNotifier
class AddStoryNotifier extends StateNotifier<AddStoryState> {
  AddStoryNotifier()
    : super(
        AddStoryState(
          isVideoPicked: false,
          isImagePicked: false,
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
  final ImagePicker _picker = ImagePicker();
  // Pick image from Gallery
  Future<void> pickImageFromGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      state = state.copyWith(pickedImage: image, isImagePicked: true);
    }
  }

  // Pick video from Gallery
  Future<void> pickVideoFromGallery() async {
    final image = await _picker.pickVideo(source: ImageSource.gallery);
    if (image != null) {
      state = state.copyWith(pickedVideo: image, isVideoPicked: true);
    }
  }

  // Pick image from Camera
  Future<void> pickImageFromCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      state = state.copyWith(pickedImage: image, isImagePicked: true);
    }
  }

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
