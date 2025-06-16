import 'package:flutter/foundation.dart';
import 'package:flutter_movie/data/movie_database.dart';

import '../../../data/services/api/model/movie.dart';

class FavoriteViewModel extends ChangeNotifier {
  FavoriteViewModel({required MovieDatabase movieDatabase})
    : _movieDatabase = movieDatabase {
    _subscribeToFavorites();
  }

  final MovieDatabase _movieDatabase;
  List<Movie> _favorites = [];

  List<Movie> get favorites => _favorites;

  void _subscribeToFavorites() {
    _movieDatabase.moviesStream.listen((movies) {
      _favorites = movies;
      notifyListeners();
    });
    _movieDatabase.loadInitialMovies();
  }

  void onFavoriteToggle(Movie movie) {
    if (_favorites.contains(movie)) {
      _movieDatabase.deleteMovie(movie.trackId);
    } else {
      _movieDatabase.insertMovie(movie);
    }
  }
}
