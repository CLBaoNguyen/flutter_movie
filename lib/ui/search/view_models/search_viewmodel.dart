import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_movie/data/repository/movie/movie_repository.dart';

import '../../../data/services/api/model/movie.dart';
import '../../../util/command.dart';
import '../../../util/result.dart';

class SearchViewModel extends ChangeNotifier {
  SearchViewModel({required MovieRepository movieRepository})
    : _movieRepository = movieRepository {
    load = Command1(_load);
    _searchStreamController.stream.distinct().listen((query) {
      if (query.isNotEmpty) {
        load.execute(query);
      } else {
        _movies = [];
        notifyListeners();
      }
    });
  }

  late Command1<List<Movie>, String> load;

  final MovieRepository _movieRepository;
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  final StreamController<String> _searchStreamController =
      StreamController<String>();

  Future<Result<List<Movie>>> _load(String query) async {
    try {
      final result = await _movieRepository.getMovies(query: query);
      switch (result) {
        case Ok<List<Movie>>():
          _movies = result.value;
          return result;
        case Error<List<Movie>>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  void search(String query) {
    _searchStreamController.add(query);
  }
}
