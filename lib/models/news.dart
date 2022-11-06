import 'package:equatable/equatable.dart';

class News extends Equatable {
  final int id;
  final String title;
  final String imageURL;
  final String author;

  const News({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.author,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] as int,
      title: json['title']['rendered'] as String,
      imageURL: json['yoast_head_json']['og_image'][0]['url'] as String,
      author: json['yoast_head_json']['author'] as String,
    );
  }

  @override
  List<Object?> get props => [id, title, imageURL, author];
}
