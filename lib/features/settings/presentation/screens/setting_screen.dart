import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_elevated_button.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomSafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kTransparent,
        appBar: AppBar(
          centerTitle: true,
          title: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [AppColors.kSecondarySupport, AppColors.kAbortColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: Text(
              'Settings',
              style: AppTextStyle.kLargeBodyText.copyWith(
                color: AppColors.kWhite,
              ),
            ),
          ),
          backgroundColor: AppColors.kWhite,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.kBlack, size: context.w(6)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Text(
              'Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.kSecondary,
              ),
            ).padLeft(context.w(6.5)),
            const SizedBox(height: 10),
            _buildSettingsCard([
              _buildSettingsListItem(
                context,
                icon: Icons.person_outline,
                title: 'Edit Profile',
                onTap: () {
                  context.push(Routes.editProfile);
                },
              ),

              _buildSettingsListItem(
                context,
                icon: Icons.security_outlined,
                title: 'Privacy and Security',
                onTap: () {
                  context.push(Routes.privacySecurity);
                },
              ),
            ]),
            const SizedBox(height: 20),
            Text(
              'Notifications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.kSecondary,
              ),
            ).padLeft(context.w(6.5)),
            const SizedBox(height: 10),
            _buildSettingsCard([
              _buildSettingsListItem(
                context,
                icon: Icons.notifications_outlined,
                title: 'Push Notifications',
                onTap: () {
                  context.push(Routes.pushNotification);
                },
              ),
              _buildSettingsListItem(
                context,
                icon: Icons.email_outlined,
                title: 'Email Notifications',
                onTap: () {
                  context.push(Routes.emailNotification);
                },
              ),
            ]),
            const SizedBox(height: 20),
            Text(
              'More',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.kSecondary,
              ),
            ).padLeft(context.w(6.5)),
            const SizedBox(height: 10),
            _buildSettingsCard([
              _buildSettingsListItem(
                context,
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {
                  context.push(Routes.helpSupport);
                },
              ),
              _buildSettingsListItem(
                context,
                icon: Icons.info_outline,
                title: 'About',
                onTap: () {
                  context.push(Routes.about);
                },
              ),
            ]),
            const SizedBox(height: 20),
            CustomElevatedButton(
              borderRadius: 10,
              width: context.w(90),
              height: context.h(7),
              buttonColor: AppColors.kRed,
              title: 'Logout',
              onPress: () {},
            ).centerWidget,
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(children: children),
    ).padHrz(16);
  }

  Widget _buildSettingsListItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.kSecondarySupport.withAlpha(100)),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: context.w(5)),
      onTap: onTap,
    );
  }
}
