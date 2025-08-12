import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
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

  // Add Post Controller
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addPostProvider);
    final controller = ref.read(addPostProvider.notifier);
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        resizeToAvoidBottomInset: false,

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Create Heading
                  Text('CREATE', style: AppTextStyle.kVeryLargeBodyText),
                  const Spacer(),

                  //  Publish Button
                  InkWell(
                    onTap: () {
                      // Perform action to publish post
                    },
                    child: Container(
                      height: 30,
                      width: 100,
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
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // TextField to add thoughts
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(AppImages.postDetailImage),
                  ),
                  const SizedBox(width: 10),
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
              const SizedBox(height: 20),
              // Animated Container - for adding media
              AnimatedContainer(
                curve: Curves.easeInOut,
                margin: const EdgeInsets.only(right: 20),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 40,
                ),
                duration: const Duration(milliseconds: 600),
                width: state.isExpanded ? 250 : 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRect(
                  child: Wrap(
                    children: [
                      // Add Icon
                      IconButton(
                        icon: Icon(
                          state.isExpanded ? Icons.close : Icons.add,
                          size: 25,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          controller.toggleExpanded();
                        },
                      ),
                      if (state.isExpanded) ...[
                        IconButton(
                          icon: const Icon(Icons.photo, size: 20),
                          onPressed: () {
                            context.push(Routes.postGallery);
                          },
                        ),
                        //  Camera Icon
                        IconButton(
                          icon: const Icon(Icons.camera_alt, size: 20),
                          onPressed: () {},
                        ),
                        // Emojis Button
                        IconButton(
                          icon: const Icon(Icons.emoji_emotions, size: 20),
                          onPressed: () {},
                        ),
                        // File uploading Button
                        IconButton(
                          icon: const Icon(Icons.file_upload, size: 20),
                          onPressed: () {},
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              //  Post Image
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: const Image(
                    image: AssetImage(AppImages.profileImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // Content Type Selection (post or story)
              Center(
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    color: AppColors.kHintTextColor.withAlpha(100),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Container on Post Text
                      Container(
                        height: 30,
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
                        height: 30,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: state.isStoryScreen
                              ? AppColors.kAbortColor.withAlpha(100)
                              : AppColors.kTransparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              context.push(Routes.storyCamera);
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
