import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/dummy_lists/feed_list.dart';
import 'package:deranest/core/data/dummy_lists/profile_list.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/presentation/widgets/loading.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/profile/data/providers/profile_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userStreamProvider);
    final profile = dummyProfileList[0];
    final userImages = dummyFeedList.where((feed) => feed.imageUrl != null).toList();
    return userProfile.when(
      data: (user) {
        // If the user is null, return this
        if (user == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconButton(
                      onTap: () {
                        context.push(Routes.setting);
                      },
                      icon: Icons.settings,
                      iconColor: AppColors.kBlack.withAlpha(200),
                      iconSize: context.h(5),
                    ),
                    Text(
                      "Proceed to Settings",
                      style: AppTextStyle.kHeadingText.copyWith(color: AppColors.kHintTextColor),
                    ),
                  ],
                ),

                Image.asset(AppImages.errorImage),

                Text("User not found", style: AppTextStyle.kMediumBodyText.copyWith(color: AppColors.kRed)),
              ],
            ),
          );
        }
        // Else return this
        return CustomSafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              image: DecorationImage(
                image: profile.person.profilePictureUrl != null
                    ? AssetImage(profile.coverPictureUrl!)
                    : AssetImage(AppImages.profileImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: AppColors.kTransparent,
              body: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: CustomIconButton(
                      onTap: () {
                        context.push(Routes.setting);
                      },
                      icon: Icons.settings,
                      iconColor: AppColors.kPostBgColor.withAlpha(200),
                      iconSize: context.h(5),
                    ),
                  ),
                  // Top area
                  Expanded(child: SizedBox()),
                  // Bottom area
                  SizedBox(
                    height: context.h(55),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Main profile container
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            color: AppColors.kWhite.withAlpha(150),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: context.h(8)),
                                  // Stats Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            user.postsCount.toString(),
                                            style: AppTextStyle.kVeryLargeBodyText.copyWith(
                                              color: AppColors.kBlack,
                                            ),
                                          ),
                                          Text(
                                            'Posts',
                                            style: AppTextStyle.kLargeBodyText.copyWith(
                                              color: AppColors.kBlack,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: context.h(5),
                                        width: context.w(0.5),
                                        decoration: BoxDecoration(
                                          color: AppColors.kBlack,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            user.followersCount.toString(),
                                            style: AppTextStyle.kVeryLargeBodyText.copyWith(
                                              color: AppColors.kBlack,
                                            ),
                                          ),
                                          Text(
                                            'Followers',
                                            style: AppTextStyle.kLargeBodyText.copyWith(
                                              color: AppColors.kBlack,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: context.h(5),
                                        width: context.w(0.5),
                                        decoration: BoxDecoration(
                                          color: AppColors.kBlack,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            user.followingCount.toString(),
                                            style: AppTextStyle.kVeryLargeBodyText.copyWith(
                                              color: AppColors.kBlack,
                                            ),
                                          ),
                                          Text(
                                            'Following',
                                            style: AppTextStyle.kLargeBodyText.copyWith(
                                              color: AppColors.kBlack,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  context.h(2).heightBox,
                                  // Name
                                  Text(
                                    user.name,
                                    style: AppTextStyle.kVeryLargeBodyText.copyWith(color: AppColors.kBlack),
                                  ),
                                  context.h(2).heightBox,
                                  // Username
                                  Text(
                                    profile.username,
                                    style: AppTextStyle.kLargeBodyText.copyWith(color: AppColors.kBlack),
                                  ),
                                  context.h(1.5).heightBox,
                                  // Bio
                                  Text(
                                    profile.bio!,
                                    style: AppTextStyle.kDefaultBodyText.copyWith(color: AppColors.kBlack),
                                    textAlign: TextAlign.center,
                                  ).padHrz(context.h(6)),
                                  context.h(2.3).heightBox,
                                  // Grid Container
                                  Container(
                                    height: context.h(40),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.kWhite.withAlpha(200),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                      ),
                                      child: GridView.builder(
                                        itemCount: userImages.length,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 6.0,
                                          mainAxisSpacing: 6.0,
                                          childAspectRatio: 1,
                                        ),
                                        itemBuilder: (context, index) {
                                          final imageUrl = userImages[index].imageUrl!;
                                          return ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: index == 0 ? Radius.circular(50) : Radius.circular(5),
                                              topRight: index == 2 ? Radius.circular(50) : Radius.circular(5),
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            ),
                                            child: Image.asset(imageUrl, fit: BoxFit.cover),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Notched Profile Avatar positioned at top center
                        Positioned(
                          top: -context.h(7),
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: context.w(0.5), color: AppColors.kAbortColor),
                              ),
                              child: CircleAvatar(
                                radius: context.w(15),
                                backgroundImage: profile.person.profilePictureUrl != null
                                    ? AssetImage(profile.person.profilePictureUrl!)
                                    : AssetImage(AppImages.profileImage),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (e, st) {
        return Center(child: Text('Error: $e'));
      },
      loading: () => Center(
        child: Loading(size: context.h(10), color: AppColors.kSecondary),
      ),
    );
  }
}
