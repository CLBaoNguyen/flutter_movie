import '../../../util/result.dart';
import '../../services/api/model/movie.dart';

abstract class MovieRepository {
  Future<Result<List<Movie>>> getMovies({String query});
}