import 'dart:async';

import 'package:flutter_movie/util/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static const String _recentSearchesKey = 'recent_searches';

  final StreamController<List<String>> _recentSearchesController =
      StreamController<List<String>>();

  Stream<List<String>> get recentSearchesStream =>
      _recentSearchesController.stream;

  SharedPreferenceService() {
    _loadRecentSearches();
  }

  Future<Result<void>> addRecentSearch(String search) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final recentSearches =
          sharedPreferences.getStringList(_recentSearchesKey) ?? [];
      if (!recentSearches.contains(search)) {
        final newSearches = recentSearches.toList();
        newSearches.add(search);
        await sharedPreferences.setStringList(_recentSearchesKey, newSearches);
        _recentSearchesController.add(newSearches.reversed.take(5).toList());
      }

      return const Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  void _loadRecentSearches() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final recentSearches =
        sharedPreferences.getStringList(_recentSearchesKey) ?? [];
    _recentSearchesController.add(recentSearches);
  }
}
