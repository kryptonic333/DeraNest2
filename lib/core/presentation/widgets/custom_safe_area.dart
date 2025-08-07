import 'package:deranest/core/constants/app_colors.dart';
import 'package:flutter/material.dart';



class CustomSafeArea extends StatelessWidget {
  const CustomSafeArea({
    super.key,
    required this.child,
    // Changed the color here from -> AppColors.kPrimary
 this.color = AppColors.kWhite,
  });
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        bottom: false,
        child: child,
      ),
    );
  }
}
