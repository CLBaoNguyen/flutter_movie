// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Movie {

 int get trackId; String get trackName; String get artworkUrl100; String? get longDescription; String get currency; String get primaryGenreName; double get trackPrice; String get artistName;
/// Create a copy of Movie
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieCopyWith<Movie> get copyWith => _$MovieCopyWithImpl<Movie>(this as Movie, _$identity);

  /// Serializes this Movie to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Movie&&(identical(other.trackId, trackId) || other.trackId == trackId)&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.artworkUrl100, artworkUrl100) || other.artworkUrl100 == artworkUrl100)&&(identical(other.longDescription, longDescription) || other.longDescription == longDescription)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.primaryGenreName, primaryGenreName) || other.primaryGenreName == primaryGenreName)&&(identical(other.trackPrice, trackPrice) || other.trackPrice == trackPrice)&&(identical(other.artistName, artistName) || other.artistName == artistName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackId,trackName,artworkUrl100,longDescription,currency,primaryGenreName,trackPrice,artistName);

@override
String toString() {
  return 'Movie(trackId: $trackId, trackName: $trackName, artworkUrl100: $artworkUrl100, longDescription: $longDescription, currency: $currency, primaryGenreName: $primaryGenreName, trackPrice: $trackPrice, artistName: $artistName)';
}


}

/// @nodoc
abstract mixin class $MovieCopyWith<$Res>  {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) _then) = _$MovieCopyWithImpl;
@useResult
$Res call({
 int trackId, String trackName, String artworkUrl100, String? longDescription, String currency, String primaryGenreName, double trackPrice, String artistName
});




}
/// @nodoc
class _$MovieCopyWithImpl<$Res>
    implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._self, this._then);

  final Movie _self;
  final $Res Function(Movie) _then;

/// Create a copy of Movie
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trackId = null,Object? trackName = null,Object? artworkUrl100 = null,Object? longDescription = freezed,Object? currency = null,Object? primaryGenreName = null,Object? trackPrice = null,Object? artistName = null,}) {
  return _then(_self.copyWith(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as int,trackName: null == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String,artworkUrl100: null == artworkUrl100 ? _self.artworkUrl100 : artworkUrl100 // ignore: cast_nullable_to_non_nullable
as String,longDescription: freezed == longDescription ? _self.longDescription : longDescription // ignore: cast_nullable_to_non_nullable
as String?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,primaryGenreName: null == primaryGenreName ? _self.primaryGenreName : primaryGenreName // ignore: cast_nullable_to_non_nullable
as String,trackPrice: null == trackPrice ? _self.trackPrice : trackPrice // ignore: cast_nullable_to_non_nullable
as double,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Movie implements Movie {
  const _Movie({required this.trackId, required this.trackName, required this.artworkUrl100, this.longDescription, required this.currency, required this.primaryGenreName, required this.trackPrice, required this.artistName});
  factory _Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

@override final  int trackId;
@override final  String trackName;
@override final  String artworkUrl100;
@override final  String? longDescription;
@override final  String currency;
@override final  String primaryGenreName;
@override final  double trackPrice;
@override final  String artistName;

/// Create a copy of Movie
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieCopyWith<_Movie> get copyWith => __$MovieCopyWithImpl<_Movie>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Movie&&(identical(other.trackId, trackId) || other.trackId == trackId)&&(identical(other.trackName, trackName) || other.trackName == trackName)&&(identical(other.artworkUrl100, artworkUrl100) || other.artworkUrl100 == artworkUrl100)&&(identical(other.longDescription, longDescription) || other.longDescription == longDescription)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.primaryGenreName, primaryGenreName) || other.primaryGenreName == primaryGenreName)&&(identical(other.trackPrice, trackPrice) || other.trackPrice == trackPrice)&&(identical(other.artistName, artistName) || other.artistName == artistName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trackId,trackName,artworkUrl100,longDescription,currency,primaryGenreName,trackPrice,artistName);

@override
String toString() {
  return 'Movie(trackId: $trackId, trackName: $trackName, artworkUrl100: $artworkUrl100, longDescription: $longDescription, currency: $currency, primaryGenreName: $primaryGenreName, trackPrice: $trackPrice, artistName: $artistName)';
}


}

/// @nodoc
abstract mixin class _$MovieCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$MovieCopyWith(_Movie value, $Res Function(_Movie) _then) = __$MovieCopyWithImpl;
@override @useResult
$Res call({
 int trackId, String trackName, String artworkUrl100, String? longDescription, String currency, String primaryGenreName, double trackPrice, String artistName
});




}
/// @nodoc
class __$MovieCopyWithImpl<$Res>
    implements _$MovieCopyWith<$Res> {
  __$MovieCopyWithImpl(this._self, this._then);

  final _Movie _self;
  final $Res Function(_Movie) _then;

/// Create a copy of Movie
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trackId = null,Object? trackName = null,Object? artworkUrl100 = null,Object? longDescription = freezed,Object? currency = null,Object? primaryGenreName = null,Object? trackPrice = null,Object? artistName = null,}) {
  return _then(_Movie(
trackId: null == trackId ? _self.trackId : trackId // ignore: cast_nullable_to_non_nullable
as int,trackName: null == trackName ? _self.trackName : trackName // ignore: cast_nullable_to_non_nullable
as String,artworkUrl100: null == artworkUrl100 ? _self.artworkUrl100 : artworkUrl100 // ignore: cast_nullable_to_non_nullable
as String,longDescription: freezed == longDescription ? _self.longDescription : longDescription // ignore: cast_nullable_to_non_nullable
as String?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,primaryGenreName: null == primaryGenreName ? _self.primaryGenreName : primaryGenreName // ignore: cast_nullable_to_non_nullable
as String,trackPrice: null == trackPrice ? _self.trackPrice : trackPrice // ignore: cast_nullable_to_non_nullable
as double,artistName: null == artistName ? _self.artistName : artistName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
