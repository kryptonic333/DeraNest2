import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StoryMediaGalleryScreen extends ConsumerWidget {
  const StoryMediaGalleryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.kWhite,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios, color: AppColors.kAbortColor),
          ),
          title: Text(
            'GALLERY',
            style: AppTextStyle.kVeryLargeBodyText.copyWith(
              color: AppColors.kBlack,
            ),
          ),
        ),
        body: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            childAspectRatio: 0.65,
            mainAxisSpacing: 4.0,
          ),
          itemBuilder: (context, i) => GestureDetector(
            onTap: () {
              // Logic for applying image to story screen
            },
            child: Image.asset(AppImages.profileImage, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
