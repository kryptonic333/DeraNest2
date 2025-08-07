import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';



class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.height = 50,
    this.width,
    this.fontSize = 16,
    this.buttonColor = AppColors.kPrimary,
    this.textColor = AppColors.kWhite,
    required this.title,
    this.loading = false,
    required this.onPress,
    this.borderSide = BorderSide.none,
    this.fontFamily = AppFonts.kMedium,
    this.borderRadius = 30,
    this.loadingIndicatorColor = AppColors.kWhite,
    this.circularProgressStrokeWidth = 4,
  });
  final bool? loading;
  final String? title;
  final double? height, width, fontSize, borderRadius;
  final Color? textColor, buttonColor, loadingIndicatorColor;
  final void Function()? onPress;
  final BorderSide borderSide;
  final String? fontFamily;
  final double circularProgressStrokeWidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // added shadow color
          shadowColor: AppColors.kBlack,
          // added elevation
          elevation: 5,
          surfaceTintColor: AppColors.kTransparent,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            side: borderSide,
          ),
        ),
        onPressed: onPress,
        child: loading!
            ? CircularProgressIndicator(
                color: loadingIndicatorColor,
                strokeCap: StrokeCap.round,
                strokeWidth: circularProgressStrokeWidth,
              )
            : Text(
                title!,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontFamily: fontFamily,
                ),
              ),
      ),
    );
  }
}
