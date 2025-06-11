import 'package:flutter_movie/data/services/api/api_client.dart';
import 'package:flutter_movie/data/services/api/model/movie.dart';
import 'package:flutter_movie/util/result.dart';

import 'movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  const MovieRepositoryImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Future<Result<List<Movie>>> getMovies({String query = 'star'}) async {
    return _apiClient.getMovies(query);
  }
}
