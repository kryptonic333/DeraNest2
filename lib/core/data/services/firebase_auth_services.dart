import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthServices {
  // Get the instance of the firebaseAuth
  final firebaseAuth = FirebaseAuth.instance;

  // Signup Method
  Future<void> signUp(TextEditingController email, TextEditingController pass, BuildContext context) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email.text.toString(),
      password: pass.text.toString(),
    );
  }

  // Password Reset Method
  Future<void> resetPass(TextEditingController email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email.text.trim());
  }

  // SignIn Method
  Future<void> signIn(TextEditingController email, TextEditingController pass, BuildContext context) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email.text.toString(),
      password: pass.text.toString(),
    );
  }

  // SignOut User
  Future<void> signOut(BuildContext context) async {
    await firebaseAuth.signOut();
  }

  // isLogin Method
  bool isLogin() {
    // Get current user
    final user = firebaseAuth.currentUser;
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }
}
