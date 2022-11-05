import 'package:anime_news/datasources/news_datasource.dart';
import 'package:anime_news/models/news.dart';
import 'package:anime_news/repositories/repository_exception.dart';

class NewsRepository {
  final NewsDatasource datasource;

  NewsRepository({
    required this.datasource,
  });

  Future<List<News>> fetchNews(int page) async {
    try {
      final data = await datasource.fetchNews(page);
      return data.map((news) => News.fromJson(news)).toList();
    } catch (e) {
      throw RepositoryException(e.toString());
    }
  }
}
