import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<User?> registerWithEmailAndPassword(String email, String password, String authorName) async {
    try {
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      
      User? user = result.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email,
          'authorName': authorName,
        });
      }

      return user;
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  Future<void> anonymousLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      // Fehlerbehandlung hier
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      throw Exception('Sign in failed: $e');
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
