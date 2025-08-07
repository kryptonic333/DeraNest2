import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryViewerScreen extends StatelessWidget {
  const StoryViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body: StoryView(
          onComplete: () {
            // Handle story completion
            Navigator.pop(context);
          },
          controller: controller.storyController,
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
