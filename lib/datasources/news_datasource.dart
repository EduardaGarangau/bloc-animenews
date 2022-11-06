import 'dart:convert';
import 'package:anime_news/datasources/datasource_exception.dart';
import 'package:http/http.dart' as http;

class NewsDatasource {
  Future<List<dynamic>> fetchNews(int page) async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.intoxianime.com/?rest_route=/wp/v2/posts&page=${page}&per_page=10'));
      return jsonDecode(response.body);
    } catch (e, stackTrace) {
      throw DatasourceException(
        e.toString(),
        stackTrace,
      );
    }
  }
}
