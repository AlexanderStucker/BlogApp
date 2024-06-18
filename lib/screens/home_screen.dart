import 'package:flutter/material.dart';
import '../models/blog_post.dart';
import '../services/blog_repository.dart';
import '../widgets/blog_card.dart';
import '../widgets/nav_bar.dart';
import '../widgets/search_box.dart';
import '../widgets/title_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<BlogPost>>? futureBlogs;

  //Initialisiere den Screen mit den vorhandenen Blogs im Repository
  @override
  void initState() {
    super.initState();
    fetchBlogs();
  }

  // Hohlt die Blogs aus dem Repo
  void fetchBlogs() {
    setState(() {
      futureBlogs = BlogRepository().getBlogPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(
        // Wenn neue Blogs erstellt wurden, soll die Liste neu geladen werden
        onNewBlogCreated: fetchBlogs,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 50,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipOval(
              child: Image.network(
                "https://images.unsplash.com/photo-1545996124-0501ebae84d0?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
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
                  return const Center(child: CircularProgressIndicator()); // Zeigt einen Ladeindikator, solange die Liste geladen wird
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
                        text: blog.text ?? "",
                      );
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
