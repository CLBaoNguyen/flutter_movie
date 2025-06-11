// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Movie _$MovieFromJson(Map<String, dynamic> json) => _Movie(
  trackId: (json['trackId'] as num).toInt(),
  trackName: json['trackName'] as String,
  artworkUrl100: json['artworkUrl100'] as String,
  longDescription: json['longDescription'] as String,
  currency: json['currency'] as String,
  primaryGenreName: json['primaryGenreName'] as String,
  trackPrice: (json['trackPrice'] as num).toDouble(),
  artistName: json['artistName'] as String,
);

Map<String, dynamic> _$MovieToJson(_Movie instance) => <String, dynamic>{
  'trackId': instance.trackId,
  'trackName': instance.trackName,
  'artworkUrl100': instance.artworkUrl100,
  'longDescription': instance.longDescription,
  'currency': instance.currency,
  'primaryGenreName': instance.primaryGenreName,
  'trackPrice': instance.trackPrice,
  'artistName': instance.artistName,
};
