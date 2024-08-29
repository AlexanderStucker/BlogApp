import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/blog_post.dart';

class CreateBlogScreen extends StatefulWidget {
  final VoidCallback onBlogCreated;

  const CreateBlogScreen({super.key, required this.onBlogCreated});

  @override
  _CreateBlogScreenState createState() => _CreateBlogScreenState();
}

// Titel, Author und Text müssen gespeichert werden
class _CreateBlogScreenState extends State<CreateBlogScreen> {
  String _title = '';
  String _author = '';
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Write New Blog"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Text'),
              maxLines: 10,
              onChanged: (value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await addBlogPost();
                widget.onBlogCreated();
                Navigator.pop(context, true); // Pass true when a blog is created
              },
              child: const Text('Create Blog'),
            ),
          ],
        ),
      ),
    );
  }

// Methode um die Blogs in der Datenbank zu speichern
  Future<void> addBlogPost() async {
    final db = FirebaseFirestore.instance.collection('blogPosts');
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      // Schutz, falls der User nicht angemeldet ist
      return;
    }

    // Neues Blog-Objekt erstellen 
    final blog = BlogPost(
      id: DateTime.now().toString(),
      author: currentUser.uid,
      title: _title,
      text: _text,
      date: DateTime.now(),
    );

    // erstellter Blog in Firebase speichern
    try {
      await db.doc(blog.id).set(blog.toMap());
    } on FirebaseException catch (e) {
      // Handle Firebase exception
      print("Error adding blog post: ${e.message}");
    }
  }
}
