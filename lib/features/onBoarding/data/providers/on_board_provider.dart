import 'package:deranest/core/constants/app_colors.dart';
import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// PROVIDER
final onBoardingProvider =
    StateNotifierProvider<OnBoardingNotifier, OnBoardingState>(
  (ref) => OnBoardingNotifier(),
);

// STATE
class OnBoardingState {
  final int currentPage;
  final PageController controller;

  OnBoardingState({
    required this.currentPage,
    required this.controller,
  });

  OnBoardingState copyWith({
    int? currentPage,
    PageController? controller,
  }) {
    return OnBoardingState(
      currentPage: currentPage ?? this.currentPage,
      controller: controller ?? this.controller,
    );
  }
}

// NOTIFIER
class OnBoardingNotifier extends StateNotifier<OnBoardingState> {
  OnBoardingNotifier()
      : super(
          OnBoardingState(
            currentPage: 0,
            controller: PageController(),
          ),
        );

  void updateCurrentPage(int val) {
    state = state.copyWith(currentPage: val);
  }

  void nextPage() {
    state.controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void previousPage() {
    state.controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  AnimatedContainer buildDots({
    required int index,
    required BuildContext context,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: state.currentPage == index
            ? AppColors.kPrimary
            : AppColors.kSecondary,
      ),
      margin: EdgeInsets.symmetric(horizontal: context.w(2)),
      height: 2,
      width: context.w(20),
      curve: Curves.easeIn,
    );
  }
}


