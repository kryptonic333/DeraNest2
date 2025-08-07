
import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/features/feed/presentation/widgets/profile_header.dart';
import 'package:deranest/features/feed/presentation/widgets/story_circle.dart';
import 'package:deranest/features/posts/presentation/screens/post_detail_screen.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

// Feed Screen Controller Required
class MainFeedScreen extends StatelessWidget {
  const MainFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body:  Column(
            children: [
              // Stories Section
              SizedBox(
                height: context.h(12),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  itemCount: dummyStories.length,
                  itemBuilder: (context, index) {
                    return _StoryCircleItem(
                      index: index,
                      story: dummyStories[index],
                      controller: controller,
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

                    return _FeedCard(
                      feed: feed,
                      controller: controller,
                      index: i,
                    );
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
  const _StoryCircleItem({
    required this.story,
    required this.controller,
    required this.index,
  });
  // Feed Screen Controller Required
  final HomeScreenController controller;
  // Story Model
  final Story story;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StoryCircle(controller: controller, index: index),
          //SizedBox(height: context.h(1)),
          Text(
            ' ${story.name}', // Should be story.userName
            style: AppTextStyle.kDefaultBodyText,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

// Feed Card
class _FeedCard extends StatelessWidget {
  const _FeedCard({
    required this.feed,
    required this.controller,
    required this.index,
  });
  // Feed Screen Controller Required
  final HomeScreenController controller;
  // Feed Model Required
  final Feed feed;
  final int index;

  @override
  Widget build(BuildContext context) {
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
              controller: controller,
            ).padOnly(top: 8, left: 8),
            SizedBox(height: context.h(1)),
            GestureDetector(
              onTap: () {
              // Navigate to Post Detail Screen
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
                  controller: controller,
                  onLike: controller.onLikeClicked,
                  onComment: controller.onCommentClicked,
                  onShare: controller.onShareClicked,
                  onBookmark: controller.onBookmarkClicked,
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
class _BottomActionBar extends StatelessWidget {
  // Feed Model Required
  final Feed feed;
  // Feed Screen Model
  final HomeScreenController controller;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final VoidCallback onBookmark;

  const _BottomActionBar({
    required this.feed,
    required this.controller,
    required this.onLike,
    required this.onComment,
    required this.onShare,
    required this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
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
                color: controller.like.value
                    ? AppColors.kRed
                    : AppColors.kWhite,
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
                  loader: AssetBytesLoader(IconAssets.sendButton),

                  width: context.w(6.5),
                ),
              ),
              SizedBox(width: context.w(2)),

              _PostIconButton(
                color: controller.bookmark.value
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
