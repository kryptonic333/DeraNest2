import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/data/dummy_lists/feed_list.dart';
import 'package:deranest/core/data/dummy_lists/post_detail_list.dart';
import 'package:deranest/core/data/dummy_lists/profile_list.dart';
import 'package:deranest/core/data/dummy_lists/story_list.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/feed/presentation/widgets/profile_header.dart';
import 'package:deranest/features/feed/presentation/widgets/story_circle.dart';
import 'package:deranest/features/posts/data/providers/post_detail_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vector_graphics/vector_graphics.dart';

class MainFeedScreen extends StatelessWidget {
  const MainFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body: Column(
          children: [
            // Stories Section
            SizedBox(
              height: context.h(12),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,

                itemCount: dummyStories.length,
                itemBuilder: (context, index) {
                  return _StoryCircleItem(
                    index: index,
                    story: dummyStories[index],
                  );
                },
              ),
            ),

            // Feed Section
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: dummyFeedList.length,
                itemBuilder: (context, i) {
                  final feed = dummyFeedList[i];
                  if (feed.imageUrl == null) return const SizedBox.shrink();
                  return _FeedCard(feed: feed, index: i);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Story Circle
class _StoryCircleItem extends StatelessWidget {
  const _StoryCircleItem({required this.story, required this.index});

  final Story story;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w(20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          StoryCircle(index: index),

          Text(
            ' ${story.name}',
            style: AppTextStyle.kDefaultBodyText,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    ).padSymmetric(horizontal: 2);
  }
}

// Feed Card
class _FeedCard extends ConsumerWidget {
  const _FeedCard({required this.feed, required this.index});

  final Feed feed;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(postDetailProvider.notifier);
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
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
            ).padOnly(top: 8, left: 8),
            SizedBox(height: context.h(1)),
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

                child: _BottomActionBar(
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

// Bottom Action Bar
class _BottomActionBar extends ConsumerWidget {
  // Feed Model Required
  final Feed feed;

  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final VoidCallback onBookmark;

  const _BottomActionBar({
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
            AppColors.kHintTextColor.withAlpha(100),
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
              _PostIconButton(
                icon: CupertinoIcons.heart_solid,
                color: state.like ? AppColors.kRed : AppColors.kWhite,
                onTap: onLike,
              ).padLeft(context.w(1.5)),
              Text(
                ' ${feed.likesCount}',
                style: AppTextStyle.kMediumBodyText.copyWith(
                  color: AppColors.kWhite,
                ),
              ),

              _PostIconButton(
                icon: CupertinoIcons.chat_bubble_text_fill,
                color: AppColors.kWhite,
                onTap: onComment,
              ).padLeft(context.w(1)),
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
              GestureDetector(
                onTap: onShare,
                child: VectorGraphic(
                  loader: AssetBytesLoader(SvgAssets.sendButton),

                  width: context.w(6.5),
                ),
              ),
              SizedBox(width: context.w(2)),

              _PostIconButton(
                color: state.bookmark
                    ? AppColors.kSecondarySupport.withAlpha(100)
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

// Icon Button Widget
class _PostIconButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  const _PostIconButton({
    required this.icon,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: color, size: 28),
    );
  }
}
