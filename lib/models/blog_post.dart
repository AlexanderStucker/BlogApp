class BlogPost {
  final String imageUrl;
  final String author;
  final String title;
  final String date;
  final String? text;

  BlogPost({
    required this.imageUrl,
    required this.author,
    required this.title,
    required this.date,
    this.text,
  });
}
