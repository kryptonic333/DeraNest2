import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/features/stories/data/add_story_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:story_view/story_view.dart';

class StoryViewerScreen extends ConsumerWidget {
  const StoryViewerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addStoryProvider);
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body: StoryView(
          onComplete: () {
            // Handle story completion
            context.pop();
          },
          controller: state.storyController,
          storyItems: [
            StoryItem.text(title: 'Story 1', backgroundColor: AppColors.kRed),
            StoryItem.text(title: 'Story 2', backgroundColor: AppColors.kGreen),
            StoryItem.text(
              title: 'Story 3',
              backgroundColor: AppColors.kHintTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
