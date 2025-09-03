
import 'package:deranest/features/profile/data/model/profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// Provider for a single user's profile
final profileProvider = StreamProvider.family<Profile?, String>((ref, userId) {
  final userDocStream = FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .snapshots();

  return userDocStream.map((docSnapshot) {
    if (!docSnapshot.exists) {
      return null;
    }
    return Profile.fromJson(docSnapshot.data()!, docSnapshot.id);
  });
});
