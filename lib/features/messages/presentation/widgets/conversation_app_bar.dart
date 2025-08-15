import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConversationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String userName;
  final DateTime activeTime;
  final String profileImageUrl;

  const ConversationAppBar({
    super.key,
    required this.userName,
    required this.activeTime,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.pop();
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
                // 'Active ${timeAgo(activeTime)}'
                'Active 1 min ago',
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
            context.push(Routes.incomingVoiceCall);
          },
        ),
        IconButton(
          icon: Icon(
            size: context.w(8.75),
            CupertinoIcons.video_camera,
            color: AppColors.kHintTextColor,
          ),
          onPressed: () {
            context.push(Routes.incomingVideoCall);
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
