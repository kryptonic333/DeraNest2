import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/data/dummy_lists/feed_list.dart';
import 'package:deranest/core/data/dummy_lists/story_list.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/features/feed/presentation/widgets/feed_card.dart';
import 'package:deranest/features/feed/presentation/widgets/story_circle_item.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

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
                  return StoryCircleItem(
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
                  return FeedCard(feed: feed, index: i);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
