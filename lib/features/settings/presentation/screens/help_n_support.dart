import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        title: const Text("Help & Support"),
        backgroundColor: AppColors.kWhite,
        foregroundColor: AppColors.kBlack,
        elevation: 1,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How can we help you?",
            style: TextStyle(
              fontSize: context.h(2.8),
              fontWeight: FontWeight.bold,
            ),
          ),
          context.h(2.8).heightBox,

          // FAQs
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.help_outline, color: Colors.blueAccent),
              title: const Text("FAQs"),
              subtitle: const Text("Frequently asked questions"),
              trailing: Icon(Icons.arrow_forward_ios, size: context.h(2)),
              onTap: () {},
            ),
          ),
          context.h(1.2).heightBox,

          // Report a Problem
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.report_problem_outlined,
                color: Colors.redAccent,
              ),
              title: const Text("Report a Problem"),
              subtitle: const Text("Tell us about an issue"),
              trailing: Icon(Icons.arrow_forward_ios, size: context.h(2)),
              onTap: () {},
            ),
          ),
          context.h(1.2).heightBox,

          // Contact Support
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.green,
              ),
              title: const Text("Contact Support"),
              subtitle: const Text("Chat with our support team"),
              trailing: Icon(Icons.arrow_forward_ios, size: context.h(2)),
              onTap: () {},
            ),
          ),
          context.h(1.2).heightBox,

          // Terms & Policies
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.policy_outlined,
                color: Colors.deepPurple,
              ),
              title: const Text("Terms & Policies"),
              subtitle: const Text("Read our terms and conditions"),
              trailing: Icon(Icons.arrow_forward_ios, size: context.h(2)),
              onTap: () {
                context.push(Routes.termsCondition);
              },
            ),
          ),
        ],
      ).padAll(context.h(2)),
    );
  }
}
