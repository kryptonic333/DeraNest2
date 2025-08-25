import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/data/dummy_lists/people_on_app.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserDiscoveryScreen extends StatelessWidget {
  const UserDiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: AppBar(
          leading: const Icon(Icons.add_box),
          elevation: 10,
          backgroundColor: AppColors.kHintTextColor.withAlpha(50),
          title: Text('People You May Know', style: AppTextStyle.kHeadingText),
        ),
        body: Column(
          children: [
            // List of People on App
            Expanded(
              child: ListView.builder(
                itemCount: dummyPeople.length,
                itemBuilder: (context, index) {
                  return _PersonCard(person: dummyPeople[index]);
                },
              ),
            ),
            // Buttons at the bottom, placed in a Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  width: context.w(25),
                  buttonColor: AppColors.kSecondarySupport,
                  textColor: AppColors.kWhite,
                  title: 'Skip',
                  onPress: () {
                    context.go(Routes.feed);
                  },
                  borderRadius: 10,
                ).padAll(8),
                CustomElevatedButton(
                  width: context.w(25),
                  buttonColor: AppColors.kSecondarySupport,
                  textColor: AppColors.kWhite,
                  title: 'Go',
                  onPress: () {
                    // Check whether the user has followed someone or not
                    // If not, ask him to skip or follow someone to continue
                    context.go(Routes.feed);
                  },
                  borderRadius: 10,
                ).padAll(8),
              ],
            ).padAll(8),
          ],
        ),
      ),
    );
  }
}

class _PersonCard extends StatelessWidget {
  // " people registered on app " Model
  final PeopleOnApp person;

  const _PersonCard({required this.person});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.kBlack,
          radius: context.h(2.5),
          backgroundImage: person.profilePictureUrl != null
              ? NetworkImage(person.profilePictureUrl!)
              : null,
          child: person.profilePictureUrl == null
              ? Text(
                  person.name.isNotEmpty ? person.name[0].toUpperCase() : '?',
                  style: AppTextStyle.kHeadingText.copyWith(
                    color: AppColors.kWhite,
                  ),
                )
              : null,
        ),
        context.w(2).widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(person.name, style: AppTextStyle.kMediumBodyText),
            Text('@${person.username}', style: AppTextStyle.kSmallBodyText),
          ],
        ),
        const Spacer(),
        CustomElevatedButton(
          width: context.w(29),
          buttonColor: AppColors.kPrimary,
          textColor: AppColors.kBlack,
          title: 'Follow',
          onPress: () {
            // Future: Add follow logic here
          },
          borderRadius: context.h(1),
        ),
      ],
    ).padSymmetric(horizontal: context.h(2), vertical: context.h(1));
  }
}
