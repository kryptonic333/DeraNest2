import 'package:deranest/core/data/services/firebase_auth_services.dart';
import 'package:deranest/core/data/services/firebase_firestore_services.dart';
import 'package:deranest/core/presentation/widgets/snackbar.dart';
import 'package:deranest/features/authentication/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Firebase Auth Service Provider
final authServiceProvider = Provider<FirebaseAuthServices>((ref) {
  return FirebaseAuthServices();
});

// Firestore Service Provider
final firestoreServiceProvider = Provider<FirebaseFirestoreServices>((ref) {
  return FirebaseFirestoreServices();
});

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  final authService = ref.read(authServiceProvider);
  final firestoreService = ref.read(firestoreServiceProvider);
  return AuthController(authService, firestoreService);
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
  bool isLoading;

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
    required this.isLoading,
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
    bool? isLoading,
  }) {
    return AuthState(
      loginFormKey: loginFormKey ?? this.loginFormKey,
      signUpFormKey: signUpFormKey ?? this.signUpFormKey,
      forgetFormKey: forgetFormKey ?? this.forgetFormKey,
      loginEmailController: loginEmailController ?? this.loginEmailController,
      loginPasswordController: loginPasswordController ?? this.loginPasswordController,
      phoneController: phoneController ?? this.phoneController,
      genderController: genderController ?? this.genderController,
      nameController: nameController ?? this.nameController,
      signupEmailController: signupEmailController ?? this.signupEmailController,
      confirmPasswordController: confirmPasswordController ?? this.confirmPasswordController,
      signupPasswordController: signupPasswordController ?? this.signupPasswordController,
      forgotPasswordController: forgotPasswordController ?? this.forgotPasswordController,
      isTermsAgreed: isTermsAgreed ?? this.isTermsAgreed,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AuthController extends StateNotifier<AuthState> {
  final FirebaseAuthServices _authService;
  final FirebaseFirestoreServices _firestoreService;
  AuthController(this._authService, this._firestoreService)
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
          isLoading: false,
        ),
      );

  // Terms Agreed State Change
  void toggleTermsAgreed() {
    state = state.copyWith(isTermsAgreed: !state.isTermsAgreed);
  }

  // Loading State Change
  void setLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  // userId for doc and userModel
  int userId() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  // Current User
  int? _currentUserId;
  int? get currentUserId => _currentUserId;

  /// ------AUTH_METHODS------
  // SignUp User
  Future<bool> signUp(BuildContext context) async {
    setLoading(true);
    try {
      await _authService.signUp(state.signupEmailController, state.signupPasswordController, context);
      final id = userId();
      _currentUserId = id;
      final user = UserModel(
        id: id.toString(),
        name: state.nameController.text.trim(),
        email: state.signupEmailController.text.trim(),
        phone: state.phoneController.text.toString(),
        gender: state.genderController.text.trim(),
        createdAt: DateTime.now(),
      );
      await _firestoreService.addUser(userId().toString(), user, context);
      return true;
    } catch (e) {
      ShowSnackbar1.error(context, 'Error:$e');
      return false;
    } finally {
      setLoading(false);
    }
  }

  // SignIn User
  Future<bool> signIn(BuildContext context) async {
    setLoading(true);
    try {
      await _authService.signIn(state.loginEmailController, state.loginPasswordController, context);
      return true;
    } catch (e) {
      ShowSnackbar1.error(context, 'Error:$e');
      return false;
    } finally {
      setLoading(false);
    }
  }

  // SignOut User
  Future<bool> signOut(BuildContext cont) async {
    setLoading(true);
    try {
      await _authService.signOut(cont);
      return true;
    } catch (e) {
      ShowSnackbar1.error(cont, 'Error:$e');
      return false;
    } finally {
      setLoading(false);
    }
  }

  // Password Reset Method
  Future<bool> resetPass(BuildContext context) async {
    setLoading(true);
    try {
      await _authService.resetPass(state.forgotPasswordController);
      return true;
    } catch (e) {
      ShowSnackbar1.error(context, 'Error:$e');
      return false;
    } finally {
      setLoading(false);
    }
  }

  /// ------GETTER_METHODS------
  // Fetch Single User
  Future<void> fetchUser(BuildContext context) async {
    setLoading(true);
    try {
      await _firestoreService.fetchUserData(_currentUserId.toString());
    } catch (e) {
      ShowSnackbar1.error(context, 'Error:$e');
    } finally {
      setLoading(false);
    }
  }
}
