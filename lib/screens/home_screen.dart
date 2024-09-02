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
  List<BlogPost>? allBlogs; 
  List<BlogPost>? filteredBlogs;  

  @override
  void initState() {
    super.initState();
    fetchBlogs();  // Blogs werden beim Starten des Bildschirms geladen.
  }

  // Hohlt die Blogs aus dem Repo
  Future<void> fetchBlogs() async {
    List<BlogPost> blogs = await BlogRepository().getBlogPosts();
    setState(() {
      allBlogs = blogs;
      filteredBlogs = blogs;  
    });
  }

  // Das Such-Queary in die filteredBlog-List speichern
  void filterBlogs(String query) {
    List<BlogPost>? filtered = allBlogs?.where((blog) {
      final titleLower = blog.title.toLowerCase();
      final authorLower = blog.author.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower) || authorLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredBlogs = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(
        onNewBlogCreated: fetchBlogs,
      ),
       appBar: AppBar(
         iconTheme: const IconThemeData(
           size: 50,
         ),
      ),
      body: Column(
        children: [
          TitleText(title: "Blog List"),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SearchBox(onSearch: filterBlogs), 
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: fetchBlogs,  // Damit die Liste aktuallisiert werden kann
              child: filteredBlogs == null 
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : filteredBlogs!.isEmpty
                      ? const Center(
                          child: Text('No blogs found'),
                        )
                      : ListView.builder(
                          itemCount: filteredBlogs!.length,
                          itemBuilder: (context, index) {
                            final blog = filteredBlogs![index];
                            return BlogCard(
                              id: blog.id,
                              author: blog.author,
                              title: blog.title,
                              date: blog.date,
                              text: blog.text,
                              onBlogDeleted: fetchBlogs,
                            );
                          },
                        ),
            ),
          ),
        ],
      ),
    );
  }
}
