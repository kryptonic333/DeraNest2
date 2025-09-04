import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deranest/features/authentication/data/model/user_model.dart';
import 'package:flutter/material.dart';

class FirebaseFirestoreServices {
  // Creating a collection instance for users in firestore
  final users = FirebaseFirestore.instance.collection('users');

  // Snapshots of data
  final userData = FirebaseFirestore.instance.collection('users').snapshots();

  // Add User To Firestore Users Collection
  Future<void> addUser(String id, UserModel user, BuildContext context)async {
    await users
        .doc(id)
        .set(user.toJson())
        .then((val) {
          debugPrint('User Added Successfully');
        })
        .onError((e, stackTrace) {
          debugPrint('User Added Successfully');
        });
  }

  // Update the user data in users collection
  Future<void> updateProfile(UserModel user, userData, BuildContext context)async {
    // Given that docId == userId
    await users
        .doc(userData.snapshot['id'].toString())
        .update(user.toJson())
        .then((val) {})
        .onError((e, stackTrace) {});
  }

  // Fetch user data
  Future<UserModel?> fetchUserData(String userId) async
  {
    try
    {
      // getting doc with given user id
      final doc = await users.doc(userId).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data()!,userId);
      }
      return null;
    } catch (e) {
      debugPrint("Error fetching user: $e");
      return null;
    }
  }

  // Stream to get user
  Stream<UserModel?> streamUserData(String userId) {
  return users.doc(userId).snapshots().map((doc) {
    if (doc.exists) {
      return UserModel.fromJson(doc.data()!,userId);
    }
    return null;
  });
}

}
