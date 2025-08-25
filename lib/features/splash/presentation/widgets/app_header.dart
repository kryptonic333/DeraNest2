import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_fonts.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        VectorGraphic(
          loader: AssetBytesLoader(SvgAssets.appLogo),
          colorFilter: ColorFilter.mode(AppColors.kSecondary, BlendMode.srcIn),
          width: context.w(9),
        ),
        context.w(2.75).widthBox,
        Text(
          'DeraNest',
          style: AppTextStyle.kHeadingText.copyWith(
            fontSize: context.h(3.8),
            fontFamily: AppFonts.kBold,
            color: AppColors.kSecondary,
          ),
        ),
      ],
    );
  }
}
