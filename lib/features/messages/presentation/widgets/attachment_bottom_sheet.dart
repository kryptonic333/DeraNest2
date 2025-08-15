import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/messages/presentation/widgets/attachment_option.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AttachmentBottomSheet extends StatelessWidget {
  const AttachmentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                context.pop();
              },
              child: const Icon(Icons.close_rounded, color: AppColors.kBlack),
            ).padLeft(context.w(2)),
            Expanded(
              child: Text(
                'Share Content',
                textAlign: TextAlign.center,
                style: AppTextStyle.kMediumBodyText.copyWith(fontSize: 18),
              ),
            ),
          ],
        ).padBottom(context.h(1)).padTop(context.h(1)),
        Divider(
          color: AppColors.kHintTextColor,
          thickness: 1,
          height: context.h(1),
        ),
        BuildAttachmentOption(
          onTap: () {},
          icon: Icons.camera_alt_outlined,
          label: 'Camera',
        ),
        BuildAttachmentOption(
          onTap: () {},
          icon: Icons.description_outlined,
          label: 'Documents',
        ),
        BuildAttachmentOption(
         onTap: () {
            context.push(Routes.pollCreate);
          },
          icon: Icons.poll_outlined,
          label: 'Create a Poll',
        ),
        BuildAttachmentOption(
          onTap: () {},
          icon: Icons.perm_media_outlined,
          label: 'Media',
        ),
        BuildAttachmentOption(
          onTap: () {},
          icon: Icons.contacts_outlined,
          label: 'Contacts',
        ),
        BuildAttachmentOption(
          onTap: () {},
          icon: Icons.location_on_outlined,
          label: 'Location',
        ),
      ],
    );
  }
}