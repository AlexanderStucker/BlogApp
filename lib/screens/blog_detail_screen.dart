import 'package:flutter/material.dart';
import '../services/blog_repository.dart';

class BlogDetailScreen extends StatelessWidget {
  final String id;
  final String title;
  final String author;
  final String date;
  final String text;

  const BlogDetailScreen({
    super.key,
    required this.id,
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
        actions: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            bool confirmed = await _showDeleteConfirmationDialog(context);
            if (confirmed) {
              await BlogRepository().deleteBlogPost(id);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Blog erfolgreich gelöscht!')),
              );
              Navigator.pop(context, true);  // Gibt `true` zurück, wenn ein Blog gelöscht wurde
            }
          },
        ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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

  Future<bool> _showDeleteConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Blog löschen'),
        content: const Text('Möchten Sie diesen Blog wirklich löschen?'),
        actions: [
          TextButton(
            child: const Text('Abbrechen'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: const Text('Löschen'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
    ) ?? false;
  }
}
