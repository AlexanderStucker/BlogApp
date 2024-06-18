import 'package:blog_app/services/blog_repository.dart';
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
  Future<List<BlogPost>>? futureBlogs;

  @override
  void initState() {
    super.initState();
    futureBlogs = BlogRepository().getBlogPosts();
  }

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
            child: FutureBuilder<List<BlogPost>>(
              future: futureBlogs,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No blogs found'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final blog = snapshot.data![index];
                      return BlogCard(
                          imageUrl: blog.imageUrl,
                          author: blog.author,
                          title: blog.title,
                          date: blog.date,
                          text: blog.text ?? "");
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
