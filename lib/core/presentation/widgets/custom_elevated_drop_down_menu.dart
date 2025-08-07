import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_fonts.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';



class CustomElevatedDropDownMenuButton extends StatelessWidget {
  const CustomElevatedDropDownMenuButton({
    super.key,
    // Removed required Keyword
    this.label,
    required this.dropdownMenuEntries,
    required this.onSelected,
    this.width,

    this.textController,
    this.borderRadius = 12,
    this.enabledBorderColor = AppColors.kWhite,
    this.textFontSize = 14,
    this.textFontFamily = AppFonts.kRegular,
    this.textFontColor = AppColors.kPrimary,
  });

  // CHANGED: Made label nullable
  final String? label;
  final List<DropdownMenuEntry<dynamic>> dropdownMenuEntries;
  final void Function(dynamic)? onSelected;
  final TextEditingController? textController;
  final double? width;
  // // CHANGED: Added height
  // final double? height;

  final double borderRadius;
  final Color enabledBorderColor;
  final double? textFontSize;
  final String? textFontFamily;
  final Color? textFontColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h(6.70),
      // width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.kHintTextColor.withAlpha(100),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 5), // horizontal, vertical offset
          ),
        ],
      ),
      child: DropdownMenu<dynamic>(
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.kWhite),
          surfaceTintColor: WidgetStateProperty.all(AppColors.kTransparent),
        ),
        controller: textController,
        label:
            // CHANGED: Conditionally render Text widget if label is not null
            label != null
            ? Text(
                label!, // Use ! to assert non-null after the check
                style: AppTextStyle.kDefaultBodyText.copyWith(
                  fontFamily: AppFonts.kMedium,
                  color: AppColors.kPrimary,
                ),
              )
            // If label is null, pass null to DropdownMenu's label
            : null,
        textStyle: TextStyle(
          fontFamily: textFontFamily,
          fontSize: textFontSize,
          color: textFontColor,
        ),
        dropdownMenuEntries: dropdownMenuEntries,
        onSelected: onSelected,
        trailingIcon: const Icon(Icons.keyboard_arrow_down, size: 30),
        selectedTrailingIcon: const Icon(Icons.keyboard_arrow_up, size: 30),
        inputDecorationTheme: InputDecorationTheme(
          constraints: BoxConstraints.tight(
            Size(width ?? context.w(40), context.h(8)),
          ), // CHANGED: Added height and height = 50 --> height = context.h(8)
          isDense: true,
          contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: enabledBorderColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: AppColors.kRed, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: AppColors.kRed, width: 1.5),
          ),
        ),
        expandedInsets: EdgeInsets.zero,
      ),
    );
  }
}
