import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/features/posts/presentation/widgets/comment_field.dart';
import 'package:deranest/features/posts/presentation/widgets/comment_list_item.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';


void openCommentBottomSheet(
  BuildContext context, {
  // PostDetailScreen Model
  required PostDetailModel post,
}) {
  // Open Bottom Sheet from here.
  showBottomSheet(
    context: context,
    builder: (b) => _CommentBottomSheet(post: post),
  );
}

class _CommentBottomSheet extends StatelessWidget {
  const _CommentBottomSheet({required this.post});

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
                margin: EdgeInsets.symmetric(vertical: context.h(1.2)),
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
                    return CommentListItem(comment: post.comments[index]);
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

