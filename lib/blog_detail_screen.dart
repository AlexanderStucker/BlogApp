import 'package:flutter/material.dart';

class BlogDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String date;
  final String text;

  const BlogDetailScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.date,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(imageUrl),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('By $author'),
            const SizedBox(height: 8),
            Text(date),
            const SizedBox(height: 16),
            Text(text),
          ],
        ),
      ),
    );
  }
}
