import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  Future authenticateUser() async {
    try {
      if (FirebaseAuth.instance.currentUser == null) {
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
      }

      return FirebaseAuth.instance.currentUser;
    } catch (e) {
      return null;
    }
  }

  Future fetchNotifications() async {
    try {
      final user = await authenticateUser();
      if (user == null) return [];

      final CollectionReference collection =
          FirebaseFirestore.instance.collection('notifications');
      QuerySnapshot querySnapshot = await collection.get();

      return querySnapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      return [];
    }
  }
}
