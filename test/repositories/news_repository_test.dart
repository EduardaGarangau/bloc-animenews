import 'package:anime_news/datasources/news_datasource.dart';
import 'package:anime_news/models/news.dart';
import 'package:anime_news/repositories/news_repository.dart';
import 'package:anime_news/repositories/repository_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class NewsDatasourceMock extends Mock implements NewsDatasource {}

void main() {
  late NewsRepository repository;
  late NewsDatasourceMock datasourceMock;
  group('Test News Repository', () {
    setUp(() {
      datasourceMock = NewsDatasourceMock();
      repository = NewsRepository(datasource: datasourceMock);
    });

    test('List of News should return true if not empty', () async {
      when(() => datasourceMock.fetchNews(1))
          .thenAnswer((_) async => listDatasource);
      final listNews = await repository.fetchNews(1);
      expect(listNews.isNotEmpty, true);
    });

    test('Item in list should be of type News', () async {
      when(() => datasourceMock.fetchNews(1))
          .thenAnswer((_) async => listDatasource);
      final listNews = await repository.fetchNews(1);
      final News news = listNews[0];
      expect(news, isA<News>());
    });

    test('Should return Exception if has error', () async {
      when(() => datasourceMock.fetchNews(1))
          .thenThrow(RepositoryException('Error'));
      expect(() async => await repository.fetchNews(1),
          throwsA(isA<RepositoryException>()));
    });
  });
}

const List<dynamic> listDatasource = [
  {
    "id": 01,
    "title": {"rendered": "Teste do Repositório"},
    "content": {"rendered": "Testando se o Repositório funciona corretamente"},
    "yoast_head_json": {
      "og_image": [
        {
          "width": 2560,
          "height": 1214,
          "url":
              "https://www.intoxianime.com/wp-content/uploads/2022/11/81hqarHGcHL-tile-scaled.jpg",
          "type": "image/jpeg"
        }
      ],
      "author": "Teste",
    },
  }
];
