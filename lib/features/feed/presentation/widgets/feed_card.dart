import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/data/dummy_lists/post_detail_list.dart';
import 'package:deranest/core/data/dummy_lists/profile_list.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/feed/data/model/feed_model.dart';
import 'package:deranest/features/feed/presentation/widgets/bottom_action_bar.dart';
import 'package:deranest/features/feed/presentation/widgets/profile_header.dart';
import 'package:deranest/features/posts/data/providers/post_detail_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FeedCard extends ConsumerWidget {
  const FeedCard({
    super.key,
    required this.feed, required this.index});

  final Feed feed;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(postDetailProvider.notifier);
    return Center(
      child: Container(
        margin:  EdgeInsets.symmetric(vertical: context.h(1.2)),
        width: context.w(80),
        height: context.h(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.kPostBgColor.withAlpha(130),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(
              index: index,
              user: dummyProfileList[index],
            ).padOnly(top: context.h(1), left: context.w(1)),
            context.h(1).heightBox,
            GestureDetector(
              onTap: () {
                // Navigate to Post Detail Screen
                context.push(
                  Routes.postDetail,
                  extra: {'post': dummyPostDetailList[index], 'index': index},
                );
              },
              child: Container(
                width: context.w(68),
                height: context.h(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: feed.imageUrl != null
                      ? DecorationImage(
                          image: AssetImage(feed.imageUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                alignment: Alignment.bottomCenter,
                child: BottomActionBar(
                  feed: feed,
                  onLike: notifier.onLikeClicked,
                  onComment: notifier.onCommentClicked,
                  onShare: notifier.onShareClicked,
                  onBookmark: notifier.onBookmarkClicked,
                ),
              ).centerWidget,
            ),
          ],
        ),
      ),
    );
  }
}