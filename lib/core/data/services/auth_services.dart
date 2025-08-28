import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// Get current user
  User? get currentUser => firebaseAuth.currentUser;

  // Listen to auth state changes (login/logout)
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // Sign in with email & password
  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Register new user
  Future<UserCredential> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // Sign out
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  // Send password reset email
  Future<void> sendPasswordResetEmail({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }


}
