import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  
  // NotificationController required
  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.kWhite,

          title: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [AppColors.kSecondarySupport, AppColors.kAbortColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: Text(
              'Notifications',
              style: AppTextStyle.kLargeBodyText.copyWith(
                color: AppColors.kWhite,
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // "New" section header
            Align(
              alignment: Alignment.centerLeft,
              child: Text('New', style: AppTextStyle.kMediumBodyText),
            ).padLeft(10),

            // "New" notifications list
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.newNotifications.length,
              itemBuilder: (context, index) {
                final notification = controller.newNotifications[index];
                final String userName = controller.getUserName(
                  notification.sourceUserId,
                );
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(
                        left: context.w(2),
                        right: context.w(2),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.profileImage),
                      ),
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: ' $userName ',
                              style: AppTextStyle.kMediumBodyText.copyWith(
                                color: AppColors.kBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(text: ' '),
                            TextSpan(
                              text: ' ${notification.message ?? ""} ',
                              style: AppTextStyle.kSmallBodyText.copyWith(
                                color: AppColors.kHintTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        // timeAgo is utility
                        timeAgo(notification.createdAt),
                        style: AppTextStyle.kSmallBodyText.copyWith(
                          color: AppColors.kHintTextColor,
                        ),
                      ),
                      trailing: CustomIconButton(
                        paddingAroundIcon: context.h(0.5),
                        onTap: () {},
                        icon: Icons.more_horiz,
                        iconColor: AppColors.kBlack,
                      ),
                    ),
                  ],
                );
              },
            ),

            // "Earlier" section header
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Earlier',
                style: AppTextStyle.kMediumBodyText,
              ).padLeft(10),
            ),

            // "Earlier" notifications list
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.earlierNotifications.length,
              itemBuilder: (context, index) {
                final notification = controller.earlierNotifications[index];
                final String userName = controller.getUserName(
                  notification.sourceUserId,
                );
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(
                        left: context.w(2),
                        right: context.w(2),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.profileImage),
                      ),
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: ' $userName',
                              style: AppTextStyle.kMediumBodyText.copyWith(
                                color: AppColors.kBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' ${notification.message ?? ""}',
                              style: AppTextStyle.kSmallBodyText.copyWith(
                                color: AppColors.kHintTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        // timeAgo is utility
                        timeAgo(notification.createdAt),
                        style: AppTextStyle.kSmallBodyText.copyWith(
                          color: AppColors.kHintTextColor,
                        ),
                      ),
                      trailing: CustomIconButton(
                        paddingAroundIcon: context.h(0.5),
                        onTap: () {},
                        icon: Icons.more_horiz,
                        iconColor: AppColors.kBlack,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
