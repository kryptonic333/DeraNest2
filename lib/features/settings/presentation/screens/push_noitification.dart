import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class PushNotificationScreen extends StatelessWidget {
  const PushNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        title: const Text("Push Notifications"),
        backgroundColor: AppColors.kWhite,
        foregroundColor: AppColors.kBlack,
        elevation: 1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: const Text("Likes", style: AppTextStyle.kLargeBodyText),
            subtitle: const Text(
              "Get notified when someone likes your post",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: true,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: const Text("Comments", style: AppTextStyle.kLargeBodyText),
            subtitle: const Text(
              "Get notified when someone comments",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: false,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: const Text(
              "New Followers",
              style: AppTextStyle.kLargeBodyText,
            ),
            subtitle: const Text(
              "Get notified when someone follows you",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: true,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: const Text("Messages", style: AppTextStyle.kLargeBodyText),
            subtitle: const Text(
              "Get notified for direct messages",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: true,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: const Text(
              "Mentions & Tags",
              style: AppTextStyle.kLargeBodyText,
            ),
            subtitle: const Text(
              "Get notified when you are tagged or mentioned",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: false,
            onChanged: (val) {},
          ),

          Divider(height: context.h(2), thickness: 1),

          SwitchListTile(
            title: const Text(
              "App Updates",
              style: AppTextStyle.kLargeBodyText,
            ),
            subtitle: const Text(
              "Receive updates about new features",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: true,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: const Text("Reminders", style: AppTextStyle.kLargeBodyText),
            subtitle: const Text(
              "Get reminders to check your feed",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: false,
            onChanged: (val) {},
          ),
        ],
      ).padLeft(context.w(0.5)),
    );
  }
}
