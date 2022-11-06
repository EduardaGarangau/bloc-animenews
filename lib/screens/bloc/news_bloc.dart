import 'package:anime_news/repositories/news_repository.dart';
import 'package:anime_news/screens/bloc/news_event.dart';
import 'package:anime_news/screens/bloc/news_state.dart';
import 'package:bloc/bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;

  NewsBloc({required this.repository}) : super(InitialNewsState()) {
    emit(LoadingNewsState());
    on<LoadNewsEvent>((event, emit) async {
      try {
        var news = await repository.fetchNews(event.page);
        emit(SucessNewsState(news: news));
      } catch (e) {
        emit(ErrorNewsState(message: e.toString()));
      }
    });
  }
}
