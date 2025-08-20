import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// Provider 
final chatProvider =
    StateNotifierProvider<ChatNotifier, ChatState>((ref) => ChatNotifier());

// State class
class ChatState {
  final TextEditingController searchController;
  final TextEditingController messageController;
  final XFile? pickedImage; 

  ChatState({
    this.pickedImage,
    required this.searchController,
    required this.messageController,
  });

  ChatState copyWith({
    TextEditingController? searchController,
    TextEditingController? messageController,
    final XFile? pickedImage,
  }) {
    return ChatState(
      searchController: searchController ?? this.searchController,
      messageController: messageController ?? this.messageController,
      pickedImage: pickedImage ?? this.pickedImage,
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
final ImagePicker _picker = ImagePicker();

  // Pick image from Gallery
  Future<void> pickImageFromGallery() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
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
  @override
  void dispose() {
    state.searchController.dispose();
    state.messageController.dispose();
    super.dispose();
  }
}


