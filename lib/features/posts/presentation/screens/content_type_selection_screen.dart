import 'dart:io';

import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/dummy_lists/profile_list.dart';
import 'package:deranest/core/presentation/widgets/alert_dialog.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_text_field.dart';
import 'package:deranest/core/presentation/widgets/custom_icon_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/posts/data/providers/add_post_provider.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ContentTypeSelectionScreen extends ConsumerWidget {
  const ContentTypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addPostProvider);
    final postCtrl = ref.read(addPostProvider.notifier);
    return CustomSafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              // Create Heading
              Text('CREATE', style: AppTextStyle.kVeryLargeBodyText),
          backgroundColor: AppColors.kWhite,
          actions: [
            //  Publish Button
            GestureDetector(
              onTap: () {
                // Perform action to publish post
                if (state.isImagePicked == true) {
                  postCtrl.toggleImagePicked();
                }
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
                  context.w(3).widthBox,
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
              context.h(2).heightBox,
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
                  shape: BoxShape.circle,
                  color: AppColors.kWhite,
                ),
                child: ClipRect(
                  child: Wrap(
                    children: [
                      // Add Icon
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.kBlack),
                        ),
                        child: CustomIconButton(
                          iconSize: context.w(6.75),
                          icon: state.isExpanded ? Icons.close : Icons.add,
                          iconColor: AppColors.kBlack,
                          onTap: () {
                            postCtrl.toggleExpanded();
                          },
                        ),
                      ),
                      if (state.isExpanded) ...[
                        // Gallery Icon
                        IconButton(
                          icon: Icon(Icons.photo, size: context.w(6.75)),
                          onPressed: () {
                            showAlertDialog(
                              barrierDismissible: true,
                              context: context,
                              title: 'File Access Permission Required!',
                              body: Text(
                                "This app needs access to your gallery. \n Do you want to allow it?",
                                style: AppTextStyle.kMediumBodyText.copyWith(
                                  color: AppColors.kHintTextColor,
                                ),
                              ),
                              saveButtonTitle: 'Allow',

                              saveButtonColor: AppColors.kSecondarySupport,
                              onSave: () {
                                context.pop(true);
                                postCtrl.pickImageFromGallery();
                                if (state.isImagePicked == false) {
                                  postCtrl.toggleImagePicked();
                                }
                              },
                              onCancel: () {
                                context.pop(false);
                              },
                            );
                          },
                        ),
                        //  Camera Icon
                        IconButton(
                          icon: Icon(Icons.camera_alt, size: context.w(6.75)),
                          onPressed: () {
                            showAlertDialog(
                              barrierDismissible: true,
                              context: context,
                              title: 'Camera Permission Required!',
                              body: Text(
                                "This app needs access to your camera. Do you want to allow it?",
                                style: AppTextStyle.kMediumBodyText.copyWith(
                                  color: AppColors.kHintTextColor,
                                ),
                              ),
                              saveButtonTitle: 'Allow',
                              saveButtonColor: AppColors.kSecondarySupport,
                              onSave: () {
                                context.pop(true);
                                postCtrl.pickImageFromCamera();
                                if (state.isImagePicked == false) {
                                  postCtrl.toggleImagePicked();
                                }
                              },
                              onCancel: () {
                                context.pop(false);
                              },
                            );
                          },
                        ),
                        // Emojis Button
                        IconButton(
                          icon: Icon(
                            Icons.emoji_emotions,
                            size: context.w(6.75),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: SizedBox(
                                    height: 300,
                                    child: EmojiPicker(
                                      onEmojiSelected: (category, emoji) {
                                        Navigator.pop(context);
                                      },
                                      config: Config(
                                        height: context.h(80),
                                        checkPlatformCompatibility: true,
                                        viewOrderConfig: ViewOrderConfig(),
                                        emojiViewConfig: EmojiViewConfig(
                                          emojiSizeMax:
                                              context.w(5) *
                                              (foundation.defaultTargetPlatform ==
                                                      TargetPlatform.android
                                                  ? 1.2
                                                  : 1.0),
                                        ),
                                        skinToneConfig: const SkinToneConfig(),
                                        categoryViewConfig:
                                            const CategoryViewConfig(),
                                        bottomActionBarConfig:
                                            const BottomActionBarConfig(
                                              enabled: false,
                                            ),
                                        searchViewConfig:
                                            const SearchViewConfig(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        // File uploading Button
                        IconButton(
                          icon: Icon(Icons.file_upload, size: context.w(6.75)),
                          onPressed: () {
                            showAlertDialog(
                              barrierDismissible: true,
                              context: context,
                              title: 'File Access Permission Required!',
                              body: Text(
                                "This app needs access to your files. \n Do you want to allow it?",
                                style: AppTextStyle.kMediumBodyText.copyWith(
                                  color: AppColors.kHintTextColor,
                                ),
                              ),
                              saveButtonTitle: 'Allow',

                              saveButtonColor: AppColors.kSecondarySupport,
                              onSave: () {
                                context.pop(true);
                              },
                              onCancel: () {
                                context.pop(false);
                              },
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              context.h(1).heightBox,
              //  Post Image
              if (!state.isImagePicked)
                SizedBox(
                  height: context.h(60),
                  width: context.w(95),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        size: context.w(20),
                        Icons.perm_media_rounded,
                        color: AppColors.kHintTextColor,
                      ),
                      Text(
                        'Select Image to Upload ',
                        style: AppTextStyle.kLargeBodyText.copyWith(
                          color: AppColors.kHintTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              if (state.isImagePicked)
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image(
                    fit: BoxFit.contain,
                    image: state.pickedImage != null
                        ? FileImage(File(state.pickedImage!.path))
                        : const AssetImage(AppImages.errorImage),
                  ),
                ),

              // Content Type Selection Container (post or story)
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
              ).padTop(context.h(1)),
            ],
          ).padAll(context.w(1.1)),
        ),
      ),
    );
  }
}
