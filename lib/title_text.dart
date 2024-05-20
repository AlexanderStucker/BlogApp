import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;

  TitleText({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
