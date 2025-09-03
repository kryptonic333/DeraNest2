
import 'package:flutter_riverpod/flutter_riverpod.dart';


final splashProvider = StateNotifierProvider<SplashProvider, SplashState>((
  ref,
) {  
  return SplashProvider();
});

class SplashProvider extends StateNotifier<SplashState> {
 
  SplashProvider()
    : super(SplashState(loginStatus:false) )
    {
      _checkLoginStatus();
    }
  
  void _checkLoginStatus() 
  {

   
  }
}

class SplashState {
  final bool loginStatus;

  SplashState({required this.loginStatus});

  SplashState copyWith({bool? loginStatus}) {
    return SplashState(loginStatus: loginStatus ?? this.loginStatus);
  }
}
