
import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/features/feed/presentation/widgets/post_icon_button.dart';
import 'package:deranest/features/posts/data/providers/post_detail_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

class BottomActionBar extends ConsumerWidget {

  final Feed feed;

  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final VoidCallback onBookmark;

  const BottomActionBar({
    super.key,
    required this.feed,

    required this.onLike,
    required this.onComment,
    required this.onShare,
    required this.onBookmark,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postDetailProvider);

    return Container(
      width: double.infinity,
      height: context.h(6),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.kBlack.withAlpha(120),
            AppColors.kWhite.withAlpha(100),
          ],
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Like Button
              PostIconButton(
                icon: CupertinoIcons.heart_solid,
                color: state.like ? AppColors.kRed : AppColors.kWhite,
                onTap: onLike,
              ).padLeft(context.w(1.5)),
              // Likes Count
              Text(
                ' ${feed.likesCount}',
                style: AppTextStyle.kMediumBodyText.copyWith(
                  color: AppColors.kWhite,
                ),
              ),

              // Comment Button
              PostIconButton(
                icon: CupertinoIcons.chat_bubble_text_fill,
                color: AppColors.kWhite,
                onTap: onComment,
              ).padLeft(context.w(1)),
              // Comment Count
              Text(
                ' ${feed.commentsCount}',
                style: AppTextStyle.kMediumBodyText.copyWith(
                  color: AppColors.kWhite,
                ),
              ),
            ],
          ),

          Row(
            children: [
              // Share Button 
              GestureDetector(
                onTap: onShare,
                child: VectorGraphic(
                  loader: AssetBytesLoader(SvgAssets.sendButton),

                  width: context.w(6.5),
                ),
              ),
              SizedBox(width: context.w(2)),

              // BookMark Button
              PostIconButton(
                color: state.bookmark
                    ? AppColors.kSecondarySupport.withAlpha(80)
                    : AppColors.kWhite,
                icon: CupertinoIcons.bookmark_solid,
                onTap: onBookmark,
              ).padRight(context.w(2.5)),
            ],
          ),
        ],
      ),
    );
  }
}