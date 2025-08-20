import 'dart:io';

import 'package:deranest/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:extensions_kit/extensions_kit.dart';

class ImageMessage extends StatelessWidget {
  final String imageUrl;
  final bool isMe;
  const ImageMessage({super.key, required this.imageUrl, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.w(75), maxHeight: context.h(40)),
      padding: const EdgeInsets.all(6),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.file(File(imageUrl), fit: BoxFit.cover)
      ),
    );
  }
}
