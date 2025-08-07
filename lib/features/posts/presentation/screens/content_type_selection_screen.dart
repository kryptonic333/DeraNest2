import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class ContentTypeSelectionScreen extends StatelessWidget {
  const ContentTypeSelectionScreen({super.key});

  // Add Post Controller
  @override
  Widget build(BuildContext context) {
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
                  // Discard Button
                  TextButton(
                    onPressed: () {
                      // Get.back();
                    },
                    child: Text('Discard', style: AppTextStyle.kLargeBodyText),
                  ),
                  const Spacer(),
                  // Create Heading
                  Text('CREATE', style: AppTextStyle.kVeryLargeBodyText),
                  const Spacer(),
                  
                  //  Publish Button
                  InkWell(
                    onTap: () {},
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
                    // backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ListTile(
                      trailing: IconButton(
                        icon: const Icon(Icons.check, color: Colors.grey),
                        onPressed: () {
                          // Submit the text to server or perform an action
                        },
                      ),
                      title: TextField(
                        controller: controller.textController.value,
                        decoration: const InputDecoration(
                          hintText: 'What\'s on your mind?',
                          border: InputBorder.none,
                        ),
                      ),
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
                width: controller.isExpanded.value ? 250 : 50,
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
                          controller.isExpanded.value ? Icons.close : Icons.add,
                          size: 25,
                          color: Colors.black,
                        ),
                        onPressed: controller.toggleExpanded,
                      ),
                      if (controller.isExpanded.value) ...[
                        IconButton(
                          icon: const Icon(Icons.photo, size: 20),
                          onPressed: () {
                            // Get.to(() => const PostGalleryScreen());
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
                    image: AssetImage('assets/images/person.jpg'),
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
                          color: !controller.isStoryScreen.value
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
                                color: !controller.isStoryScreen.value
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
                          color: controller.isStoryScreen.value
                              ? AppColors.kAbortColor.withAlpha(100)
                              : AppColors.kTransparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              // Get.to(
                              //   () =>
                              //       StoryScreen(profile: dummyProfileList[0]),
                              // );
                            },
                            child: Text(
                              'STORY',
                              style: AppTextStyle.kMediumBodyText.copyWith(
                                color: controller.isStoryScreen.value
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
