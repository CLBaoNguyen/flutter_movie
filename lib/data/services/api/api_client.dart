import 'dart:convert';
import 'dart:io';

import 'package:flutter_movie/data/services/api/model/movie.dart';
import 'package:flutter_movie/util/result.dart';

class ApiClient {
  ApiClient({HttpClient Function()? clientFactory})
    : _clientFactory = clientFactory ?? HttpClient.new;

  final HttpClient Function() _clientFactory;

  Future<Result<List<Movie>>> getMovies() async {
    final client = _clientFactory();
    try {
      final request = await client.getUrl(
        Uri.parse(
          'https://itunes.apple.com/search?country=au&media=movie&;all&term=star',
        ),
      );
      final HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final mapData = jsonDecode(stringData) as Map<String, dynamic>;
        return Result.ok(
          (mapData['results'] as List<dynamic>)
              .map((e) => Movie.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }
}
