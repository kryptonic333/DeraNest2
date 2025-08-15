import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/data/dummy_lists/story_list.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/posts/data/providers/post_detail_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StoryCircle extends ConsumerWidget {
  const StoryCircle({super.key, required this.index});
  // Feed Screen Controller

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postDetailProvider);
    final notifier = ref.read(postDetailProvider.notifier);
    return GestureDetector(
      onTap: () {
        notifier.onStoryClicked();
        context.push(Routes.storyViewer);
      },
      child: Container(
        width: context.w(33),
        height: context.h(9),
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: context.w(0.75),
            color: state.isStoryViewed
                ? AppColors.kHintTextColor
                : AppColors.kAbortColor,
          ),
        ),
        child: CircleAvatar(
          backgroundImage: dummyStories[index].imageUrl != null
              ? AssetImage(dummyStories[index].imageUrl!)
              : null,
        ),
      ),
    );
  }
}
