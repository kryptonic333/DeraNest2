import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/dummy_lists/profile_list.dart';
import 'package:deranest/features/feed/presentation/widgets/profile_header.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class BuildPostHeader extends StatelessWidget {
  final int index;
  const BuildPostHeader({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h(6.5),
      color: AppColors.kWhite,
      padding: EdgeInsets.only(left: context.w(0.5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile Header
          ProfileHeader(user: dummyProfileList[index], index: index),
          // ... Button
          PopupMenuButton(
            color: AppColors.kWhite,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "Favorites",
                child: Text("Add to Favorites", style: AppTextStyle.kDefaultBodyText),
              ),
              const PopupMenuItem(
                value: "Recommend",
                child: Text("Don't Recommend", style: AppTextStyle.kDefaultBodyText),
              ),
              const PopupMenuItem(
                value: "Hide",
                child: Text("Hide Post", style: AppTextStyle.kDefaultBodyText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
