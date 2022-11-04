import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsDatasource {
  Future<List<dynamic>> fetchNews(int page) async {
    final response = await http.get(Uri.parse(
        'https://www.intoxianime.com/?rest_route=/wp/v2/posts&page=1&per_page=${page}'));
    return jsonDecode(response.body);
  }
}
