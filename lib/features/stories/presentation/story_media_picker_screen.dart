import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/presentation/widgets/snackbar.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:deranest/features/stories/data/add_story_provider.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StoryMediaPickerScreen extends ConsumerWidget {
  final Profile profile;
  const StoryMediaPickerScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addStoryProvider);
    final notifier = ref.read(addStoryProvider.notifier);
    final posts = profile.posts ?? [];

    return CustomSafeArea(
      child: Scaffold(
        // Top Bar
        appBar: AppBar(
          backgroundColor: AppColors.kWhite,
          automaticallyImplyLeading: false,
          actions: [
            Text('STORY', style: AppTextStyle.kVeryLargeBodyText),
            SizedBox(width: context.w(15)),
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
            SizedBox(width: context.w(2)),
          ],
        ),
        backgroundColor: AppColors.kTransparent,
        body: Column(
          children: <Widget>[
            SizedBox(height: context.h(2)),

            // Image/Video Boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _mediaOptionBox(
                  context: context,
                  icon: Icons.image_sharp,
                  label: 'Images',
                  onTap: () async {
                    await notifier.pickImageFromGallery();
                    if (state.isImagePicked == true) {
                      ShowSnackbar1.success(context, 'Image Picked!');
                      context.push(Routes.storyCamera);
                    }
                    if (state.isCamera == false) {
                      notifier.toggleCamera();
                    }
                  },
                ),
                SizedBox(width: context.w(5)),
                _mediaOptionBox(
                  context: context,
                  icon: Icons.video_collection,
                  label: 'Videos',
                  onTap: () async {
                    // Navigate to Story Media Gallery Screen

                    await notifier.pickVideoFromGallery();
                    if (state.isVideoPicked == true) {
                      ShowSnackbar1.success(context, 'Video Picked!');
                      context.push(Routes.storyCamera);
                    }
                    if (state.isCamera == false) {
                      notifier.toggleCamera();
                    }
                  },
                ),
              ],
            ).padAll(3),

            SizedBox(height: context.h(2)),

            // Recent Text
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Recent',
                  style: AppTextStyle.kMediumBodyText.copyWith(
                    color: AppColors.kBlack,
                  ),
                ),
              ),
            ),

            // Grid Gallery
            Expanded(
              child: GridView.builder(
                itemCount: posts.length + 1,
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: () async {
                        
                        // Navigate to Story Camera Screen
                        await notifier.pickImageFromCamera();
                        context.push(Routes.storyCamera);
                        if (state.isCamera == false) {
                          notifier.toggleCamera();
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.kHintTextColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: context.h(6),
                              color: AppColors.kWhite,
                            ),
                            SizedBox(height: context.h(2)),
                            Text(
                              'Camera',
                              style: AppTextStyle.kMediumBodyText.copyWith(
                                color: AppColors.kWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  final assetPath = posts[index - 1];

                  return GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      assetPath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.kHintTextColor,
                        child: const Icon(
                          Icons.broken_image,
                          color: AppColors.kWhite,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mediaOptionBox({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.h(15),
        width: context.w(35),
        decoration: BoxDecoration(
          color: AppColors.kHintTextColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: context.w(13), color: AppColors.kWhite),
            context.h(1).heightBox,
            Text(
              label,
              style: AppTextStyle.kMediumBodyText.copyWith(
                color: AppColors.kWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
