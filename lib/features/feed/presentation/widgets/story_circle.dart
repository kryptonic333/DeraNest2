
import 'package:deranest/core/constants/app_colors.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class StoryCircle extends StatelessWidget {
  const StoryCircle({super.key, required this.controller, required this.index});
  // Feed Screen Controller
  final HomeScreenController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.onStoryClicked();
        
      },
      child: Container(
        width: context.w(30),
        height: context.h(9),
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: context.w(0.75),
            color: controller.isStoryViewed.value
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
