import 'package:flutter/material.dart';
import '../screens/blog_detail_screen.dart'; 

class BlogCard extends StatelessWidget {
  final String imageUrl;
  final String author;
  final String title;
  final String date;
  final String text;

  const BlogCard({
    super.key,
    required this.imageUrl,
    required this.author,
    required this.title,
    required this.date,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailScreen(
              imageUrl: imageUrl,
              title: title,
              author: author,
              date: date,
              text: text,
            ),
          ),
        );
      },
      child: Card(
        child: Row(
          children: <Widget>[
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: Text(title),
                    subtitle: Text(author),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(date),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
