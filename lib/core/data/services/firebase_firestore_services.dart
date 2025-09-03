import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deranest/core/presentation/widgets/snackbar.dart';
import 'package:deranest/features/authentication/data/model/user_model.dart';
import 'package:flutter/material.dart';

class FirebaseFirestoreServices
{
  // Creating a collection instance for users in firestore
  final users = FirebaseFirestore.instance.collection('users');

  // Snapshots of data
  final userData = FirebaseFirestore.instance.collection('users').snapshots();

  // Add User To Firestore Users Collection
  void addUser(String id, UserModel user, BuildContext context) {
    users
        .doc(id)
        .set({
          'id': id,
          'Name': user.name,
          'Gender': user.gender,
          'Phone Number': user.phone,
          'Email': user.email,
          'UserName' : 'To be Continued...',
          'Bio': 'To be Continued...'
        })
        .then((val) {
          ShowSnackbar1.success(context, 'User Added!');
        })
        .onError((e, stackTrace) {
          ShowSnackbar1.error(context, 'Error adding user');
        });
  }

  // Update the user data in users collection
  void updateProfile(UserModel user, userData, BuildContext context) {
    // Given that docId == userId
    users
        .doc(userData.snapshot['id'].toString())
        .update({
          'Name': user.name,
          'Username': 'To be added in User Model',
          'Bio': 'To be added in User Model',
          'Email': user.email,
          'Phone': user.phone,
        })
        .then((val) {})
        .onError((e, stackTrace) {});
  }

  // Get Current User Data from FireStore
  Future<DocumentSnapshot> getCurrentUserData(String userId) {
  return users.doc(userId).get();
} 
}
