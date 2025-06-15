import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_movie/data/repository/movie/movie_repository.dart';
import 'package:flutter_movie/data/shared_preference_service.dart';

import '../../../data/services/api/model/movie.dart';
import '../../../util/command.dart';
import '../../../util/result.dart';

class SearchViewModel extends ChangeNotifier {
  SearchViewModel({
    required MovieRepository movieRepository,
    required SharedPreferenceService sharedPreferenceService,
  }) : _movieRepository = movieRepository,
       _sharedPreferenceService = sharedPreferenceService {
    load = Command1(_load);
    _subscribeToQueryChanges();
    _subscribeToRecentSearches();
  }

  late Command1<List<Movie>, String> load;

  final MovieRepository _movieRepository;
  final SharedPreferenceService _sharedPreferenceService;

  List<Movie> _movies = [];
  List<String> _recentSearches = [];

  List<Movie> get movies => _movies;

  List<String> get recentSearches => _recentSearches;

  final StreamController<String> _searchStreamController =
      StreamController<String>();

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

  void _subscribeToQueryChanges() {
    _searchStreamController.stream.distinct().listen((query) {
      if (query.isNotEmpty) {
        load.execute(query);
        _sharedPreferenceService.addRecentSearch(query);
      } else {
        _movies = [];
        notifyListeners();
      }
    });
  }

  void _subscribeToRecentSearches() {
    _sharedPreferenceService.recentSearchesStream.listen((searches) {
      _recentSearches = searches;
      notifyListeners();
    });
  }

  void search(String query) {
    _searchStreamController.add(query);
  }

  void onDispose() {
    _searchStreamController.close();
    super.dispose();
  }
}
