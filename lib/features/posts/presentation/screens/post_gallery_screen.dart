import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:flutter/material.dart';

class PostGalleryScreen extends StatelessWidget {
  const PostGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  // Get.back();
                },
                child: Text(
                  'Cancel',
                  style: AppTextStyle.kDefaultBodyText.copyWith(
                    color: AppColors.kAbortColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Get.back();
                },
                child: Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    color: AppColors.kSecondarySupport,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: AppTextStyle.kDefaultBodyText.copyWith(
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: AppColors.kWhite,
                child: Image.asset(
                  AppImages.postDetailImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: AppColors.kWhite,
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 3.0,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Image.asset(
                        AppImages.profileImage,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
