import 'package:deranest/core/data/services/auth_services.dart';
import 'package:deranest/core/presentation/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authServiceProvider = Provider<AuthServices>((ref) {
  return AuthServices();
});

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthController(authService);
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
  final AuthServices _authService;
  AuthController(this._authService)
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
          isTermsAgreed: false,
        ),
      );

  void toggleTermsAgreed() {
    state = state.copyWith(isTermsAgreed: !state.isTermsAgreed);
  }

  // Authentication Methods\
  Future<void> logout(BuildContext context) async {
    try {
      await _authService.signOut();
      ShowSnackbar1.success(context, 'Logged out successfully');
     
    } catch (e) {
      ShowSnackbar1.error(context, 'Logout failed: $e');
    }
  }
  // SignIn
  Future<bool> signInUser(BuildContext context) async {
    if (state.loginFormKey.currentState?.validate() ?? false) {
      try {
        await _authService.signInWithEmail(
          email: state.loginEmailController.text.trim(),
          password: state.loginPasswordController.text.trim(),
        );
        ShowSnackbar1.success(context, 'Sign In successful');
        return true;
      } catch (e) {
        ShowSnackbar1.error(context, '$e');
        return false;
      }
    }
    return false;
  }

  // SignUp
  Future<bool> signUpUser(BuildContext context) async {
    if (state.signUpFormKey.currentState?.validate() ?? false) {
      try {
        await _authService.signUpWithEmail(
          email: state.signupEmailController.text.trim(),
          password: state.signupPasswordController.text.trim(),
        );

        ShowSnackbar1.success(context, 'Sign up successful');
        return true;
      } catch (e) {
        ShowSnackbar1.error(context, '$e');
        return false;
      }
    }
    return false;
  }

  // Reset Password
  Future<bool> resetPassword(BuildContext context) async {
    if (state.forgetFormKey.currentState?.validate() ?? false) {
      try {
        _authService.sendPasswordResetEmail(
          email: state.forgotPasswordController.text.trim(),
        );
        ShowSnackbar1.success(context, 'Email Sent Successfully');
        return true;
      } catch (e) {
        ShowSnackbar1.error(context, e.toString());
        return false;
      }
    }
    return false;
  }
}
