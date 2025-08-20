import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/presentation/widgets/custom_text_field.dart';
import 'package:deranest/features/messages/data/stream_provider/stream_provider.dart';
import 'package:deranest/features/messages/presentation/widgets/attachment_bottom_sheet.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageInputBar extends ConsumerWidget {
  const MessageInputBar({super.key});

  void _showAttachmentSheet(BuildContext context) {
    showBottomSheet(context: context, builder: (b) => AttachmentBottomSheet());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatCtrl = ref.read(chatProvider.notifier);
    final messageState = ref.watch(chatProvider);
    return Container(
      color: AppColors.kWhite,
      child: Row(
        children: [
          IconButton(
            icon: Icon(CupertinoIcons.paperclip, color: AppColors.kBlack),
            onPressed: () => _showAttachmentSheet(context),
          ),
          Expanded(
            child: CustomTextField(
              fontColor: AppColors.kBlack,
              fillColor: AppColors.kHintTextColor.withAlpha(20),
              filled: true,
              enabledBorderColor: AppColors.kWhite,
              contentPadding: EdgeInsets.all(context.h(1)),
              borderRadius: 10,
              controller: messageState.messageController,
              hintText: 'Type Message Here',
              labelText: null,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              validator: null,
            ),
          ),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: messageState.messageController,
            builder: (context, value, child) {
              if (value.text.isNotEmpty) {
                return IconButton(
                  icon: const Icon(Icons.send_rounded, color: AppColors.kBlack),
                  onPressed: () {},
                );
              }
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      size: context.w(7.5),
                      CupertinoIcons.photo_camera,
                      color: AppColors.kBlack,
                    ),
                    onPressed: () {
                      chatCtrl.pickImageFromCamera();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      size: context.w(7.5),
                      CupertinoIcons.mic,
                      color: AppColors.kBlack,
                    ),
                    onPressed: () {},
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ).padBottom(context.h(1.75));
  }
}
