import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';

import 'package:deranest/features/posts/data/providers/post_detail_provider.dart';
import 'package:deranest/features/posts/presentation/widgets/build_action_bar.dart';
import 'package:deranest/features/posts/presentation/widgets/build_post_header.dart';
import 'package:deranest/features/posts/presentation/widgets/comment_field.dart';
import 'package:deranest/features/posts/presentation/widgets/comment_sheet.dart';
import 'package:deranest/features/posts/presentation/widgets/liked_by_row.dart';
import 'package:deranest/features/splash/presentation/widgets/app_header.dart';
import 'package:extensions_kit/extensions_kit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class PostDetailScreen extends ConsumerWidget {
  
  final int index;
  // PostDetailScreen Model
  final PostDetailModel post;
  const PostDetailScreen({super.key, required this.post, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postDetailProvider); 
    
    return CustomSafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: CustomIconButton(
            onTap: () {
              context.pop();
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
          controller: state.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header section with user profile
              BuildPostHeader( index: index),

              // Post image
              Container(
                color: AppColors.kPostBgColor,
                height: context.h(38),
                width: double.infinity,
                child: Image.asset(AppImages.profileImage, fit: BoxFit.cover),
              ),

              // Post actions row (like, comment, share, bookmark)
              BuildActionBar(post: post),
              // People who liked row and Post info
              _buildPostInfoSection(context),

              // The inline comment field at the very bottom
              CommentField().padOnly(
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
        LikedByRow(likedBy: post.likedBy),
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
          '4:50 Am',
          style: AppTextStyle.kSmallBodyText.copyWith(
            color: AppColors.kHintTextColor,
          ),
        ).padAll(5),
      ],
    ).padAll(5);
  }
}

