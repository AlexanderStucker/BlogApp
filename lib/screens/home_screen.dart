import 'package:blog_app/widgets/nav_bar.dart';
import 'package:blog_app/widgets/search_box.dart';
import 'package:blog_app/widgets/title_text.dart';
import 'package:blog_app/widgets/blog_card.dart';
import 'package:flutter/material.dart';
import '../models/blog_post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
            child: _blogList(),
          ),
        ],
      ),
    );
  }


// Sample Data for Blog-Posts. Will be deleted in the future
  Widget _blogList() {
    List<BlogPost> blogs = [
      BlogPost(
        imageUrl: "https://via.placeholder.com/150",
        author: "Alexander Stucker",
        title: "My First Blog",
        date: "20.05.2024",
        text:
            "This is my First Blog and blabalbalalbalbalblablablablablablablablalbal",
      ),
      BlogPost(
        imageUrl: "https://via.placeholder.com/150",
        author: "Author 2",
        title: "Title of Blog 2",
        date: "20.05.2024",
      ),
      BlogPost(
        imageUrl: "https://via.placeholder.com/150",
        author: "Author 3",
        title: "Title of Blog 3",
        date: "20.05.2024",
      ),
      BlogPost(
        imageUrl: "https://via.placeholder.com/150",
        author: "Author 4",
        title: "Title of Blog 4",
        date: "20.05.2024",
      ),
      BlogPost(
        imageUrl: "https://via.placeholder.com/150",
        author: "Author 5",
        title: "Title of Blog 5",
        date: "20.05.2024",
      ),
      BlogPost(
        imageUrl: "https://via.placeholder.com/150",
        author: "Author 6",
        title: "Title of Blog 6",
        date: "20.05.2024",
      ),
    ];

// Using ListView.builder to get all the scrollable cards
    return ListView.builder(
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        return BlogCard(
          imageUrl: blogs[index].imageUrl,
          author: blogs[index].author,
          title: blogs[index].title,
          date: blogs[index].date,
          text: blogs[index].text ?? "",
        );
      },
    );
  }
}
