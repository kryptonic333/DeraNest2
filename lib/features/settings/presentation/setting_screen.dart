import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/constants/app_text_styles.dart';
import 'package:deranest/core/presentation/widgets/custom_safe_area.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          iconTheme: IconThemeData(color: AppColors.kBlack, size: context.w(8)),
        ),
        body: ListView(
          children: <Widget>[
            const SizedBox(height: 20),
            Text(
              'Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.kSecondary,
              ),
            ).padHrz(16),
            const SizedBox(height: 10),
            _buildSettingsCard([
              _buildSettingsListItem(
                context,
                icon: Icons.person_outline,
                title: 'Edit Profile',
                onTap: () {},
              ),
              _buildSettingsListItem(
                context,
                icon: Icons.lock_outline,
                title: 'Change Password',
                onTap: () {},
              ),
              _buildSettingsListItem(
                context,
                icon: Icons.security_outlined,
                title: 'Privacy and Security',
                onTap: () {},
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
            ).padHrz(16),
            const SizedBox(height: 10),
            _buildSettingsCard([
              _buildSettingsListItem(
                context,
                icon: Icons.notifications_outlined,
                title: 'Push Notifications',
                onTap: () {},
              ),
              _buildSettingsListItem(
                context,
                icon: Icons.email_outlined,
                title: 'Email Notifications',
                onTap: () {},
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
            ).padHrz(16),
            const SizedBox(height: 10),
            _buildSettingsCard([
              _buildSettingsListItem(
                context,
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {},
              ),
              _buildSettingsListItem(
                context,
                icon: Icons.info_outline,
                title: 'About',
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kSecondarySupport,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(fontSize: 16, color: AppColors.kWhite),
              ),
            ).padHrz(16),
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
      leading: Icon(icon, color: AppColors.kPrimary),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
