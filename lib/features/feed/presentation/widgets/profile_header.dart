
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/data/dummy_lists/story_list.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/posts/data/providers/post_detail_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileHeader extends ConsumerWidget {
  // User Profile Model
  final Profile user;
  // Feed Screen Controller required
  // final feedController = TextEditingController();
  final int index;
   const ProfileHeader({super.key, required this.user, required this.index});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
  final state = ref.watch(postDetailProvider);
  final notifier = ref.read(postDetailProvider.notifier);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
             notifier.onStoryClicked();
             context.push(Routes.storyViewer);
          },
          child: Container(
            width: context.w(15),
            height: context.h(6),
            decoration: BoxDecoration(
              border: Border.all(
                width: context.w(0.65),
                color:  state.isStoryViewed
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
