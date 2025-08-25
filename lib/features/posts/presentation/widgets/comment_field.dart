import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/presentation/widgets/custom_text_field.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class CommentField extends StatelessWidget {
  // Text Editing Controller
  final commentController = TextEditingController();
  CommentField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: context.w(2.5),
          backgroundImage: AssetImage(AppImages.profileImage),
        ).padRight(context.w(0.5)).padLeft(context.w(0.6)),
        SizedBox(
          width: context.w(75),
          height: context.h(5),
          child: CustomTextField(
            borderRadius: context.h(1.2),
            enabledBorderColor: AppColors.kPrimary.withAlpha(50),
            fontColor: AppColors.kBlack,
            maxLength: 100,
            isSuffixIconEnabled: true,
            suffixIcon: null,
            contentPadding: EdgeInsets.all(context.h(1)),
            controller: commentController,
            hintText: 'Add a Comment...',
            labelText: null,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            validator: null,
          ),
        ),
      ],
    );
  }
}
