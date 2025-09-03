import 'package:deranest/core/presentation/widgets/snackbar.dart';
import 'package:deranest/core/routing/app_routers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirebaseAuthServices
{
  // Get the instance of the firebaseAuth
  final firebaseAuth = FirebaseAuth.instance;

  // Signup Function
  void signUp(TextEditingController email, TextEditingController pass, BuildContext context) {
    firebaseAuth
        .createUserWithEmailAndPassword(email: email.text.toString(), password: pass.text.toString())
        .then((val) {
          ShowSnackbar1.success(context, 'Signup Successful!');
          context.push(Routes.userDiscovery);
        })
        .onError((error, stack) {
          ShowSnackbar1.error(context, 'Signup Error!');
        });
  }

  // SignIn Function
  void signIn(TextEditingController email, TextEditingController pass, BuildContext context) {
    firebaseAuth
        .signInWithEmailAndPassword(email: email.text.toString(), password: pass.text.toString())
        .then((val) {
          ShowSnackbar1.success(context, 'SignIn Successful!');
          context.go(Routes.feed);
        })
        .onError((error, stack) {
          ShowSnackbar1.error(context, 'SignIn Error!');
        });
  }

  // SignOut User
  void signOut(BuildContext context) {
    firebaseAuth
        .signOut()
        .then((val) {
          context.go(Routes.welcome);
        })
        .onError((error, stackTrace) 
        {
          ShowSnackbar1.success(context, 'There was some error!');
        });
  }


  // isLogin Function
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
