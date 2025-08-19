import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        title: const Text("Privacy & Security"),
        backgroundColor: AppColors.kWhite,
        foregroundColor: AppColors.kBlack,
        elevation: 1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Privacy",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text("Private Account"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.block),
            title: const Text("Blocked Accounts"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {},
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.visibility_off),
            title: const Text("Hide Story From"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {},
          ),
          const Divider(),

          const SizedBox(height: 20),
          const Text(
            "Security",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          ListTile(
            leading: const Icon(Icons.key),
            title: const Text("Change Password"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {
              context.push(Routes.changePassword);
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.devices),
            title: const Text("Login Activity"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {},
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.verified_user_outlined),
            title: const Text("Two-Factor Authentication"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {},
          ),
          const Divider(),
        ],
      ).padAll(context.w(4.5)),
    );
  }
}
