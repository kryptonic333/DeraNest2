import 'package:deranest/core/constants/app_assets.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_text_field.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        backgroundColor: AppColors.kWhite,
        foregroundColor: AppColors.kBlack,
        elevation: 1,
        title: const Text("Edit Profile"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: context.w(20),
                  backgroundImage: AssetImage(AppImages.profileImage),
                ),
                context.h(1).heightBox,
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Change Profile Picture",
                    style: TextStyle(color: AppColors.kAbortColor),
                  ),
                ),
              ],
            ),
          ),
          context.h(2.8).heightBox,

          // Name
          CustomElevatedTextField(
            controller: null,
            hintText: 'Name',
            labelText: null,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: null,
          ),
          const SizedBox(height: 16),
          // UserName
          CustomElevatedTextField(
            controller: null,
            hintText: 'Username',
            labelText: null,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: null,
          ),
          context.h(2).heightBox,
          // Bio
          CustomElevatedTextField(
            controller: null,
            hintText: 'Bio',
            labelText: null,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.next,
            validator: null,
          ),
          context.h(2).heightBox,
          // Email
          CustomElevatedTextField(
            controller: null,
            hintText: 'Email',
            labelText: null,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: null,
          ),
          context.h(2).heightBox,
          // Phone
          CustomElevatedTextField(
            controller: null,
            hintText: 'Phone',
            labelText: null,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            validator: null,
          ),
          context.h(3.9).heightBox,

          // Save Button
          CustomElevatedButton(
            borderRadius: 10,
            buttonColor: AppColors.kSecondarySupport,
            width: context.w(92),
            height: context.h(7),
            title: 'Save Changes',
            onPress: () {},
          ),
        ],
      ).padAll(context.w(3)),
    );
  }
}
