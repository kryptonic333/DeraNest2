import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deranest/features/authentication/data/model/user_model.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a new User Document
  Future<String> createUser(UserModel user) async {
   try {
      // Make a new document reference in the users 
      // collection with an auto-generated ID
      final docRef = _firestore.collection('users').doc();
      
      // user Model with Auto Generated User Id
      final appUser = UserModel(
        id: docRef.id,  
        name: user.name,
        email: user.email,
        phone: user.phone,
        gender: user.gender,       
        createdAt: DateTime.now(),       
        followersCount: 0,
        followingCount: 0,
        postsCount: 0,
        isVerified: false,
      );

      // Set the document data
      await docRef.set(appUser.toJson());
      
      // Return the generated ID
      return docRef.id;
    } catch (e) {
      throw Exception('Failed to create User: $e ');
    }
  }

  // Get User by Id
  Future<UserModel?> getUser(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists && doc.data() != null)
      // Convert Doc data to User Model
      {
        return UserModel.fromJson(doc.data()!, doc.id);
      }
      return null;
    } catch (e) {
      throw Exception('failed to get User: $e');
    }
  }
}
