import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostGalleryScreen extends ConsumerWidget {
  const PostGalleryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  'Cancel',
                  style: AppTextStyle.kDefaultBodyText.copyWith(
                    fontSize: 19,
                    color: AppColors.kAbortColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  height: context.h(4),
                  width: context.w(19),
                  decoration: BoxDecoration(
                    color: AppColors.kSecondarySupport,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: AppTextStyle.kDefaultBodyText.copyWith(
                        color: AppColors.kWhite,
                        fontSize: 19,
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
