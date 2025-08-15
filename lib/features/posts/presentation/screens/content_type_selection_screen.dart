import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/dummy_lists/profile_list.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_text_field.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/posts/data/providers/add_post_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ContentTypeSelectionScreen extends ConsumerWidget {
  const ContentTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addPostProvider);
    final controller = ref.read(addPostProvider.notifier);
    return CustomSafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: // Create Heading
          Text(
            'CREATE',
            style: AppTextStyle.kVeryLargeBodyText,
          ),
          backgroundColor: AppColors.kWhite,
          actions: [
            //  Publish Button
            GestureDetector(
              onTap: () {
                // Perform action to publish post
              },
              child: Container(
                height: context.h(4),
                width: context.w(28),
                decoration: BoxDecoration(
                  color: AppColors.kSecondary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Publish',
                    style: AppTextStyle.kMediumBodyText.copyWith(
                      color: AppColors.kWhite,
                    ),
                  ),
                ),
              ),
            ).padRight(context.w(1)),
          ],
        ),
        backgroundColor: AppColors.kTransparent,
        resizeToAvoidBottomInset: false,

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // TextField to add thoughts
              Row(
                children: [
                  CircleAvatar(
                    radius: context.w(5),
                    backgroundImage: AssetImage(AppImages.postDetailImage),
                  ),
                  SizedBox(width: context.w(3)),
                  Expanded(
                    child: CustomElevatedTextField(
                      controller: state.textController,
                      hintText: 'What\'s on your mind?',
                      contentPadding: EdgeInsets.fromLTRB(18, 15, 18, 15),
                      labelText: null,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      validator: null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.h(2)),
              // Animated Container - for adding media
              AnimatedContainer(
                curve: Curves.decelerate,
                margin: const EdgeInsets.only(right: 20),
                constraints: BoxConstraints(maxWidth: context.screenWidth - 40),
                duration: const Duration(milliseconds: 00),
                width: state.isExpanded ? context.w(65) : context.w(13),
                height: context.h(5.75),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.kBlack),
                  shape: BoxShape.circle,
                  color: AppColors.kWhite,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRect(
                  child: Wrap(
                    children: [
                      // Add Icon
                      IconButton(
                        icon: Icon(
                          state.isExpanded ? Icons.close : Icons.add,
                          size: context.w(6.75),
                          color: Colors.black,
                        ),
                        onPressed: () {
                          controller.toggleExpanded();
                        },
                      ),
                      if (state.isExpanded) ...[
                        IconButton(
                          icon: Icon(Icons.photo, size: context.w(6.75)),
                          onPressed: () {
                            context.push(Routes.postGallery);
                          },
                        ),
                        //  Camera Icon
                        IconButton(
                          icon: Icon(Icons.camera_alt, size: context.w(6.75)),
                          onPressed: () {},
                        ),
                        // Emojis Button
                        IconButton(
                          icon: Icon(
                            Icons.emoji_emotions,
                            size: context.w(6.75),
                          ),
                          onPressed: () {},
                        ),
                        // File uploading Button
                        IconButton(
                          icon: Icon(Icons.file_upload, size: context.w(6.75)),
                          onPressed: () {},
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.h(1)),
              //  Post Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: const Image(
                  image: AssetImage(AppImages.profileImage),
                  fit: BoxFit.fill,
                ),
              ).padAll(5),

              // Content Type Selection (post or story)
              Center(
                child: Container(
                  height: context.h(5),
                  width: context.w(55),
                  decoration: BoxDecoration(
                    color: AppColors.kHintTextColor.withAlpha(50),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Container on Post Text
                      Container(
                        height: context.h(3.75),
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: !state.isStoryScreen
                              ? AppColors.kAbortColor.withAlpha(100)
                              : AppColors.kTransparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'POST',
                              style: AppTextStyle.kMediumBodyText.copyWith(
                                color: !state.isStoryScreen
                                    ? AppColors.kWhite
                                    : AppColors.kBlack,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Container on STORY Text
                      Container(
                        height: context.h(3.75),
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: state.isStoryScreen
                              ? AppColors.kAbortColor.withAlpha(100)
                              : AppColors.kTransparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              context.push(
                                Routes.storyMediaPicker,
                                extra: dummyProfileList[0],
                              );
                            },
                            child: Text(
                              'STORY',
                              style: AppTextStyle.kMediumBodyText.copyWith(
                                color: state.isStoryScreen
                                    ? AppColors.kWhite
                                    : AppColors.kBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).padAll(10),
        ),
      ),
    );
  }
}
