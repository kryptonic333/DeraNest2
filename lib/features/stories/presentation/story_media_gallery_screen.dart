import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:flutter/material.dart';

class StoryMediaGalleryScreen extends StatelessWidget {
  const StoryMediaGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: AppColors.kBlack),
          ),
          title: Center(
            child: Text(
              'GALLERY',
              style: AppTextStyle.kVeryLargeBodyText.copyWith(
                color: AppColors.kBlack,
              ),
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
                child: Image.asset(
                  'assets/images/post_detail_test.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ))
          
      
    );
  }
}
