import 'package:anime_news/models/news.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {}

class InitialNewsState extends NewsState {
  @override
  List<Object?> get props => [];
}

class LoadingNewsState extends NewsState {
  @override
  List<Object?> get props => [];
}

class SucessNewsState extends NewsState {
  final List<News> news;

  SucessNewsState({required this.news});

  @override
  List<Object?> get props => [news];
}

class ErrorNewsState extends NewsState {
  final String message;

  ErrorNewsState({required this.message});

  @override
  List<Object?> get props => [message];
}
