import 'package:flutter_movie/data/movie_database.dart';
import 'package:flutter_movie/data/repository/movie/movie_repository.dart';
import 'package:flutter_movie/data/repository/movie/movie_repository_impl.dart';
import 'package:flutter_movie/data/shared_preference_service.dart';
import 'package:flutter_movie/ui/search/view_models/search_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/services/api/api_client.dart';

List<SingleChildWidget> get providers {
  return [
    Provider.value(value: ApiClient()),
    Provider(create: (context) => SharedPreferenceService()),
    Provider(create: (context) => MovieDatabase.instance),
    Provider(
      create: (context) =>
      MovieRepositoryImpl(apiClient: context.read(), movieDatabase: context.read()) as MovieRepository,
    ),
    ChangeNotifierProvider(
      create: (context) => SearchViewModel(
        movieRepository: context.read(),
        sharedPreferenceService: context.read(),
      ),
    ),
  ];
}
