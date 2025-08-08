import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_text_button.dart';
import 'package:deranest/features/posts/presentation/widgets/comment_field.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

void openCommentBottomSheet(
  BuildContext context, {
    // PostDetailScreen Model
  required PostDetailModel post,
}) {
  // Open Bottom Sheet from here.
}

class _CommentBottomSheet extends StatelessWidget {
  const _CommentBottomSheet({required this.post});
  // PostDetailScreen Model
  final PostDetailModel post;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
          ),
          child: Column(
            children: [
              // Draggable handle
              Container(
                height: context.h(.5),
                width: context.w(25),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.kHintTextColor.withAlpha(150),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Text("Comments", style: AppTextStyle.kHeadingText),
              const Divider(),
              // Comment list
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: post.comments.length,
                  itemBuilder: (context, index) {
                    // Widget class for each comment item.
                    return _CommentListItem(comment: post.comments[index]);
                  },
                ),
              ),
              Divider(color: AppColors.kHintTextColor.withAlpha(50), height: 2),
              // Text field to write a comment
              CommentField()
                  .padBottom(context.h(2))
                  .padTop(context.h(1))
                  .padLeft(context.w(2)),
            ],
          ),
        );
      },
    );
  }
}

// A widget class for a single item in the comments list.
class _CommentListItem extends StatelessWidget {
  const _CommentListItem({required this.comment});
  // Comment Model
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: AssetImage(comment.user.profilePictureUrl!),
          ),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: " ${comment.user.name}",
                  style: AppTextStyle.kMediumBodyText,
                ),
                TextSpan(
                  // timeAgo is a utility
                  text: " • 12:23 Am",
                  style: AppTextStyle.kSmallBodyText,
                ),
              ],
            ),
          ),
          subtitle: Text(
            " ${comment.commentText}",
            style: AppTextStyle.kMediumBodyText,
          ),
          trailing: CustomIconButton(
            onTap: () {},
            icon: Icons.favorite_outline_outlined,
            iconColor: AppColors.kHintTextColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(5, 5),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: CustomTextButton(
              fontSize: 12,
              color: AppColors.kHintTextColor,
              fontWeight: FontWeight.normal,
              text: 'Reply',
              onPressed: () {},
            ),
          ),
        ),
      ],
    ).padSymmetric(horizontal: 12.0, vertical: 8.0);
  }
}
