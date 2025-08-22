import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/features/notification/data/providers/notification_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) 
  {
    final notifications = ref.watch(notificationProvider.notifier);
    final newNotifs = notifications.newNotifications;
    final earlierNotifs = notifications.earlierNotifications;

    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
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
            ).padLeft(context.w(3.5)),

            // "New" notifications list
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: newNotifs.length,
              itemBuilder: (context, index) {
                final notification = newNotifs[index];
                final String userName = notifications.getUserName(
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
                              text: userName,
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
                        "3:45 Am",
                        // timeAgo(notification.createdAt),
                        style: AppTextStyle.kSmallBodyText.copyWith(
                          color: AppColors.kHintTextColor,
                        ),
                      ),
                      trailing: PopupMenuButton(
                        icon: Icon(Icons.more_horiz_outlined),
                        color: AppColors.kWhite,
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: "Marks As Read",
                            child: Text(
                              "Marks As Read",
                              style: AppTextStyle.kDefaultBodyText,
                            ),
                          ),
                          PopupMenuItem(
                            value: "Delete",
                            child: Text(
                              "Delete",
                              style: AppTextStyle.kDefaultBodyText.copyWith(
                                color: AppColors.kRed,
                              ),
                            ),
                          ),
                        ],
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
              ).padLeft(context.w(3.25)),
            ),

            // "Earlier" notifications list
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: earlierNotifs.length,
              itemBuilder: (context, index) {
                final notification = earlierNotifs[index];
                final String userName = notifications.getUserName(
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
                              text: userName,
                              style: AppTextStyle.kMediumBodyText.copyWith(
                                color: AppColors.kBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '  ${notification.message ?? ""}',
                              style: AppTextStyle.kSmallBodyText.copyWith(
                                color: AppColors.kHintTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(
                        "3:45 Am",
                        // timeAgo(notification.createdAt),
                        style: AppTextStyle.kSmallBodyText.copyWith(
                          color: AppColors.kHintTextColor,
                        ),
                      ),
                      trailing: PopupMenuButton(
                        icon: Icon(Icons.more_horiz_outlined),
                        color: AppColors.kWhite,
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: "Marks As Read",
                            child: Text(
                              "Marks As Read",
                              style: AppTextStyle.kDefaultBodyText,
                            ),
                          ),
                          PopupMenuItem(
                            value: "Delete",
                            child: Text(
                              "Delete",
                              style: AppTextStyle.kDefaultBodyText.copyWith(
                                color: AppColors.kRed,
                              ),
                            ),
                          ),
                        ],
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
