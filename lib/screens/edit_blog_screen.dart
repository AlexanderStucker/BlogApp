import 'package:blog_app/models/blog_post.dart';
import 'package:blog_app/services/blog_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditBlogScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String date;
  final String text;

  const EditBlogScreen({
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
        title: const Text('Edit Blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              initialValue: title,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Author'),
              initialValue: author,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Text'),
              maxLines: 10,
              initialValue: text,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Immer das heutige Datum speichern
                final String date =
                    DateFormat('dd.MM.yyyy').format(DateTime.now());
                final updatedBlogPost = BlogPost(
                  // Im moment immer das Placeholder Image verwenden
                  imageUrl: 'https://via.placeholder.com/150',
                  title: title,
                  author: author,
                  date: date,
                  text: text,
                );

                // Neuen Eintrag hinzufügen
                BlogRepository().updateBlogPost(updatedBlogPost);
                //Die Liste wird neu geladen -> HomeScreen

                // Kehrt zur vorherigen seite zurück
                Navigator.pop(context);
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
