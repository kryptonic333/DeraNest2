import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IncomingVoiceCallScreen extends StatelessWidget {
  const IncomingVoiceCallScreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
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
                      'Incoming Video Call',
                      style: AppTextStyle.kMediumBodyText.copyWith(
                        color: AppColors.kBlack,
                      ),
                    ),
                  ),
                  Spacer(),
                  // Row for Action Buttons (Pick Call, Reject Call)
                  Row(
                    children: [
                      Container(
                        height: context.h(10),
                        width: context.w(18),
                        decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.kHintTextColor.withAlpha(100),
                            width: context.w(0.75),
                          ),
                        ),
                        child: Center(
                          child: CustomIconButton(
                            iconSize: context.w(10),
                            iconColor: AppColors.kGreen,
                            onTap: () {
                              context.push(Routes.onVoiceCall);
                            },
                            icon: Icons.phone,
                          ),
                        ),
                      ).padHrz(context.w(10)),
                      SizedBox(width: context.w(35)),
                      Container(
                        height: context.h(10),
                        width: context.w(18),
                        decoration: BoxDecoration(
                          color: AppColors.kRed,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.kWhite.withAlpha(100),
                            width: context.w(0.75),
                          ),
                        ),
                        child: Center(
                          child: CustomIconButton(
                            iconSize: context.w(10),
                            iconColor: AppColors.kWhite,
                            onTap: () {
                              context.pop();
                            },
                            icon: Icons.phone,
                          ),
                        ),
                      ),
                    ],
                  ).padBottom(context.h(10)),
                ],
              ),
            ),
          ),
    );
  }
}
