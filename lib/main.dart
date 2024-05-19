import 'package:flutter/material.dart';
import 'package:blog_app/nav_bar.dart';

void main() {
  runApp(MainApp());
}

//Root of the App. Needs to be a Stateless Widget
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

//Statefull Widget, because the entries of the Blogs are going to be different
// Maybe needs to be its own class-file in the Future
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

// Stateclass of MyHomepage
class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Scaffold for now
    return Scaffold(
      // drawer with a Navbar
      drawer: NavBar(),
      /////////// TBD FROM HERE //////////////
      appBar: AppBar(
        title: Text("Blog List"),
      ),
      body: Center(),
    );
  }
}
