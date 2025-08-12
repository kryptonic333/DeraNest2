import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class LikedByRow extends StatelessWidget {
  const LikedByRow({super.key,required this.likedBy});
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
              likedBy.length > 3 ? 3 : likedBy.length, // Show max 3 avatars
              (index) => Positioned(
                left: (15.0 * index), // Overlapping effect
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    likedBy[index].profilePictureUrl!,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: context.w(3)),
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
