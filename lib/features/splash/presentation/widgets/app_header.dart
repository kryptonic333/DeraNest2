import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        VectorGraphic(
          loader: AssetBytesLoader(SvgAssets.appLogo),
          colorFilter: ColorFilter.mode(AppColors.kSecondary, BlendMode.srcIn),
          width: context.w(9),
        ),
        SizedBox(width: context.w(2.75)),
        Text('DeraNest', style: AppTextStyle.kHeadingText),
      ],
    );
  }
}
