import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/messages/data/stream_provider/stream_provider.dart';
import 'package:deranest/features/messages/presentation/widgets/attachment_option.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AttachmentBottomSheet extends ConsumerWidget {
  const AttachmentBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatCtrl = ref.read(chatProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            // Popping Icon
            InkWell(
              onTap: () {
                context.pop();
              },
              child: const Icon(Icons.close_rounded, color: AppColors.kBlack),
            ).padLeft(context.w(2)),
            // Share Content Heading
            Expanded(
              child: Text(
                'Share Content',
                textAlign: TextAlign.center,
                style: AppTextStyle.kLargeBodyText,
              ),
            ),
          ],
        ).padBottom(context.h(1)).padTop(context.h(1)),
        Divider(
          color: AppColors.kHintTextColor,
          thickness: context.h(.1),
          height: context.h(1),
        ),
        // Camera Option
        BuildAttachmentOption(
          onTap: () {
            chatCtrl.pickImageFromCamera();
            context.pop();
          },
          icon: Icons.camera_alt_outlined,
          label: 'Camera',
        ),
        // Document Option
        BuildAttachmentOption(
          onTap: () {},
          icon: Icons.description_outlined,
          label: 'Documents',
        ),
        // Poll Option
        BuildAttachmentOption(
          onTap: () {
            context.push(Routes.pollCreate);
          },
          icon: Icons.poll_outlined,
          label: 'Create a Poll',
        ),
        // Media Option
        BuildAttachmentOption(
          onTap: () {
            chatCtrl.pickImageFromGallery();
            context.pop();
          },
          icon: Icons.perm_media_outlined,
          label: 'Media',
        ),
        // Contacts Option
        BuildAttachmentOption(
          onTap: () {},
          icon: Icons.contacts_outlined,
          label: 'Contacts',
        ),
        // Location Option
        BuildAttachmentOption(
          onTap: () {},
          icon: Icons.location_on_outlined,
          label: 'Location',
        ),
      ],
    );
  }
}
