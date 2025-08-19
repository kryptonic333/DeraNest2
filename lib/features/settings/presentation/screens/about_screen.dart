import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        foregroundColor: AppColors.kBlack,
        elevation: 1,
        title: const Text("About"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // App Logo
          CircleAvatar(
            radius: 60,
            backgroundColor: AppColors.kWhite,
            child: VectorGraphic(
              loader: AssetBytesLoader(SvgAssets.appLogo),
              colorFilter: ColorFilter.mode(
                AppColors.kSecondary,
                BlendMode.srcIn,
              ),
              width: context.w(18),
            ),
          ),
          const SizedBox(height: 20),

          // App Name
          const Text(
            "DeraNest",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Version
          Text(
            "Version 1.0.0",
            style: TextStyle(color: AppColors.kHintTextColor),
          ),
          const SizedBox(height: 20),

          // Description
          const Text(
            "DeraNest is a modern social media\nplatform where you can "
            "connect with friends, share updates, and discover content "
            "from around the world.",
            textAlign: TextAlign.center,
            style: AppTextStyle.kLargeBodyText,
          ),
          const SizedBox(height: 30),

          // Developer Info Card
          Container(
            decoration: BoxDecoration(
              color: AppColors.kPrimary.withAlpha(100),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: const [
                Text(
                  "Developed by",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text("Mazhar Saleem"),
                Text("Contact: support@deranest.com"),
              ],
            ).padAll(context.w(5)),
          ),
        ],
      ).padAll(context.w(5)),
    );
  }
}
