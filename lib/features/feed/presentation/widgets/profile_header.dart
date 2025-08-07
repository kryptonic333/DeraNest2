
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  // User Profile Model
  final Profile user;
  // Feed Screen Controller
  final HomeScreenController controller;
  final int index;
  const ProfileHeader({
    super.key,
    required this.user,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
           
            controller.onStoryClicked();
          },
          child: Container(
            width: context.w(15),
            height: context.h(6),
            decoration: BoxDecoration(
              border: Border.all(
                width: context.w(0.65),
                color: controller.isStoryViewed.value
                    ? AppColors.kHintTextColor.withAlpha(50)
                    : AppColors.kAbortColor,
              ),
              color: AppColors.kWhite,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundImage: dummyStories[index].imageUrl != null
                  ? AssetImage(dummyStories[index].imageUrl!)
                  : null,
            ),
          ).topLeftAlign,
        ),
        SizedBox(width: context.w(0.125)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' ${user.name}', style: AppTextStyle.kMediumBodyText),
            Text(' @${user.username}', style: AppTextStyle.kLargeBodyText),
          ],
        ),
        Divider(color: AppColors.kHintTextColor, thickness: 1),
      ],
    );
  }
}
