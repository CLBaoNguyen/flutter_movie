import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    required int trackId,
    required String trackName,
    required String artworkUrl100,
    required String longDescription,
    required String currency,
    required String primaryGenreName,
    required double trackPrice,
    required String artistName,
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
