


import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class BuildAttachmentOption extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String label;

  const BuildAttachmentOption({
    super.key,
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
