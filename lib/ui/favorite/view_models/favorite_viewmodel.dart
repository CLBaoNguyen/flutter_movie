import 'package:flutter/foundation.dart';
import 'package:flutter_movie/data/repository/movie/movie_repository.dart';

import '../../../data/services/api/model/movie.dart';

class FavoriteViewModel extends ChangeNotifier {
  FavoriteViewModel({required MovieRepository movieRepository})
    : _movieRepository = movieRepository {
    _subscribeToFavorites();
  }

  final MovieRepository _movieRepository;
  List<Movie> _favorites = [];

  List<Movie> get favorites => _favorites;

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
