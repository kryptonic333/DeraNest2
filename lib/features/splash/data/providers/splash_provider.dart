
import 'package:deranest/core/data/services/auth_services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


final splashProvider = StateNotifierProvider<SplashProvider, SplashState>((
  ref,
) {
  final authService = AuthServices();
  return SplashProvider(authService);
});

class SplashProvider extends StateNotifier<SplashState> {
  final AuthServices _authService;
  SplashProvider(this._authService)
    : super(SplashState(loginStatus:false) )
    {
      _checkLoginStatus();
    }
  
  void _checkLoginStatus() 
  {

    if (_authService.currentUser != null) {
      state = state.copyWith(loginStatus: true);
    } else {
      state = state.copyWith(loginStatus: false);
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
