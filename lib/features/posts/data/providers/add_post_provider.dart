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

  AddPostState({
    this.pickedImage,
    required this.isImagePicked,
    required this.isExpanded,
   
    required this.isStoryScreen,
    required this.textController,
  });

  //copyWith Method
  AddPostState copyWith({
    final XFile? pickedImage,
    bool? isImagePicked,
    bool? isExpanded,

    bool? isStoryScreen,
    TextEditingController? textController,
  }) {
    return AddPostState(
      pickedImage: pickedImage ?? this.pickedImage,
      isImagePicked: isImagePicked ?? this.isImagePicked,
      isExpanded: isExpanded ?? this.isExpanded,
      
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
    }
  }

  // Pick video from Gallery
  Future<void> pickVideoFromGallery() async {
    final image = await _picker.pickVideo(source: ImageSource.gallery);
    if (image != null) {
      state = state.copyWith(pickedImage: image);
    }
  }

  // Pick image from Camera
  Future<void> pickImageFromCamera() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      state = state.copyWith(pickedImage: image);
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


  @override
  void dispose() {
    state.textController.dispose();
    super.dispose();
  }
}
