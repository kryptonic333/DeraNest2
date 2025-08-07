import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/presentation/widgets/custom_text_field.dart';
import 'package:deranest/features/stories/presentation/widgets/corner_frame_painter.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class StoryCameraScreen extends StatelessWidget {
  const StoryCameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.postDetailImage),
            fit: BoxFit.cover,
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
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Discard',
                        style: AppTextStyle.kLargeBodyText.copyWith(
                          color: AppColors.kBlack,
                        ),
                      ),
                    ),
                    Text(
                      'STORY',
                      style: AppTextStyle.kVeryLargeBodyText.copyWith(
                        color: AppColors.kBlack,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (controller.isShotTaken.value &&
                            !controller.isCamera.value) {
                          controller.publishStory();
                          controller.toggleShotTaken();
                          // controller.toggleCamera();
                          return;
                        }
                        // changes the value
                        if (controller.isCamera.value) {
                          controller.toggleShotTaken();
                          controller.toggleCamera();
                        }
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
                            controller.isCamera.value ? 'Shot' : 'Publish',
                            style: AppTextStyle.kMediumBodyText.copyWith(
                              color: AppColors.kWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Main Body View
              controller.isCamera.value
                  ? SizedBox(
                      height: context.h(80),
                      width: context.w(80),
                      child: CustomPaint(painter: CornerFramePainter()),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.showTextFieldToggle();
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
                              ).padAll(5),
                            ),
                          ),
                          SizedBox(height: context.h(2)),
                          GestureDetector(
                            onTap: () {
                              controller.showColorsToggle();
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
              if (controller.showTextField.value && !controller.isCamera.value)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomTextField(
                    fontColor: AppColors.kBlack,
                    isSuffixIconEnabled: true,
                    suffixIcon: Icons.send_outlined,
                    contentPadding: EdgeInsets.all(10),
                    controller: controller.storyTextController,
                    hintText: 'Add Your Thoughts here....',
                    labelText: null,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.done,
                    validator: null,
                  ),
                ).padAll(10),

              // building ui for colors list
              if (controller.showColors.value && !controller.isCamera.value)
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
                            onTap: () => controller.showColorsToggle(),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColors.kRed,
                              child: Icon(
                                Icons.cancel,
                                color: AppColors.kWhite,
                                size: 30,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.kHintTextColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
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
