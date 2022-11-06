import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {}

class LoadNewsEvent extends NewsEvent {
  final int page;

  LoadNewsEvent({required this.page});

  @override
  List<Object?> get props => [page];
}
