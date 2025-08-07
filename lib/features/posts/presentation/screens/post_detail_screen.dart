import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/features/feed/presentation/widgets/profile_header.dart';
import 'package:deranest/features/posts/presentation/widgets/comment_field.dart';
import 'package:deranest/features/posts/presentation/widgets/comment_sheet.dart';
import 'package:deranest/features/splash/presentation/widgets/app_header.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PostDetailScreen extends StatelessWidget {
  final int index;
  // PostDetailScreen Model
  final PostDetailViewModel post;
  const PostDetailScreen({super.key, required this.post, required this.index});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: CustomIconButton(
            onTap: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_rounded,
            iconColor: AppColors.kSecondary,
            iconSize: context.w(7),
            usedInAppBar: true,
            paddingAroundIcon: context.w(2),
          ),

          leadingWidth: context.w(11),
          titleSpacing: 0,
          title: AppHeader(),
        ),

        body: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header section with user profile
              BuildPostHeader(controller: controller, index: index),

              // Post image
              dummyPostDetailList[index].feed.imageUrl != null
                  ? Container(
                      color: AppColors.kPostBgColor,
                      height: context.h(38),
                      width: double.infinity,
                      child: Image.asset(
                        dummyPostDetailList[index].feed.imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox.shrink(),

              // Post actions row (like, comment, share, bookmark)
              BuildActionBar(controller: controller, post: post),
              // People who liked row and Post info
              _buildPostInfoSection(context),

              // The inline comment field at the very bottom
              const CommentField().padOnly(
                left: context.w(2),
                right: context.w(2),
                bottom: context.h(2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Builds the main content block including liked by, caption, and comments preview.
  Widget _buildPostInfoSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Overlapping avatars and "Liked By" text
        _LikedByRow(likedBy: post.likedBy),
        SizedBox(height: context.h(3)),

        // Post Caption
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${post.user.name} ',
                style: AppTextStyle.kDefaultBodyText,
              ),
              TextSpan(
                text: post.feed.caption,
                style: AppTextStyle.kMediumBodyText,
              ),
            ],
          ),
        ).padSymmetric(horizontal: 7),
        const SizedBox(height: 5),

        // "View all comments" link
        GestureDetector(
          onTap: () => openCommentBottomSheet(context, post: post),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'View all ',
                  style: AppTextStyle.kMediumBodyText.copyWith(
                    color: AppColors.kHintTextColor,
                  ),
                ),
                TextSpan(
                  text: '${post.comments.length} comments',
                  style: AppTextStyle.kMediumBodyText.copyWith(
                    color: AppColors.kHintTextColor,
                  ),
                ),
              ],
            ),
          ).padAll(10),
        ),
        const SizedBox(height: 5),

        // Single Comment Preview
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${post.comments[0].user.name} ',
                style: AppTextStyle.kMediumBodyText,
              ),
              TextSpan(
                text: ' ${post.comments[0].commentText}',
                style: AppTextStyle.kMediumBodyText,
              ),
            ],
          ),
        ).padOnly(left: 12, right: 7),
        Text(
          // timeAgo is a utility
          timeAgo(post.comments[0].commentedAt),
          style: AppTextStyle.kSmallBodyText.copyWith(
            color: AppColors.kHintTextColor,
          ),
        ).padAll(5),
      ],
    ).padAll(5);
  }
}

// Action Bar
class BuildActionBar extends StatelessWidget {
  // FeedScreen Controller
  final HomeScreenController controller;
  // PostDetailScreen Model
  final PostDetailViewModel post;
  const BuildActionBar({
    super.key,
    required this.controller,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h(7),
      color: AppColors.kPostBgColor.withAlpha(130),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          // Comment Button
          Row(
            children: [
              IconButton(
                icon: Icon(
                  CupertinoIcons.heart_solid,
                  color: controller.like.value
                      ? AppColors.kRed
                      : AppColors.kWhite,
                  size: 28,
                ),
                onPressed: () {
                  controller.onLikeClicked();
                },
              ),

              // Like Button
              IconButton(
                icon: const Icon(
                  CupertinoIcons.chat_bubble_text_fill,
                  color: AppColors.kWhite,
                  size: 28,
                ),
                onPressed: () {
                  openCommentBottomSheet(context, post: post);
                },
              ),
            ],
          ),

          Row(
            children: [
              // Share Button
              GestureDetector(
                onTap: () {},
                child: VectorGraphic(
                  loader: AssetBytesLoader(IconAssets.sendButton),

                  width: context.w(6.5),
                ),
              ),

              // Bookmark Button
              IconButton(
                onPressed: () {
                  controller.onBookmarkClicked();
                },
                icon: Icon(
                  CupertinoIcons.bookmark_solid,
                  color: controller.bookmark.value
                      ? AppColors.kSecondarySupport.withAlpha(100)
                      : AppColors.kWhite,
                  size: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// A  widget for the contents of the comment bottom sheet.

// Builds the top header with profile info and more_vert icon.
class BuildPostHeader extends StatelessWidget {
  final int index;
  final HomeScreenController controller;
  const BuildPostHeader({
    super.key,
    required this.controller,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h(6.5),
      color: AppColors.kWhite,
      padding: const EdgeInsets.only(left: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileHeader(
            user: dummyProfileList[index],
            controller: controller,
            index: index,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded, color: AppColors.kBlack),
          ),
        ],
      ),
    );
  }
}

// A widget class for "Liked By" avatars.
class _LikedByRow extends StatelessWidget {
  const _LikedByRow({required this.likedBy});
  // User Profile Model
  final List<Profile> likedBy;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: context.h(5),
          width: context.w(40),
          child: Stack(
            children: List.generate(
              likedBy.length > 3 ? 3 : likedBy.length, // Show max 3 avatars
              (index) => Positioned(
                left: (15.0 * index), // Overlapping effect
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    likedBy[index].profilePictureUrl!,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: context.w(3)),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Liked by ',
                  style: AppTextStyle.kMediumBodyText.copyWith(
                    color: AppColors.kHintTextColor,
                  ),
                ),
                TextSpan(
                  text: '${likedBy[0].name} and others',
                  style: AppTextStyle.kMediumBodyText.copyWith(
                    color: AppColors.kHintTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
