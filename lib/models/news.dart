class News {
  final int id;
  final String title;
  final String content;
  final String imageURL;
  final String author;

  News({
    required this.id,
    required this.title,
    required this.content,
    required this.imageURL,
    required this.author,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] as int,
      title: json['title']['rendered'] as String,
      content: json['content']['rendered'] as String,
      imageURL: json['yoast_head_json']['og_image'][0]['url'] as String,
      author: json['yoast_head_json']['author'] as String,
    );
  }
}
