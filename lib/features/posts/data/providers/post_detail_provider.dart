import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final postDetailProvider =
    StateNotifierProvider<PostDetailProvider, PostDetailState>(
  (ref) => PostDetailProvider(),
);


class PostDetailState {
  final GlobalKey<FormState> commentFormKey;
  final TextEditingController commentController;
  final ScrollController scrollController;
  final bool like;
  final bool comment;
  final bool share;
  final bool bookmark;
  final bool isStoryViewed;

  PostDetailState({
    required this.commentFormKey,
    required this.commentController,
    required this.scrollController,
    required this.like,
    required this.comment,
    required this.share,
    required this.bookmark,
    required this.isStoryViewed,
  });

  PostDetailState copyWith({
    GlobalKey<FormState>? commentFormKey,
    TextEditingController? commentController,
    ScrollController? scrollController,
    bool? like,
    bool? comment,
    bool? share,
    bool? bookmark,
    bool? isStoryViewed,
  }) {
    return PostDetailState(
      commentFormKey: commentFormKey ?? this.commentFormKey,
      commentController: commentController ?? this.commentController,
      scrollController: scrollController ?? this.scrollController,
      like: like ?? this.like,
      comment: comment ?? this.comment,
      share: share ?? this.share,
      bookmark: bookmark ?? this.bookmark,
      isStoryViewed: isStoryViewed ?? this.isStoryViewed,
    );
  }
}

class PostDetailProvider extends StateNotifier<PostDetailState> {
  PostDetailProvider()
      : super(
          PostDetailState(
            commentFormKey: GlobalKey<FormState>(),
            commentController: TextEditingController(),
            scrollController: ScrollController(),
            like: false,
            comment: false,
            share: false,
            bookmark: false,
            isStoryViewed: false,
          ),
        );

  void onStoryClicked() {
    state = state.copyWith(isStoryViewed: !state.isStoryViewed);
  }

  void onLikeClicked() {
    state = state.copyWith(like: !state.like);
  }

  void onCommentClicked() {
    state = state.copyWith(comment: !state.comment);
  }

  void onShareClicked() {
    state = state.copyWith(share: !state.share);
  }

  void onBookmarkClicked() {
    state = state.copyWith(bookmark: !state.bookmark);
  }

  void clearController() {
    state.commentController.clear();
  }

  @override
  void dispose() {
    state.commentController.dispose();
    state.scrollController.dispose();
    super.dispose();
  }
}

