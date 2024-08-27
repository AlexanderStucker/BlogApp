import 'package:blog_app/services/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MainApp());
}


class MainApp extends StatefulWidget{
 const MainApp({super.key});

 @override
State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('error');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            initialRoute: '/',
            routes: appRoutes,
          );
        }

        return Text('loading');

      },
    );
  }
}
