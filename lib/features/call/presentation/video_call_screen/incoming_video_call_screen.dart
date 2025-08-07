
import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';


class IncomingVideoCallScreen extends StatelessWidget {
  const IncomingVideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.kHintTextColor,
                  backgroundBlendMode: BlendMode.darken,
                  image: DecorationImage(
                      image: AssetImage(AppImages.postDetailImage),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 200),
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(AppImages.profileImage),
                      ),
                    ),
                    Center(
                        child: Text('Khan',
                            style: AppTextStyle.kVeryLargeBodyText)),
                    Center(
                      child: Text('Incoming Video Call',
                          style: AppTextStyle.kMediumBodyText
                              .copyWith(color: AppColors.kHintTextColor)),
                    ),
                    SizedBox(height: 200),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) => RadialGradient(
                                colors: [
                                  AppColors.kBlack,
                                  AppColors.kHintTextColor
                                ],
                              ).createShader(Rect.fromLTWH(
                                  0, 0, bounds.width, bounds.height)),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.kTransparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.kHintTextColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.alarm_outlined,
                                      color: AppColors.kHintTextColor,
                                    ),
                                  ),
                                ).padAll(5),
                              ),
                            ),
                            Text(
                              'Remind me later',
                              style: AppTextStyle.kDefaultBodyText.copyWith(
                                  color:
                                      AppColors.kBlack), // Color will be masked
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) => RadialGradient(
                                colors: [
                                  AppColors.kBlack,
                                  AppColors.kHintTextColor
                                ],
                              ).createShader(Rect.fromLTWH(
                                  0, 0, bounds.width, bounds.height)),
                              child: InkWell(
                                onTap: () {
                                  //  Navigate to previous Screen
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: AppColors.kTransparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.kHintTextColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.message_outlined,
                                    color: AppColors.kHintTextColor,
                                  ),
                                ).padAll(5),
                              ),
                            ),
                            Text(
                              'Message',
                              style: AppTextStyle.kDefaultBodyText
                                  .copyWith(color: AppColors.kBlack),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigate to On Video Call Screen
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.kWhite,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        AppColors.kHintTextColor.withAlpha(100),
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(Icons.phone,
                                      color: AppColors.kGreen),
                                ),
                              ).padHrz(30),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                // navigate to previous screen
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: AppColors.kRed,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.kRed.withAlpha(100),
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.phone,
                                  color: AppColors.kWhite,
                                ),
                              ).padHrz(3),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ))),
      
    );
  }
}
