import 'dart:async';

import '../models/blog_post.dart';

class BlogRepository {
  Future<List<BlogPost>> getBlogPosts() async {
    // Simulieren einer Verzögerung für asynchrone Datenabruf
    await Future.delayed(Duration(seconds: 2));

    return [
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
    ];
  }
}
