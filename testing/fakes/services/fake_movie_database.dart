import 'dart:async';

import 'package:flutter_movie/data/movie_database.dart';
import 'package:flutter_movie/data/services/api/model/movie.dart';

class FakeMovieDatabase implements MovieDatabase {
  final List<Movie> _movies = [];

  final StreamController<List<Movie>> _moviesStream =
      StreamController<List<Movie>>();

  @override
  Stream<List<Movie>> get moviesStream => _moviesStream.stream;

  @override
  Future<void> deleteMovie(int trackId) {
    _movies.removeWhere((movie) => movie.trackId == trackId);
    _moviesStream.add(_movies);
    return Future.value();
  }

  @override
  Future<void> insertMovie(Movie movie) {
    _movies.add(movie);
    _moviesStream.add(_movies);
    return Future.value();
  }

  @override
  Future<void> loadInitialMovies() {
    _moviesStream.add(_movies);
    return Future.value();
  }
}
