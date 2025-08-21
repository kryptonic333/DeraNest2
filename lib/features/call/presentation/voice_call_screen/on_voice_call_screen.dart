import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnVoiceCallScreen extends StatelessWidget {
  const OnVoiceCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The main build method is clean, delegating UI to smaller widgets.
    return Scaffold(
      backgroundColor: AppColors.kTransparent,
      body:
          //  Background Image
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.profileImage),
              ),
            ),
            child: Container(
              // Gloss Effect
              decoration: BoxDecoration(color: AppColors.kWhite.withAlpha(200)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: context.h(10)),
                  // Profile Image
                  Center(
                    child: CircleAvatar(
                      radius: context.w(16),
                      backgroundImage: AssetImage(AppImages.profileImage),
                    ),
                  ),
                  // Name
                  Center(
                    child: Text('Khan', style: AppTextStyle.kVeryLargeBodyText),
                  ),
                  // Call type
                  Center(
                    child: Text(
                      '12:13 Am',
                      style: AppTextStyle.kMediumBodyText.copyWith(
                        color: AppColors.kBlack,
                      ),
                    ),
                  ),

                  Spacer(),
                  // Action Buttons (Voice_Up, reject, etc)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Volume Widget
                      Container(
                        height: context.h(12),
                        width: context.w(15),
                        decoration: BoxDecoration(
                          color: AppColors.kHintTextColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CustomIconButton(
                            iconSize: context.w(8),
                            iconColor: AppColors.kWhite,
                            onTap: () {},
                            icon: Icons.volume_up,
                          ),
                        ),
                      ),
                      
                      //  Mic Widget
                      Container(
                        height: context.h(12),
                        width: context.w(15),
                        decoration: BoxDecoration(
                          color: AppColors.kHintTextColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CustomIconButton(
                            iconSize: context.w(8),
                            iconColor: AppColors.kWhite,
                            onTap: () {},
                            icon: Icons.mic_outlined,
                          ),
                        ),
                      ),
                      
                      // Video Cam Widget
                      Container(
                        height: context.h(12),
                        width: context.w(15),
                        decoration: BoxDecoration(
                          color: AppColors.kHintTextColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CustomIconButton(
                            iconSize: context.w(8),
                            iconColor: AppColors.kWhite,
                            onTap: () {},
                            icon: Icons.videocam,
                          ),
                        ),
                      ),

                      // Message Widget
                      Container(
                        height: context.h(12),
                        width: context.w(15),
                        decoration: BoxDecoration(
                          color: AppColors.kHintTextColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CustomIconButton(
                            iconSize: context.w(8),
                            iconColor: AppColors.kWhite,
                            onTap: () {},
                            icon: Icons.message_outlined,
                          ),
                        ),
                      ),
                      
                      // End Call Widget
                      Container(
                        height: context.h(12),
                        width: context.w(15),
                        decoration: BoxDecoration(
                          color: AppColors.kRed,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CustomIconButton(
                            iconSize: context.w(8),
                            iconColor: AppColors.kWhite,
                            onTap: () {
                              context.pop();
                            },
                            icon: Icons.close,
                          ),
                        ),
                      ),
                    ],
                  ).padBottom(context.h(4)),
                ],
              ),
            ),
          ),
    );
  }
}
