import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/features/feed/presentation/widgets/story_circle.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class StoryCircleItem extends StatelessWidget {
  const StoryCircleItem({
    
    super.key,required this.story, required this.index});

  final Story story;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w(20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          // Story Circle
          StoryCircle(index: index),
          // User Name - Who posted Story
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


