import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/dummy_lists/story_list.dart';
import 'package:deranest/core/presentation/widgets/loading.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/posts/data/providers/post_detail_provider.dart';
import 'package:deranest/features/profile/data/model/profile_model.dart';
import 'package:deranest/features/profile/data/providers/profile_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileHeader extends ConsumerWidget {
  final Profile user;
  final int index;
  const ProfileHeader({super.key, required this.user, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userStreamProvider);
    final state = ref.watch(postDetailProvider);
    final notifier = ref.read(postDetailProvider.notifier);
    return userProfile.when(
      error: (e, st) {
        return Center(child: Text('Error: $e'));
      },
      loading: () => Center(
        child: Loading(size: context.h(5), color: AppColors.kSecondary),
      ),
      data: (entity) {
        if (entity == null) {
          return Text('');
        }
        return Row(
          children: [
            // Story Circle
            GestureDetector(
              onTap: () {
                if (!state.isStoryViewed) {
                  notifier.onStoryClicked();
                }
                context.push(Routes.storyViewer);
              },
              child: Container(
                width: context.w(15),
                height: context.h(6),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: context.w(0.65),
                    color: state.isStoryViewed
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
            context.w(0.125).widthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  entity.name,
                  style: AppTextStyle.kLargeBodyText.copyWith(
                    fontSize: context.w(4.8),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                // User Name
                Text(
                  user.username,
                  style: AppTextStyle.kMediumBodyText.copyWith(color: AppColors.kHintTextColor),
                ),
              ],
            ),
            Divider(color: AppColors.kHintTextColor, thickness: context.w(0.1)),
          ],
        );
      },
    );
  }
}
