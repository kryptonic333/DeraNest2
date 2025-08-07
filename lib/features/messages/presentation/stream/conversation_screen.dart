import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/presentation/widgets/custom_text_field.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Chat Controller Required
class ConversationScreen extends StatelessWidget {
  // Conversation Model
  final Conversation conversation;
  // User Profile Model
  final Profile currentUser;

  const ConversationScreen({
    super.key,
    required this.conversation,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: _ConversationAppBar(
          userName: conversation.participant.name,
          activeTime:
              conversation.participant.lastSeen ??
              conversation.participant.createdAt,
          profileImageUrl:
              conversation.participant.profilePictureUrl ??
              AppImages.profileImage,
        ),
        body: Column(
          children: [
            Expanded(
              child: _MessageList(
                messages: conversation.messages,
                currentUserId: currentUser.id,
                participant: conversation.participant,
              ),
            ),
            _MessageInputBar(controller: controller),
          ],
        ),
      ),
    );
  }
}

// WIDGETS BELOW ARE UPDATED TO USE THE DYNAMIC DATA

class _ConversationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String userName;
  final DateTime activeTime;
  final String profileImageUrl;

  const _ConversationAppBar({
    required this.userName,
    required this.activeTime,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          // Get.back();
        },
        icon: const Icon(Icons.arrow_back, color: AppColors.kBlack),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: context.w(5),
            backgroundImage: AssetImage(profileImageUrl),
            backgroundColor: AppColors.kHintTextColor,
          ),
          SizedBox(width: context.w(1.5)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) =>
                    LinearGradient(
                      colors: [
                        AppColors.kSecondarySupport,
                        AppColors.kAbortColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: Text(
                  userName,
                  style: AppTextStyle.kLargeBodyText.copyWith(
                    color: AppColors.kWhite,
                  ),
                ),
              ),
              Text(
                // timeAgo utility
                'Active ${timeAgo(activeTime)}',
                style: AppTextStyle.kSmallBodyText.copyWith(
                  color: AppColors.kBlack,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            size: context.w(7),
            CupertinoIcons.phone,
            color: AppColors.kHintTextColor,
          ),
          onPressed: () {
            // Get.to(() => const OngoingVoiceCallScreen());
          },
        ),
        IconButton(
          icon: Icon(
            size: context.w(8.75),
            CupertinoIcons.video_camera,
            color: AppColors.kHintTextColor,
          ),
          onPressed: () {
            //  Get.to(() => const VideoCallScreen())
          },
        ).padRight(context.w(2)),
      ],
      backgroundColor: AppColors.kWhite,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MessageList extends StatelessWidget {
  // Message Model
  final List<Message> messages;
  final String currentUserId;
  // User Profile Model
  final Profile participant;

  const _MessageList({
    required this.messages,
    required this.currentUserId,
    required this.participant,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        final isMe = msg.senderId == currentUserId;

        final bool showDateChip = index == messages.length - 1;

        return Column(
          children: [
            _MessageBubble(message: msg, isMe: isMe, participant: participant),
            if (showDateChip) _DateChip(time: msg.sentAt),
          ],
        );
      },
    );
  }
}

class _MessageBubble extends StatelessWidget {
  // Message Model
  final Message message;
  final bool isMe;
  // User Profile Model
  final Profile participant;

  const _MessageBubble({
    required this.message,
    required this.isMe,
    required this.participant,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        child: Column(
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isMe)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 18,

                    backgroundImage: AssetImage(
                      participant.profilePictureUrl ?? AppImages.profileImage,
                    ),
                    backgroundColor: AppColors.kHintTextColor,
                  ),
                ],
              ),
            if (!isMe) const SizedBox(height: 4),
            if (message.message != null)
              _TextMessage(message: message.message!, isMe: isMe),
            const SizedBox(height: 4),
            Text(
              // time utility - Specified for specific functionality
              formatTimeOnly(message.sentAt),
              style: AppTextStyle.kSmallBodyText,
            ),
          ],
        ),
      ),
    );
  }
}

// NO CHANGES NEEDED FOR THE WIDGETS BELOW

class _TextMessage extends StatelessWidget {
  final String message;
  final bool isMe;
  const _TextMessage({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.w(75)),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        gradient: isMe
            ? LinearGradient(
                colors: [AppColors.kSecondarySupport, AppColors.kAbortColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isMe ? null : AppColors.kHintTextColor.withAlpha(20),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isMe ? 12 : 4),
          topRight: Radius.circular(isMe ? 4 : 12),
          bottomLeft: const Radius.circular(12),
          bottomRight: const Radius.circular(12),
        ),
      ),
      child: Text(
        message,
        style: AppTextStyle.kSmallBodyText.copyWith(
          color: isMe ? AppColors.kWhite : AppColors.kBlack,
        ),
      ),
    );
  }
}

class _DateChip extends StatelessWidget {
  final DateTime time;
  const _DateChip({required this.time});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.kHintTextColor),
        ),
        child: Text(
          // time utility - Specified for specific functionality
          messageTime(time),
          style: AppTextStyle.kSmallBodyText.copyWith(color: AppColors.kBlack),
        ),
      ),
    ).padSymmetric(vertical: 8.0);
  }
}

class _MessageInputBar extends StatelessWidget {
  // Chat Controller Required
  final ChatController controller;
  const _MessageInputBar({required this.controller});

  void _showAttachmentSheet(BuildContext context) {
    // Get.bottomSheet(
    //   const _AttachmentBottomSheet(),
    //   backgroundColor: AppColors.kWhite,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
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
              controller: controller.messageController,
              hintText: 'Type Message Here',
              labelText: null,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              validator: null,
            ),
          ),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller.messageController,
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
                    onPressed: () {},
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

class _AttachmentBottomSheet extends StatelessWidget {
  const _AttachmentBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                // Get.back();
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
        _BuildAttachmentOption(
          onTap: () {},
          icon: Icons.camera_alt_outlined,
          label: 'Camera',
        ),
        _BuildAttachmentOption(
          onTap: () {},
          icon: Icons.description_outlined,
          label: 'Documents',
        ),
        _BuildAttachmentOption(
          onTap: () {
            // Get.to(PollCreationScreen());
          },
          icon: Icons.poll_outlined,
          label: 'Create a Poll',
        ),
        _BuildAttachmentOption(
          onTap: () {},
          icon: Icons.perm_media_outlined,
          label: 'Media',
        ),
        _BuildAttachmentOption(
          onTap: () {},
          icon: Icons.contacts_outlined,
          label: 'Contacts',
        ),
        _BuildAttachmentOption(
          onTap: () {},
          icon: Icons.location_on_outlined,
          label: 'Location',
        ),
      ],
    );
  }
}

class _BuildAttachmentOption extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String label;

  const _BuildAttachmentOption({
    required this.onTap,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.kBlack),
      title: Text(label, style: AppTextStyle.kMediumBodyText),
      onTap: onTap,
    );
  }
}
