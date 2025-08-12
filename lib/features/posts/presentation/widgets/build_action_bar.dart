import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/features/posts/data/providers/post_detail_provider.dart';
import 'package:deranest/features/posts/presentation/widgets/comment_sheet.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

class BuildActionBar extends ConsumerWidget {
  final PostDetailModel post;
  const BuildActionBar({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postDetailProvider); 
    final notifier = ref.read(postDetailProvider.notifier); 

    return Container(
      height: context.h(7),
      color: AppColors.kPostBgColor.withAlpha(130),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          Row(
            children: [
              // Like Button
              IconButton(
                icon: Icon(
                  CupertinoIcons.heart_solid,
                  color: state.like ? AppColors.kRed : AppColors.kWhite,
                  size: 28,
                ),
                onPressed: notifier.onLikeClicked,
              ),
              // Comment Button
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

          // Share Button
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: VectorGraphic(
                  loader: AssetBytesLoader(SvgAssets.sendButton),
                  width: context.w(6.5),
                ),
              ),
              
          // Bookmark Button   
          IconButton(
                onPressed: () 
                {
                  notifier.onBookmarkClicked;
                },
                icon: Icon(
                  CupertinoIcons.bookmark_solid,
                  color: state.bookmark
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
