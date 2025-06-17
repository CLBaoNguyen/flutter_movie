import 'package:flutter_movie/data/repository/movie/movie_repository.dart';
import 'package:flutter_movie/data/services/api/model/movie.dart';
import 'package:flutter_movie/util/result.dart';

class FakeMovieRepository implements MovieRepository {
  static const int delayInSeconds = 1;
  static const List<Movie> fakeMovies = [
    Movie(
      trackId: 1,
      trackName: 'Fake Movie 1',
      artworkUrl100: 'https://example.com/image1.jpg',
      primaryGenreName: 'Action',
      longDescription: "This is a fake movie description for testing purposes.",
      trackPrice: 1.1,
      artistName: 'Fake Artist 1',
      currency: "AUD",
    ),
    Movie(
      trackId: 2,
      trackName: 'Fake Movie 2',
      artworkUrl100: 'https://example.com/image2.jpg',
      primaryGenreName: 'Comedy',
      longDescription: "This is a fake movie description for testing purposes.",
      trackPrice: 1.1,
      artistName: 'Fake Artist 1',
      currency: "AUD",
    ),
  ];

  @override
  Future<Result<List<Movie>>> getMovies({String query = 'star'}) async {
    return Future.delayed(Duration(seconds: delayInSeconds), () {
      if (query == 'error') {
        return Result.error(Exception('Fake error for testing'));
      }
      return Result.ok(fakeMovies);
    });
  }
}
