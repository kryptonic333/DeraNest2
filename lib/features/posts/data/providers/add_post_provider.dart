import 'dart:io';

import 'package:deranest/core/presentation/widgets/snackbar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod/riverpod.dart';

// Provider
final addPostProvider = StateNotifierProvider<AddPostController, AddPostState>(
  (ref) => AddPostController(),
);

// State class to hold all the fields
class AddPostState {
  final bool isExpanded;
  final bool isImagePicked;
  final bool isStoryScreen;
  final TextEditingController textController;
  final XFile? pickedImage;
  final XFile? pickedVideo;
  final bool isUploading;

  AddPostState({
    this.pickedImage,
    this.pickedVideo,
    required this.isImagePicked,
    required this.isExpanded,
    required this.isUploading,
    required this.isStoryScreen,
    required this.textController,
  });

  //copyWith Method
  AddPostState copyWith({
    final XFile? pickedImage,
    final XFile? pickedVideo,
    bool? isImagePicked,
    bool? isExpanded,
    bool? isUploading,
    bool? isStoryScreen,
    TextEditingController? textController,
  }) {
    return AddPostState(
      pickedVideo: pickedVideo ?? this.pickedVideo,
      pickedImage: pickedImage ?? this.pickedImage,
      isImagePicked: isImagePicked ?? this.isImagePicked,
      isExpanded: isExpanded ?? this.isExpanded,
      isUploading: isUploading ?? this.isUploading,
      isStoryScreen: isStoryScreen ?? this.isStoryScreen,
      textController: textController ?? this.textController,
    );
  }
}

class AddPostController extends StateNotifier<AddPostState> {
  AddPostController()
    : super(
        AddPostState(
          isImagePicked: false,
          isExpanded: false,
          isUploading: false,
          isStoryScreen: false,
          textController: TextEditingController(),
        ),
      );
  final ImagePicker _picker = ImagePicker();

  // Pick image from Gallery
  Future<void> pickImageFromGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      state = state.copyWith(pickedImage: image);
    } else {
      state = state.copyWith(
        pickedVideo: null,
        pickedImage: null,
        isImagePicked: false,
      );
    }
  }

  // Pick video from Gallery
  Future<void> pickVideoFromGallery() async {
    final image = await _picker.pickVideo(source: ImageSource.gallery);
    if (image != null) {
      state = state.copyWith(pickedVideo: image);
    } else {
      state = state.copyWith(
        pickedVideo: null,
        pickedImage: null,
        isImagePicked: false,
      );
    }
  }

  // Pick image from Camera
  Future<void> pickImageFromCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      state = state.copyWith(pickedImage: image);
    } else {
      state = state.copyWith(
        pickedVideo: null,
        pickedImage: null,
        isImagePicked: false,
      );
    }
  }

  // ImagePicked or Not
  void toggleImagePicked() {
    state = state.copyWith(
      isImagePicked: !state.isImagePicked,
      pickedImage: null,
    );
  }

  // Is It a Story Screen Or Not
  void toggleStoryScreen() {
    state = state.copyWith(isStoryScreen: !state.isStoryScreen);
  }

  // Animated Container Expansion Control func()
  void toggleExpanded() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  // Send Story to Firebase Storage
  Future<void> publishPost(BuildContext context) async {
    if (state.pickedImage == null) return;
    try {
      // make isUploading true when uploading process starts
      state = state.copyWith(isUploading: true);
      // A file name given
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      // Folder for storing Story Images
      final ref = FirebaseStorage.instance.ref().child(
        "postUploads/$fileName.jpg",
      );
      // Put Image in the folder
      await ref.putFile(File(state.pickedImage!.path));
      // Get the url of the image
      final url = await ref.getDownloadURL();
      // You can store this url in Firestore or keep in state
      debugPrint("Uploaded: $url");
      // Change the state
      state = state.copyWith(
        isUploading: false,
        pickedImage: null,
        pickedVideo: null,
      );
      // Show Snackbar
      ShowSnackbar1.success(context, 'Post Added Successfully!');
    } catch (e) {
      // Snackbar for Showing Error
      ShowSnackbar1.error(context, ' $e');
    }
  }

  @override
  void dispose() {
    state.textController.dispose();
    super.dispose();
  }
}
