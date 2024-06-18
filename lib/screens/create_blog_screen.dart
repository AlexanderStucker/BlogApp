import 'package:blog_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/blog_post.dart';

class CreateBlogScreen extends StatefulWidget {
  @override
  _CreateBlogScreenState createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  String _imageUrl = '';
  String _title = '';
  String _author = '';
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write New Blog"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
              decoration: InputDecoration(labelText: 'Image URL'),
              onChanged: (value) {
                setState(() {
                  _imageUrl = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Author'),
              onChanged: (value) {
                setState(() {
                  _author = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Text'),
              maxLines: 10,
              onChanged: (value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String date =
                    DateFormat('dd.MM.yyyy').format(DateTime.now());

                final newBlogPost = BlogPost(
                  imageUrl: _imageUrl,
                  title: _title,
                  author: _author,
                  date: date,
                  text: _text,
                );

                MaterialPageRoute(builder: (context) => HomeScreen());
              },
              child: Text('Create Blog'),
            ),
          ],
        ),
      ),
    );
  }
}
