
import 'package:deranest/core/data/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLifecycleProvider = StateNotifierProvider<AppLifecycleNotifier, AppLifecycleState>((ref) {
  return AppLifecycleNotifier(ref);
});

class AppLifecycleNotifier extends StateNotifier<AppLifecycleState> with WidgetsBindingObserver {
  final Ref ref;

  AppLifecycleNotifier(this.ref) : super(AppLifecycleState.resumed) {
    // Add lifecycle observer
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Remove lifecycle observer
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    super.didChangeAppLifecycleState(lifecycleState);

    // Log lifecycle state change
    state = lifecycleState;

    // Update app in foreground status in local storage
    LocalStorage.updateIsAppInForeground(lifecycleState == AppLifecycleState.resumed);
  }
}
