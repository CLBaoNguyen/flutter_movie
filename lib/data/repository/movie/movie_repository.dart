import '../../../util/result.dart';
import '../../services/api/model/movie.dart';

abstract class MovieRepository {
  Stream<List<Movie>> get favoritesStream;

  Future<Result<List<Movie>>> getMovies({String query});

  Future<void> loadFavorites();

  Future<void> insertFavorite(Movie movie);

  Future<void> deleteFavorite(int trackId);
}
