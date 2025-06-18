import 'package:flutter_movie/data/movie_database.dart';
import 'package:flutter_movie/data/services/api/api_client.dart';
import 'package:flutter_movie/data/services/api/model/movie.dart';
import 'package:flutter_movie/util/result.dart';

import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  const MovieRepositoryImpl({
    required ApiClient apiClient,
    required MovieDatabase movieDatabase,
  }) : _movieDatabase = movieDatabase,
       _apiClient = apiClient;

  final ApiClient _apiClient;
  final MovieDatabase _movieDatabase;

  @override
  Stream<List<Movie>> get favoritesStream => _movieDatabase.moviesStream;

  @override
  Future<Result<List<Movie>>> getMovies({String query = 'star'}) async {
    return _apiClient.getMovies(query);
  }

  @override
  Future<void> deleteFavorite(int trackId) {
    return _movieDatabase.deleteMovie(trackId);
  }

  @override
  Future<void> insertFavorite(Movie movie) {
    return _movieDatabase.insertMovie(movie);
  }

  @override
  Future<void> loadFavorites() {
    return _movieDatabase.loadInitialMovies();
  }
}
