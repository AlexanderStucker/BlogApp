import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;


Future<void> anonymousLogin() async{
  try{
    await FirebaseAuth.instance.signInAnonymously();
  } on FirebaseAuthException catch (e){
    //ERROR HANDLING HERE
  }
}

Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
}


}