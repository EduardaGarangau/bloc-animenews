import 'package:anime_news/models/news.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({
    required this.news,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  news.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text('Author: ${news.author}'),
            ],
          ),
          SizedBox(
            height: 120,
            width: 150,
            child: Image(
              image: NetworkImage(news.imageURL),
            ),
          ),
        ],
      ),
    );
  }
}
