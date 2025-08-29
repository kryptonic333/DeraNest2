import 'dart:io';
import 'package:deranest/core/presentation/widgets/snackbar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  final bool isUploading;
  final bool showColors;
  final bool showTextField;
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
    required this.isUploading,
    required this.showTextField,
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
    bool? isUploading,
    bool? showColors,
    bool? showTextField,
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
      isUploading: isUploading ?? this.isUploading,
      showColors: showColors ?? this.showColors,
      showTextField: showTextField ?? this.showTextField,
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
          isUploading: false,
          focusNode: FocusNode(),
          storyController: StoryController(),
          storyTextController: TextEditingController(),
        ),
      );

  // var to access imagePicker methods
  final ImagePicker _picker = ImagePicker();

  // Pick image from Gallery
  Future<void> pickImageFromGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      state = state.copyWith(
        pickedImage: image,
        isImagePicked: true,
        pickedVideo: null,
      );
    }
  }

  // Pick video from Gallery
  Future<void> pickVideoFromGallery() async {
    final image = await _picker.pickVideo(source: ImageSource.gallery);
    if (image != null) {
      state = state.copyWith(
        pickedVideo: image,
        isVideoPicked: true,
        pickedImage: null,
      );
    }
  }

  // Pick image from Camera
  Future<void> pickImageFromCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      state = state.copyWith(
        pickedImage: image,
        isImagePicked: true,
        pickedVideo: null,
      );
    }
  }

  // Change state of var isStoryScreen
  void toggleStoryScreen() {
    state = state.copyWith(isStoryScreen: !state.isStoryScreen);
  }

  // Change state of var showColors
  void showColorsToggle() {
    state = state.copyWith(showColors: !state.showColors);
  }

  // Change state of var showTextField
  void showTextFieldToggle() {
    state = state.copyWith(showTextField: !state.showTextField);
  }

  // Change state of var isCamera
  void toggleCamera() {
    state = state.copyWith(isCamera: !state.isCamera);
  }

  // Change state of var isShotTaken
  void toggleShotTaken() {
    state = state.copyWith(isShotTaken: !state.isShotTaken);
  }

  // Send Story to Firebase Storage
  Future<void> publishStory(BuildContext context) async {
    if (state.pickedImage == null) return;
    try {
      // make isUploading true when uploading process starts
      state = state.copyWith(isUploading: true);
      // A file name given
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      // Folder for storing Story Images
      final ref = FirebaseStorage.instance.ref().child(
        "storyUploads/$fileName.jpg",
      );
      // Put Image in the folder
      await ref.putFile(File(state.pickedImage!.path));
      // Get the url of the image
      final url = await ref.getDownloadURL();
      // You can store this url in Firestore or keep in state
      debugPrint("Uploaded: $url");
      // Change the state
      state = state.copyWith(isUploading: false, pickedImage: null);
      // Show Snackbar
      ShowSnackbar1.success(context, 'Story Added Successfully!');
    } catch (e) {
      // Snackbar for Showing Error
      ShowSnackbar1.error(context, ' $e');
    }
  }

  @override
  void dispose() {
    state.focusNode.dispose();
    state.storyController.dispose();
    state.storyTextController.dispose();
    super.dispose();
  }
}
