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
           Text(
            "Privacy",
            style: TextStyle(fontSize: context.h(2.2), fontWeight: FontWeight.bold),
          ),
          context.h(1.2).heightBox,

          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text("Private Account"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.block),
            title: const Text("Blocked Accounts"),
            trailing:  Icon(Icons.arrow_forward_ios, size: context.h(2.2)),
            onTap: () {},
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.visibility_off),
            title: const Text("Hide Story From"),
            trailing:  Icon(Icons.arrow_forward_ios, size: context.h(2.2)),
            onTap: () {},
          ),
          const Divider(),

          context.h(1.2).heightBox,
           Text(
            "Security",
            style: TextStyle(fontSize: context.h(2.2), fontWeight: FontWeight.bold),
          ),
          context.h(2.8).heightBox,

          ListTile(
            leading: const Icon(Icons.key),
            title: const Text("Change Password"),
            trailing:  Icon(Icons.arrow_forward_ios, size: context.h(2.2)),
            onTap: () {
              context.push(Routes.changePassword);
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.devices),
            title: const Text("Login Activity"),
            trailing:  Icon(Icons.arrow_forward_ios, size: context.h(2.2)),
            onTap: () {},
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.verified_user_outlined),
            title: const Text("Two-Factor Authentication"),
            trailing:  Icon(Icons.arrow_forward_ios, size: context.h(2.2)),
            onTap: () {},
          ),
          const Divider(),
        ],
      ).padAll(context.w(4.5)),
    );
  }
}
