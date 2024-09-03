import 'package:flutter/material.dart';
import '../screens/blog_detail_screen.dart';
import 'package:intl/intl.dart';

class BlogCard extends StatelessWidget {
  final String id;
  final String author;
  final String title;
  final DateTime date;
  final String text;
  final VoidCallback onBlogDeleted;

  const BlogCard({
    super.key,
    required this.id,
    required this.author,
    required this.title,
    required this.date,
    required this.text,
    required this.onBlogDeleted,
  });

  @override
  Widget build(BuildContext context) {
    // Format the date to a readable string
    String formattedDate = DateFormat('dd.MM.yyyy').format(date);

    return GestureDetector(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailScreen(
              id: id,
              title: title,
              author: author,
              date: formattedDate,
              text: text,
            ),
          ),
        );
        if (result == true) {
          onBlogDeleted();
        }
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Image.network(
                'https://picsum.photos/200/300?random=$id',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    author,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
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
