import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateUserRole(String userId, String newRole) async {
    try {
      final currentUser = _auth.currentUser;

      if (currentUser == null) {
        throw Exception('User is not logged in.');
      }

      // Check if current user is an admin and not trying to update their own role
      if (currentUser.uid == userId) {
        throw Exception('Admins cannot change their own role.');
      }

      // Check if current user is an admin
      final adminSnapshot =
          await _firestore.collection('users').doc(currentUser.uid).get();

      if (adminSnapshot.exists && adminSnapshot['role'] == 'Admin') {
        // Update the user's role
        await _firestore
            .collection('users')
            .doc(userId)
            .update({'role': newRole});
      } else {
        throw Exception('Only admins can update roles.');
      }
    } catch (e) {
      print('Error updating role: $e');
      rethrow;
    }
  }
}
