import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class EmailNotificationScreen extends StatelessWidget {
  const EmailNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        title: const Text("Email Notifications"),
        backgroundColor: AppColors.kWhite,
        foregroundColor: AppColors.kBlack,
        elevation: 1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SwitchListTile(
            title: const Text(
              "Weekly Summary",
              style: AppTextStyle.kLargeBodyText,
            ),
            subtitle: const Text(
              "Receive a weekly summary of your activity",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: true,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: const Text(
              "New Followers",
              style: AppTextStyle.kLargeBodyText,
            ),
            subtitle: const Text(
              "Get emails when someone follows you",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: false,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: const Text(
              "Comments & Mentions",
              style: AppTextStyle.kLargeBodyText,
            ),
            subtitle: const Text(
              "Get emails when you are mentioned or commented on",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: true,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: const Text("Likes", style: AppTextStyle.kLargeBodyText),
            subtitle: const Text(
              "Get emails when someone likes your post",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: true,
            onChanged: (val) {},
          ),
          SwitchListTile(
            title: const Text("Messages", style: AppTextStyle.kLargeBodyText),
            subtitle: const Text(
              "Get emails for direct messages",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: false,
            onChanged: (val) {},
          ),

          Divider(height: context.h(2), thickness: 1),

          SwitchListTile(
            title: const Text(
              "Promotions & Updates",
              style: AppTextStyle.kLargeBodyText,
            ),
            subtitle: const Text(
              "Receive emails about new features or promotions",
              style: AppTextStyle.kDefaultBodyText,
            ),
            value: true,
            onChanged: (val) {},
          ),
        ],
      ).padLeft(context.w(0.5)),
    );
  }
}
