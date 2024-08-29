import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/blog_post.dart';

class BlogRepository {
  static final BlogRepository _instance = BlogRepository._internal();

  factory BlogRepository() {
    return _instance;
  }

  BlogRepository._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Methode zum Abruf der Blogs in FireStore
  Future<List<BlogPost>> getBlogPosts() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('blogPosts').get();
      return querySnapshot.docs.map((doc) {
        return BlogPost.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Error getting blog posts: $e");
      return [];
    }
  }

  // Methode zum hinzufügen von Blogs
  Future<void> addBlogPost(BlogPost blogPost) async {
    try {
      await _firestore.collection('blogPosts').add(blogPost.toMap());
    } catch (e) {
      print("Error adding blog post: $e");
    }
  }

  // Methode zum Löschen von Blogs ////TBD///
}
