import 'package:flutter_movie/data/repository/movie/movie_repository.dart';
import 'package:flutter_movie/data/repository/movie/movie_repository_impl.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/services/api/api_client.dart';

List<SingleChildWidget> get providers {
  return [
      Provider.value(value: ApiClient()),
      Provider(create: (context) => MovieRepositoryImpl(apiClient: context.read()) as MovieRepository),
  ];
}