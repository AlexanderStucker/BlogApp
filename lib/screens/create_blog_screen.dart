import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/blog_post.dart';
import '../services/blog_repository.dart';

class CreateBlogScreen extends StatefulWidget {
  final VoidCallback onBlogCreated;

  const CreateBlogScreen({super.key, required this.onBlogCreated});

  @override
  _CreateBlogScreenState createState() => _CreateBlogScreenState();
}

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
              decoration: const InputDecoration(labelText: 'Author'),
              onChanged: (value) {
                setState(() {
                  _author = value;
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
              onPressed: () {
                // Immer das heutige Datum speichern
                final String date =
                    DateFormat('dd.MM.yyyy').format(DateTime.now());
                final newBlogPost = BlogPost(
                // Im moment immer das Placeholder Image verwenden
                  imageUrl: 'https://via.placeholder.com/150',
                  title: _title,
                  author: _author,
                  date: date,
                  text: _text,
                );

                // Neuen Eintrag hinzufügen
                BlogRepository().addBlogPost(newBlogPost);
                //Die Liste wird neu geladen -> HomeScreen
                widget.onBlogCreated();
                // Kehrt zur vorherigen seite zurück
                Navigator.pop(context);
              },
              child: const Text('Create Blog'),
            ),
          ],
        ),
      ),
    );
  }
}
