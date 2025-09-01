import 'package:deranest/core/data/services/firestore_services.dart';
import 'package:deranest/features/authentication/data/model/user_model.dart';
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
  required String name,
  required String phone,
  required String gender,
}) async {
  try {
    // Create auth user
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Create user model
    final user = UserModel(
      id: '',    
      name: name,
      email: email,
      phone: phone,
      gender: gender,
      createdAt: DateTime.now(),
    );

    // Create Firestore user document
    final firestoreServices = FirestoreServices();
    await firestoreServices.createUser(user);

    return userCredential;
  } catch (e) {
    throw Exception('Failed to sign up: $e');
  }
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
