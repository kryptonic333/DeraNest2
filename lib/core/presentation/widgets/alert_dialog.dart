import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_fonts.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_text_button.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

void showAlertDialog({
  required BuildContext context,
  required String title,
  required Widget body,
  required Function()? onSave,
  Function()? onCancel,
  bool? barrierDismissible,
  bool? showSaveButton,
  Color? saveButtonColor,
  String? saveButtonTitle,
  String? cancelButtonTitle,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible ?? false,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: AppColors.kSecondarySupport.withAlpha(
        50,
      ), //Secondary -> Secondary Support.withAlpha
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      surfaceTintColor: AppColors.kTransparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          context.h(2).heightBox,
          if (title.isNotEmpty)
            Text(
              title,
              style: AppTextStyle.kLargeBodyText.copyWith(
                fontFamily: AppFonts.kBold,
                color: AppColors.kWhite, //kPrimary -> kWhite
              ),
            ).padHrz(15),
          ListView(
            shrinkWrap: true,
            children: [
              context.h(2).heightBox,
              // Body Widget
              body.padHrz(15),
              context.h(2).heightBox,
            ],
          ).flexible,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextButton(
                onPressed:
                    onCancel ??
                    () {
                      // 1.pop();
                    },
                text: cancelButtonTitle ?? 'Cancel',
                fontFamily: AppFonts.kMedium,
                color: AppColors.kRed, // kBLack -> kRed Color
              ),
              Visibility(
                visible: showSaveButton ?? true,
                child: CustomTextButton(
                  onPressed: onSave,
                  text: saveButtonTitle ?? 'Save',
                  color: saveButtonColor ?? AppColors.kPrimary,
                  fontFamily: AppFonts.kBold,
                ),
              ),
            ],
          ).padRight(15),
          context.h(1).heightBox,
        ],
      ),
    ).unFocus(context),
  );
}
