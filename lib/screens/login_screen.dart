import 'package:blog_app/services/auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LoginButton(text: 'Login as Guest', color: Colors.grey, icon: const Icon(Icons.person), loginMethod: AuthService().anonymousLogin)
          ],),
      )
    );
  }
}


class LoginButton extends StatelessWidget{
  final Color color;
  final Icon icon;
  final String text;
  final Function loginMethod;


  const LoginButton({Key? key,
    required this.text, 
    required this.color,
    required this.icon,
    required this.loginMethod})
    : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        icon: icon,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
        onPressed: () => loginMethod(),
        label: Text(text),
        )
    );
  }
}