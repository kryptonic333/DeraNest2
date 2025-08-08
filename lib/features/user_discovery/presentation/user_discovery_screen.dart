import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class UserDiscoveryScreen extends StatelessWidget {
  // Person
  final PeopleOnApp person = PeopleOnApp(
    email: '',
    id: '1',
    name: 'name',
    username: 'username',
    createdAt: DateTime(2025),
  );
  UserDiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: AppBar(
          leading: const Icon(Icons.add_box),
          elevation: 10,
          backgroundColor: AppColors.kPrimary.withAlpha(100),
          title: Text('People You May Know', style: AppTextStyle.kHeadingText),
        ),
        body: Column(
          children: [
            // List of People on App
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _PersonCard(person: person);
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
                  onPress: () {},
                  borderRadius: 10,
                ).padAll(8),
                CustomElevatedButton(
                  width: context.w(25),
                  buttonColor: AppColors.kSecondarySupport,
                  textColor: AppColors.kWhite,
                  title: 'Go',
                  onPress: () {},
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
          radius: 30,
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
        const SizedBox(width: 12),
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
          textColor: AppColors.kWhite,
          title: 'Follow',
          onPress: () {
            // Future: Add follow logic here
          },
          borderRadius: 8,
        ),
      ],
    ).padSymmetric(horizontal: 16, vertical: 8);
  }
}
