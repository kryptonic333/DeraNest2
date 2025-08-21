import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnVideoCallScreen extends StatelessWidget {
  const OnVideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body: 
        // Caller Video
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            image: DecorationImage(
              image: AssetImage(AppImages.profileImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              // Receiver Video
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: context.h(20),
                  width: context.w(45),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.postDetailImage),
                      fit: BoxFit.cover,
                    ),

                    border: Border.all(
                      color: AppColors.kHintTextColor,
                      width: context.w(1),
                    ),
                    color: AppColors.kHintTextColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ).padOnly(top: context.h(3), right: context.w(3)),
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
                  // Mic Widget
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
              ).padBottom(28),
            ],
          ),
        ),
      ),
    );
  }
}
