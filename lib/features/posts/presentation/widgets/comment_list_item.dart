import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/alert_dialog.dart' ;
import 'package:deranest/core/presentation/widgets/custom_elevated_text_field.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_text_button.dart';
import 'package:deranest/features/posts/data/model/comment_model.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommentListItem extends StatelessWidget 
{
  const CommentListItem({super.key,required this.comment});
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: AssetImage(comment.user.person.profilePictureUrl!),
          ),
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: " ${comment.user.person.name}",
                  style: AppTextStyle.kMediumBodyText,
                ),
                TextSpan(
                  // timeAgo is a utility
                  text: " • 12:23 Am",
                  style: AppTextStyle.kSmallBodyText,
                ),
              ],
            ),
          ),
          subtitle: Text(
            " ${comment.commentText}",
            style: AppTextStyle.kMediumBodyText,
          ),
          trailing: CustomIconButton(
            onTap: () {},
            icon: Icons.favorite_outline_outlined,
            iconColor: AppColors.kHintTextColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: context.w(12)),
          child: CustomTextButton(
            fontSize: context.h(1.2),
            color: AppColors.kHintTextColor,
            fontWeight: FontWeight.normal,
            text: 'Reply',
            onPressed: () {
              showAlertDialog(
                barrierDismissible: false,
                saveButtonTitle: 'Reply',
                saveButtonColor: AppColors.kWhite,
                context: context,
                title: 'Reply',
                body: CustomElevatedTextField(
                  fontColor: AppColors.kBlack,
                  controller: null,
                  hintText: 'Reply',
                  labelText: null,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  validator: null,
                ),
                onCancel: () {
                  context.pop();
                },
                onSave: () {},
              );
            },
          ),
        ),
      ],
    ).padSymmetric(horizontal: context.w(1.2), vertical: context.h(1));
  }
}
