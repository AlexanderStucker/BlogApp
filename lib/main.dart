import 'package:blog_app/nav_bar.dart';
import 'package:blog_app/search_box.dart';
import 'package:blog_app/title_text.dart';
import 'package:flutter/material.dart';
import 'blog_card.dart';

void main() {
  runApp(MainApp());
}

// Root of the App. Needs to be a Stateless Widget
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

// Stateful Widget, because the entries of the Blogs are going to be different
// Maybe needs to be its own class-file in the Future
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
      appBar: AppBar(
        //IconTheme is for the Size of the BurgerButton
        iconTheme: const IconThemeData(
          size: 50,
        ),
        title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          ClipOval(
            child: Image.network(
              "https://images.unsplash.com/photo-1545996124-0501ebae84d0?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
        ]),
      ),
      body: Column(
        children: [
          TitleText(title: "Blog List"),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: searchBox(),
          ),
          Expanded(
            child: blogList(),
          ),
        ],
      ),
    );
  }

  // Sample Data for Blog-Posts. Will be deleted in the future
  Widget blogList() {
    List<Map<String, String>> blogs = [
      {
        "image": "https://via.placeholder.com/150",
        "author": "Alexander Stucker",
        "title": "My First Blog",
        "date": "20.05.2024",
        "text":
            "This is my First Blog and blabalbalalbalbalblablablablablablablalbal"
      },
      {
        "image": "https://via.placeholder.com/150",
        "author": "Author 2",
        "title": "Title of Blog 2",
        "date": "20.05.2024"
      },
      {
        "image": "https://via.placeholder.com/150",
        "author": "Author 3",
        "title": "Title of Blog 3",
        "date": "20.05.2024"
      },
      {
        "image": "https://via.placeholder.com/150",
        "author": "Author 4",
        "title": "Title of Blog 4",
        "date": "20.05.2024"
      },
      {
        "image": "https://via.placeholder.com/150",
        "author": "Author 5",
        "title": "Title of Blog 5",
        "date": "20.05.2024"
      },
      {
        "image": "https://via.placeholder.com/150",
        "author": "Author 6",
        "title": "Title of Blog 6",
        "date": "20.05.2024"
      },
    ];

    // Using ListView.builder to get all the scrollable cards
    return ListView.builder(
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        return BlogCard(
          imageUrl: blogs[index]["image"]!,
          author: blogs[index]["author"]!,
          title: blogs[index]["title"]!,
          date: blogs[index]["date"]!,
          text: blogs[index]["text"] ??
              "", // I don't want to add text to all the examples, so here it can be null
        );
      },
    );
  }
}
