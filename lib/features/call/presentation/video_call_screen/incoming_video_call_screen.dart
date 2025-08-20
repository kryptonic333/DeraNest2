import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IncomingVideoCallScreen extends StatelessWidget {
  const IncomingVideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body:
            // Background Image
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.darken,
                image: DecorationImage(
                  image: AssetImage(AppImages.postDetailImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                // Gloss Effect
                decoration: BoxDecoration(
                  color: AppColors.kWhite.withAlpha(200),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Profile Image
                    Center(
                      child: CircleAvatar(
                        radius: context.w(16),
                        backgroundImage: AssetImage(AppImages.profileImage),
                      ),
                    ),
                    // Name
                    Center(
                      child: Text(
                        'Khan',
                        style: AppTextStyle.kVeryLargeBodyText,
                      ),
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
                    SizedBox(height: context.h(27)),
                    // Row for Action Buttons (Message, Alarm)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: context.w(0.5),
                                  color: AppColors.kBlack,
                                ),
                              ),
                              child: CustomIconButton(
                                iconColor: AppColors.kBlack,
                                onTap: () {},
                                icon: Icons.alarm_outlined,
                              ),
                            ).padAll(context.w(1)),
                            Text(
                              'Remind me later',
                              style: AppTextStyle.kDefaultBodyText.copyWith(
                                color: AppColors.kBlack,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: context.w(0.5),
                                  color: AppColors.kBlack,
                                ),
                              ),
                              child: CustomIconButton(
                                iconColor: AppColors.kBlack,
                                onTap: () {
                                  context.pop();
                                },
                                icon: Icons.message_outlined,
                              ),
                            ).padAll(context.w(1)),
                            Text(
                              'Message',
                              style: AppTextStyle.kDefaultBodyText.copyWith(
                                color: AppColors.kBlack,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: context.h(3.5)),
                    // Row for Action Buttons (Pick Call, Reject Call)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: context.h(10),
                          width: context.w(18),
                          decoration: BoxDecoration(
                            color: AppColors.kWhite,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.kHintTextColor.withAlpha(
                                100,
                              ),
                              width: context.w(0.75),
                            ),
                          ),
                          child: Center(
                            child: CustomIconButton(
                              iconSize: context.w(10),
                              iconColor: AppColors.kGreen,
                              onTap: () {
                                context.push(Routes.onVideoCall);
                              },
                              icon: Icons.phone,
                            ),
                          ),
                        ).padHrz(context.w(3)),
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
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
