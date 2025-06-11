import 'package:flutter/foundation.dart';
import 'package:flutter_movie/data/repository/movie/movie_repository.dart';
import 'package:flutter_movie/data/services/api/model/movie.dart';
import 'package:flutter_movie/util/command.dart';
import 'package:flutter_movie/util/result.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required MovieRepository movieRepository})
    : _movieRepository = movieRepository {
    load = Command0(_load)..execute();
  }

  final MovieRepository _movieRepository;

  late Command0 load;
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  Future<Result<List<Movie>>> _load() async {
    try {
      final result = await _movieRepository.getMovies();
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
}
