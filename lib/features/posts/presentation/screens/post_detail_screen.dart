import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/data/dummy_lists/post_detail_list.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/features/posts/data/providers/post_detail_provider.dart';
import 'package:deranest/features/posts/presentation/widgets/build_action_bar.dart';
import 'package:deranest/features/posts/presentation/widgets/build_info_section_section.dart';
import 'package:deranest/features/posts/presentation/widgets/build_post_header.dart';
import 'package:deranest/features/posts/presentation/widgets/comment_field.dart';
import 'package:deranest/features/splash/presentation/widgets/app_header.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailScreen extends ConsumerWidget {
  final int index;

  final PostDetailModel post;
  const PostDetailScreen({super.key, required this.post, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postDetailProvider);

    return CustomSafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppColors.kWhite,
          leading: CustomIconButton(
            onTap: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_rounded,
            iconColor: AppColors.kSecondary,
            iconSize: context.w(7),
            usedInAppBar: true,
            paddingAroundIcon: context.w(2),
          ),

          leadingWidth: context.w(8),
          titleSpacing: 0,
          title: AppHeader(),
        ),

        body: SingleChildScrollView(
          controller: state.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header section with user profile
              BuildPostHeader(index: index),

              // Post image
              dummyPostDetailList[index].feed.imageUrl != null
                  ? Container(
                      color: AppColors.kPostBgColor,
                      height: context.h(38),
                      width: double.infinity,
                      child: Image.asset(
                        dummyPostDetailList[index].feed.imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox.shrink(),
              // Post actions row (like, comment, share, bookmark)
              BuildActionBar(post: post),
              // People who liked row and Post info
              BuildPostInfoSection(post: post),

              // The inline comment field at the very bottom
              CommentField().padOnly(
                left: context.w(2),
                right: context.w(2),
                bottom: context.h(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
