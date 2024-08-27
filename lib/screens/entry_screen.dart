import 'package:flutter/material.dart';
import 'package:blog_app/screens/login_screen.dart';
import 'package:blog_app/screens/home_screen.dart';
import 'package:blog_app/services/auth.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Text('loading');
        }else if(snapshot.hasError){
          return const Center(child: Text('error'),);
        }else if(snapshot.hasData){
          return const HomeScreen();
        }else{
          return const LoginScreen();
        }
      },
    );
  }
}