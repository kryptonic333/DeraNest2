
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/features/feed/presentation/widgets/profile_header.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class BuildPostHeader extends StatelessWidget {
  final int index;
  final Profile user = Profile(
    id: 'id',
    name: 'name',
    username: 'username',
    createdAt: DateTime(2025),
  );

  BuildPostHeader({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h(6.5),
      color: AppColors.kWhite,
      padding: const EdgeInsets.only(left: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProfileHeader(user: user, index: index),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded, color: AppColors.kBlack),
          ),
        ],
      ),
    );
  }
}