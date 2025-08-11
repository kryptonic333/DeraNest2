import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:deranest/core/constants/app_colors.dart';
import 'package:deranest/core/data/adapters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainTabScreen extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;
  const MainTabScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CircleBottomNavigation(
        circleColor: AppColors.kPrimary,
        barBackgroundColor: AppColors.kSecondary,
        tabs: destination
            .map((d) => TabData(title: d.label, icon: d.icon))
            .toList(),
        onTabChangedListener: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        initialSelection: navigationShell.currentIndex,
      ),
    );
  }
}
