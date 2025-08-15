import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
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
        body: Container(
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
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.postDetailImage),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.kBlack.withAlpha(100),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    border: Border.all(color: AppColors.kWhite, width: 2),
                    color: AppColors.kHintTextColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ).padOnly(top: 40, right: 20),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.kHintTextColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.volume_up, color: AppColors.kWhite),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.kHintTextColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.mic_outlined, color: AppColors.kWhite),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.kHintTextColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.video_call_outlined,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.kHintTextColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.message_outlined,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigate to Previous Screen\
                      context.pop();
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.kRed,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, color: AppColors.kWhite),
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
