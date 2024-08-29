class BlogPost {
  final String id;
  final String author;
  final String title;
  final DateTime date;
  final String text;

  BlogPost({
    required this.id,
    required this.author,
    required this.title,
    required this.date,
    this.text = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'text': text,
      'date': date.toIso8601String(),
    };
  }

  factory BlogPost.fromMap(Map<String, dynamic> map) {
    return BlogPost(
      id: map['id'],
      author: map['author'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      text: map['text'] ?? '',
    );
  }
}
