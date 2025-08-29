import 'dart:io';

import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/presentation/widgets/custom_text_field.dart';
import 'package:deranest/features/stories/data/add_story_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StoryCameraScreen extends ConsumerWidget {
  const StoryCameraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addStoryProvider);
    final notifier = ref.read(addStoryProvider.notifier);

    return CustomSafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: state.pickedImage != null
                ? FileImage(File(state.pickedImage!.path))
                : AssetImage(AppImages.errorImage),
            fit: BoxFit.contain,
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.kTransparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Top Header
              Container(
                height: context.h(9),
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.kTransparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (state.isUploading)
                      Text(
                        'Uploading',
                        style: AppTextStyle.kLargeBodyText.copyWith(
                          color: AppColors.kAbortColor,
                        ),
                      ),

                    if (!state.isUploading)
                      TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text(
                          'Discard',
                          style: AppTextStyle.kLargeBodyText.copyWith(
                            color: AppColors.kAbortColor,
                          ),
                        ),
                      ),
                    Text(
                      'STORY',
                      style: AppTextStyle.kVeryLargeBodyText.copyWith(
                        color: AppColors.kBlack,
                      ),
                    ),
                    if (!state.isUploading)
                      InkWell(
                        onTap: () {
                          if (state.isShotTaken && !state.isCamera) {
                            notifier.publishStory(context);
                            notifier.toggleShotTaken();
                            notifier.toggleCamera();
                            return;
                          }
                          // changes the value
                          if (state.isCamera) {
                            notifier.toggleShotTaken();
                            notifier.toggleCamera();
                          }
                        },
                        child: Container(
                          height: context.h(4.2),
                          width: context.h(12.2),
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
                      ).padAll(context.h(0.75)),
                    if (state.isUploading)
                      Container(
                        height: context.h(4.2),
                        width: context.h(12.2),
                        decoration: BoxDecoration(
                          color: AppColors.kSecondary,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.kWhite,
                          ),
                        ),
                      ).padAll(context.h(0.75)),
                  ],
                ),
              ),

              // Main Body View
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        notifier.showTextFieldToggle();
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          radius: context.h(4),
                          backgroundColor: AppColors.kHintTextColor,
                          child: Icon(
                            Icons.text_fields_sharp,
                            color: AppColors.kWhite,
                            size: context.h(3.5),
                          ),
                        ).padAll(context.h(.5)),
                      ),
                    ),
                    context.h(2).heightBox,
                    GestureDetector(
                      onTap: () {
                        notifier.showColorsToggle();
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          radius: context.h(4),
                          backgroundColor: AppColors.kHintTextColor,
                          child: Icon(
                            Icons.edit,
                            color: AppColors.kWhite,
                            size: context.h(3.5),
                          ),
                        ).padAll(5),
                      ),
                    ),
                  ],
                ),
              ),
              if (state.showTextField && !state.isCamera)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomTextField(
                    fontColor: AppColors.kBlack,
                    isSuffixIconEnabled: true,
                    suffixIcon: Icons.send_outlined,
                    contentPadding: EdgeInsets.all(10),
                    controller: state.storyTextController,
                    hintText: 'Add Your Thoughts here....',
                    labelText: null,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
                    validator: null,
                  ),
                ).padAll(10),

              // building ui for colors list
              if (state.showColors && !state.isCamera)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: context.h(10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: List.generate(10, (index) {
                        if (index == 0) {
                          return GestureDetector(
                            onTap: () {
                              notifier.showColorsToggle();
                            },
                            child: CircleAvatar(
                              radius: context.h(1.9),
                              backgroundColor: AppColors.kRed,
                              child: Icon(
                                Icons.cancel,
                                color: AppColors.kWhite,
                                size: context.h(3.7),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: context.h(1),
                            ),
                            width: context.h(5),
                            height: context.h(5),
                            decoration: BoxDecoration(
                              color: AppColors.kHintTextColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.kWhite,
                                width: context.h(.2),
                              ),
                            ),
                          );
                        }
                      }),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
