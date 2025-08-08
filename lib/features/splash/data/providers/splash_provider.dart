import 'package:deranest/core/data/local_storage.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = StateNotifierProvider<SplashProvider, SplashState>((
  ref,
) {
  return SplashProvider();
});

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(SplashState(loginStatus: LocalStorage.loginStatus));

  void login() {
    state = state.copyWith(loginStatus: true);
    LocalStorage.updateLoginStatus(true);
  }

  // Check for notification route when needed
  Future<String> getNavigationRoute() async {
    return Routes.feed;
  }
}

class SplashState {
  final bool loginStatus;

  SplashState({required this.loginStatus});

  SplashState copyWith({bool? loginStatus}) {
    return SplashState(loginStatus: loginStatus ?? this.loginStatus);
  }
}
