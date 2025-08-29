import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/features/profile/data/model/profile_model.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class LikedByRow extends StatelessWidget {
  const LikedByRow({super.key, required this.likedBy});
  // User Profile Model
  final List<Profile> likedBy;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: context.h(5),
          width: context.w(40),
          child: Stack(
            children: List.generate(
              likedBy.length > 3 ? 3 : likedBy.length,
              (index) => Positioned(
                left: (context.h(1.9) * index),
                child: CircleAvatar(
                  radius: context.h(2.5),
                  backgroundImage: AssetImage(
                    likedBy[index].profilePictureUrl!,
                  ),
                ),
              ),
            ),
          ),
        ),
        context.w(3).widthBox,
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Liked by ',
                  style: AppTextStyle.kMediumBodyText.copyWith(
                    color: AppColors.kHintTextColor,
                  ),
                ),
                TextSpan(
                  text: '${likedBy[0].name} and others',
                  style: AppTextStyle.kMediumBodyText.copyWith(
                    color: AppColors.kHintTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
