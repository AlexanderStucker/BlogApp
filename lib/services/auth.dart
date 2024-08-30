import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream für Auth-Status-Änderungen
  Stream<User?> get userStream => _auth.authStateChanges();

  // Gibt den aktuellen Benutzer zurück
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Registriert einen neuen Benutzer mit Email und Passwort
  Future<User?> registerWithEmailAndPassword(String email, String password, String authorName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
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

  // Guest Anmeldung
  Future<void> anonymousLogin() async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      throw Exception('Anonymous login failed: ${e.message}');
    }
  }

  // Anmeldung mit Email und Passwort
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      throw Exception('Sign in failed: $e');
    }
  }

  // Abmeldung
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Überprüfung ob der user Anonym = Guest ist
  bool isAnonymousUser() {
    final user = getCurrentUser();
    return user != null && user.isAnonymous;
  }
}
