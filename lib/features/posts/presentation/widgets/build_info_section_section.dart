import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/features/posts/presentation/widgets/comment_sheet.dart';
import 'package:deranest/features/posts/presentation/widgets/liked_by_row.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class BuildPostInfoSection extends StatelessWidget {
  final PostDetailModel post;
  const BuildPostInfoSection({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
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
                style: AppTextStyle.kMediumBodyText.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
              ),
              TextSpan(
                text: post.feed.caption,
                style: AppTextStyle.kDefaultBodyText.copyWith(
                  color: AppColors.kHintTextColor,
                  fontSize: 15,
                ),
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
                text: '${post.comments[0].user.name} : ',
                style: AppTextStyle.kMediumBodyText,
              ),
              TextSpan(
                text: ' ${post.comments[0].commentText}',
                style: AppTextStyle.kMediumBodyText.copyWith(
                  color: AppColors.kHintTextColor,
                ),
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
