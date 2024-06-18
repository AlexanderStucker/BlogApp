import '../models/blog_post.dart';

class BlogRepository {
  static final BlogRepository _instance = BlogRepository._internal();

  factory BlogRepository() {
    return _instance;
  }

  BlogRepository._internal();

  final List<BlogPost> _blogPosts = [
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

  Future<List<BlogPost>> getBlogPosts() async {
    await Future.delayed(const Duration(seconds: 2));
    return _blogPosts;
  }

  void addBlogPost(BlogPost blogPost) {
    _blogPosts.add(blogPost);
  }
}
