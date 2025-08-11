import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController();
});
class AuthState {
  //Form Keys
  final GlobalKey<FormState> loginFormKey;
  final GlobalKey<FormState> signUpFormKey;
  final GlobalKey<FormState> forgetFormKey;

  //Text Editing Controller
  final TextEditingController phoneController;
  final TextEditingController genderController;
  final TextEditingController nameController;
  final TextEditingController loginEmailController;
  final TextEditingController loginPasswordController;
  // signUp Screen Controller
  final TextEditingController signupPasswordController;
  final TextEditingController signupEmailController;
  final TextEditingController confirmPasswordController;
  // forgot Password Screen Controller
  final TextEditingController forgotPasswordController;
  // variables
  bool isTermsAgreed;

  AuthState({
    //-----
    required this.loginFormKey,
    required this.signUpFormKey,
    required this.forgetFormKey,

    //-----
    required this.loginEmailController,
    required this.loginPasswordController,
    //--------
    required this.phoneController,
    required this.genderController,
    required this.nameController,
    required this.signupEmailController,
    required this.confirmPasswordController,
    required this.signupPasswordController,
    //----
    required this.forgotPasswordController,
    //----
    required this.isTermsAgreed,
  });
  AuthState copyWith({
    GlobalKey<FormState>? loginFormKey,
    GlobalKey<FormState>? signUpFormKey,
    GlobalKey<FormState>? forgetFormKey,
    TextEditingController? loginEmailController,
    TextEditingController? loginPasswordController,
    TextEditingController? phoneController,
    TextEditingController? genderController,
    TextEditingController? nameController,
    TextEditingController? signupEmailController,
    TextEditingController? confirmPasswordController,
    TextEditingController? signupPasswordController,
    TextEditingController? forgotPasswordController,
    bool? isTermsAgreed,
  }) {
    return AuthState(
      loginFormKey: loginFormKey ?? this.loginFormKey,
      signUpFormKey: signUpFormKey ?? this.signUpFormKey,
      forgetFormKey: forgetFormKey ?? this.forgetFormKey,
      loginEmailController: loginEmailController ?? this.loginEmailController,
      loginPasswordController:
          loginPasswordController ?? this.loginPasswordController,
      phoneController: phoneController ?? this.phoneController,
      genderController: genderController ?? this.genderController,
      nameController: nameController ?? this.nameController,
      signupEmailController:
          signupEmailController ?? this.signupEmailController,
      confirmPasswordController:
          confirmPasswordController ?? this.confirmPasswordController,
      signupPasswordController:
          signupPasswordController ?? this.signupPasswordController,
      forgotPasswordController:
          forgotPasswordController ?? this.forgotPasswordController,
      isTermsAgreed: isTermsAgreed ?? this.isTermsAgreed,
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  AuthController()
    : super(
        AuthState(
          loginFormKey: GlobalKey<FormState>(),
        signUpFormKey: GlobalKey<FormState>(),
        forgetFormKey: GlobalKey<FormState>(),
        loginEmailController: TextEditingController(),
        loginPasswordController: TextEditingController(),
        phoneController: TextEditingController(),
        genderController: TextEditingController(),
        nameController: TextEditingController(),
        signupEmailController: TextEditingController(),
        confirmPasswordController: TextEditingController(),
        signupPasswordController: TextEditingController(),
        forgotPasswordController: TextEditingController(),
        isTermsAgreed: false,)
      );

  void toggleTermsAgreed() {
   state = state.copyWith(isTermsAgreed : !state.isTermsAgreed);
  }
}
