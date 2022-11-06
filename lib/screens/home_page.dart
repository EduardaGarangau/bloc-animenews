import 'package:anime_news/components/news_item.dart';
import 'package:anime_news/models/news.dart';
import 'package:anime_news/screens/bloc/news_bloc.dart';
import 'package:anime_news/screens/bloc/news_event.dart';
import 'package:anime_news/screens/bloc/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NewsBloc bloc;
  int page = 1;
  final controller = ScrollController();
  static List<News> list = [];

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NewsBloc>(context);
    bloc.add(LoadNewsEvent(page: page));
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        page++;
        bloc.add(LoadNewsEvent(page: page));
      }
    });
  }

  @override
  void dispose() {
    bloc.close();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade500,
        elevation: 5,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        title: const Text(
          'Anime News',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is LoadingNewsState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SucessNewsState) {
              list.addAll(state.news);

              return ListView.builder(
                controller: controller,
                itemCount: list.length + 1,
                itemBuilder: (context, index) {
                  if (index < list.length) {
                    return NewsItem(news: list[index]);
                  } else {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.pink,
                        ),
                      ),
                    );
                  }
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
