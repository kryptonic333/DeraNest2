import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = dummyProfileList[0];
    final userImages = dummyFeedList
        .where((feed) => feed.imageUrl != null)
        .toList();
    return CustomSafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          image: DecorationImage(
            image: profile.profilePictureUrl != null
                ? AssetImage(profile.coverPictureUrl!)
                : AssetImage(AppImages.profileImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: AppColors.kTransparent,
          body:  Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: CustomIconButton(
                    onTap: () {
                  
                    },
                    icon: Icons.settings,
                    iconColor: AppColors.kBlack,
                    iconSize: context.h(4),
                  ),
                ),
                // Top area
                Expanded(child: Container()),
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
                          color: AppColors.kHintTextColor.withAlpha(50),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          profile.postsCount.toString(),
                                          style: AppTextStyle
                                              .kMediumBodyText
                                              .copyWith(
                                                color: AppColors.kBlack,
                                              ),
                                        ),
                                        Text(
                                          'Posts',
                                          style: AppTextStyle.kLargeBodyText
                                              .copyWith(
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
                                          profile.followersCount.toString(),
                                          style:
                                              AppTextStyle.kMediumBodyText,
                                        ),
                                        Text(
                                          'Followers',
                                          style: AppTextStyle.kLargeBodyText
                                              .copyWith(
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
                                          profile.followingCount.toString(),
                                          style:
                                              AppTextStyle.kMediumBodyText,
                                        ),
                                        Text(
                                          'Following',
                                          style: AppTextStyle.kLargeBodyText
                                              .copyWith(
                                                color: AppColors.kBlack,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: context.h(2)),
                                // Name
                                Text(
                                  profile.name,
                                  style: AppTextStyle.kVeryLargeBodyText
                                      .copyWith(color: AppColors.kBlack),
                                ),
                                SizedBox(height: 5),
                                // Username
                                Text(
                                  profile.username,
                                  style: AppTextStyle.kDefaultBodyText.copyWith(
                                    color: AppColors.kBlack,
                                  ),
                                ),
                                SizedBox(height: context.h(1.5)),
                                // Bio
                                Text(
                                  profile.bio,
                                  style: AppTextStyle.kSmallBodyText.copyWith(
                                    color: AppColors.kBlack,
                                  ),
                                  textAlign: TextAlign.center,
                                ).padHrz(context.h(6)),
                                SizedBox(height: 20),
                                // Grid Container
                                Container(
                                  height: context.h(40),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
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
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 6.0,
                                            mainAxisSpacing: 6.0,
                                            childAspectRatio: 1,
                                          ),
                                      itemBuilder: (context, index) {
                                        final imageUrl =
                                            userImages[index].imageUrl!;
                                        return ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: index == 0
                                                ? Radius.circular(50)
                                                : Radius.circular(5),
                                            topRight: index == 2
                                                ? Radius.circular(50)
                                                : Radius.circular(5),
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          ),
                                          child: Image.asset(
                                            imageUrl,
                                            fit: BoxFit.cover,
                                          ),
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
                              border: Border.all(
                                width: context.w(0.5),
                                color: AppColors.kAbortColor,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: context.w(15),
                              backgroundImage: profile.profilePictureUrl != null
                                  ? AssetImage(profile.profilePictureUrl!)
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
  }
}
