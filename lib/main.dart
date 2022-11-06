import 'package:anime_news/datasources/news_datasource.dart';
import 'package:anime_news/repositories/news_repository.dart';
import 'package:anime_news/screens/bloc/news_bloc.dart';
import 'package:anime_news/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(
        repository: NewsRepository(
          datasource: NewsDatasource(),
        ),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Anime News',
        home: HomePage(),
      ),
    );
  }
}
