import 'package:deranest/core/data/services/firebase_auth_services.dart';
import 'package:deranest/features/authentication/data/auth_provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final splashProvider = StateNotifierProvider<SplashProvider, SplashState>((ref) {
  final authService = ref.read(authServiceProvider);
  return SplashProvider(authService);
});

class SplashProvider extends StateNotifier<SplashState> {
  final FirebaseAuthServices authService;
  SplashProvider(this.authService) : super(SplashState(loginStatus: false)) {
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    if (authService.isLogin() == true) {
      state.loginStatus == true;
    } else {
      state.loginStatus == false;
    }
  }
}

class SplashState {
  final bool loginStatus;

  SplashState({required this.loginStatus});

  SplashState copyWith({bool? loginStatus}) {
    return SplashState(loginStatus: loginStatus ?? this.loginStatus);
  }
}
