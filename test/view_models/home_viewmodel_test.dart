import 'package:flutter_movie/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../testing/fakes/repositories/fake_movie_repository.dart';

void main() {
  late HomeViewModel homeViewModel;

  group("HomeViewModel test", () {
    setUp(() {
      homeViewModel = HomeViewModel(movieRepository: FakeMovieRepository());
    });

    test("initial state", () {
      expect(homeViewModel.movies.length, 0);
      expect(homeViewModel.favorites.length, 0);
      expect(homeViewModel.load.running, true);
    });

    test("load movies", () async {
      expect(homeViewModel.load.running, true);
      await Future.delayed(
        Duration(seconds: FakeMovieRepository.delayInSeconds),
      );
      expect(homeViewModel.movies.length, 2);
      expect(homeViewModel.load.running, false);
    });

    test("load movies with error", () async {
      // wait for the initial load
      await Future.delayed(
        Duration(seconds: FakeMovieRepository.delayInSeconds),
      );

      await homeViewModel.load.execute("error");

      expect(homeViewModel.load.error, true);
    });

    test("toggle favorite movie", () async {
      final movie = FakeMovieRepository.fakeMovies.first;

      // Initially, favorites should be empty
      expect(homeViewModel.favorites.length, 0);

      // Toggle favorite
      homeViewModel.onFavoriteToggle(movie);
      expect(homeViewModel.favorites.length, 1);
      expect(homeViewModel.favorites.first, movie);

      // Toggle again to remove favorite
      homeViewModel.onFavoriteToggle(movie);
      expect(homeViewModel.favorites.length, 0);
    });
  });
}
