import 'dart:async';
import 'package:bloc_pattern/bloc/bloc.dart';
import 'package:bloc_pattern/data/article.dart';
import 'package:bloc_pattern/data/rw_client.dart';
import 'package:rxdart/rxdart.dart';

class ArticleListBloc implements Bloc {

  final _client = RWClient(); // communicate with raywenderlich.com based on HTTP protocol

  final _searchQueryController = StreamController<String?>();

  Sink<String?> get searchQuery => _searchQueryController.sink; // send events to the BLoC

  late Stream<List<Article>?> articlesStream;

  ArticleListBloc() {

    articlesStream = _searchQueryController.stream
        .startWith(null) // 1
        .debounceTime(const Duration(milliseconds: 100)) // 2
        .switchMap( // 3
          (query) => _client.fetchArticles(query)
          .asStream() // 4
          .startWith(null), // 5
    );
  }


  @override
  void dispose() {
    _searchQueryController.close();
  }
}
