import 'package:flutter/foundation.dart';
import 'package:flutter_movie/data/repository/movie/movie_repository.dart';
import 'package:flutter_movie/data/services/api/model/movie.dart';
import 'package:flutter_movie/util/command.dart';
import 'package:flutter_movie/util/result.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required MovieRepository movieRepository})
    : _movieRepository = movieRepository {
    load = Command1(_load)..execute("star");
    _subscribeToFavorites();
  }

  final MovieRepository _movieRepository;

  late Command1<List<Movie>, String> load;

  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  List<Movie> _favorites = [];

  List<Movie> get favorites => _favorites;

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

  void _subscribeToFavorites() {
    _movieRepository.favoritesStream.listen((movies) {
      _favorites = movies;
      notifyListeners();
    });
    _movieRepository.loadFavorites();
  }

  void onFavoriteToggle(Movie movie) {
    if (_favorites.contains(movie)) {
      _movieRepository.deleteFavorite(movie.trackId);
    } else {
      _movieRepository.insertFavorite(movie);
    }
  }
}
