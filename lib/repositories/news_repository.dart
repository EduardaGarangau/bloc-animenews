import 'package:anime_news/datasources/news_datasource.dart';
import 'package:anime_news/models/news.dart';

class NewsRepository {
  final NewsDatasource datasource;

  NewsRepository({
    required this.datasource,
  });

  Future<List<News>> fetchNews(int page) async {
    final data = await datasource.fetchNews(page);
    return data.map((news) => News.fromJson(news)).toList();
  }
}
